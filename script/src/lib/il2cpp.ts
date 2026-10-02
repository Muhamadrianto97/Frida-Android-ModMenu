import "frida-il2cpp-bridge";

/** Find a class by full name ("Namespace.Class"), returns null instead of throwing. */
export function findClass(image: Il2Cpp.Image, fullName: string): Il2Cpp.Class | null {
  try {
    return image.class(fullName);
  } catch (_) {
    return null;
  }
}

/** All loaded classes that inherit from `base` (excluding base itself). */
export function subclassesOf(image: Il2Cpp.Image, base: Il2Cpp.Class): Il2Cpp.Class[] {
  return image.classes.filter((klass) => !klass.equals(base) && klass.isSubclassOf(base, false));
}

/**
 * Replace a method implementation. `impl` receives the original (bound to `this`)
 * as first argument, followed by the original arguments.
 *
 *   hook(GameUnit, "TakeDamage", 5, function (orig, damage, ...rest) {
 *     return orig(damage, ...rest);
 *   });
 */
export function hook(
  klass: Il2Cpp.Class,
  name: string,
  argCount: number,
  impl: (this: Il2Cpp.Object | Il2Cpp.Class, orig: (...args: any[]) => any, ...args: any[]) => any
): Il2Cpp.Method {
  const method = klass.method(name, argCount);
  method.implementation = function (this: any, ...args: any[]) {
    const target = method.isStatic ? method : (method as any).bind(this);
    const orig = (...callArgs: any[]) => target.invoke(...callArgs);
    return impl.call(this, orig, ...args);
  } as any;
  return method;
}

/** Hook every override of `name` in `base` and its subclasses (useful for virtual methods). */
export function hookAllOverrides(
  image: Il2Cpp.Image,
  base: Il2Cpp.Class,
  name: string,
  argCount: number,
  impl: (this: Il2Cpp.Object, orig: (...args: any[]) => any, ...args: any[]) => any
): number {
  const seen = new Set<string>();
  for (const klass of [base, ...subclassesOf(image, base)]) {
    const method = klass.methods.find((m) => m.name === name && m.parameterCount === argCount && !m.isStatic);
    if (!method || method.virtualAddress.isNull()) continue;
    const key = method.virtualAddress.toString();
    if (seen.has(key)) continue;
    seen.add(key);
    method.implementation = function (this: any, ...args: any[]) {
      const bound = (method as any).bind(this);
      return impl.call(this, (...callArgs: any[]) => bound.invoke(...callArgs), ...args);
    } as any;
  }
  return seen.size;
}
