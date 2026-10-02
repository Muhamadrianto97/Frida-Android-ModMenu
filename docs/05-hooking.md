# 5. Hook Fungsi IL2CPP

Helper ada di `script/src/lib/il2cpp.ts`. Semua dipanggil di dalam callback `bootstrap()`,
yang memberikan `image` (default `Assembly-CSharp`).

## `findClass(image, "Namespace.Class")`

Return `Il2Cpp.Class` atau `null` kalau tidak ketemu (tidak melempar error).

```ts
const GameUnit = findClass(image, "Rush.In.Game.FieldObject.GameUnit");
```

Class tanpa namespace cukup ditulis namanya: `findClass(image, "PlayerData")`.

## `hook(klass, method, argCount, impl)`

Mengganti implementasi method. `orig` sudah terikat ke `this`, tinggal dipanggil.

```ts
hook(GamePlay, "BaseTakeDamage", 1, function (orig, damage: Int64) {
  if (state.godMode) return;          // skip, base tidak kena damage
  return orig(damage);
});
```

`argCount` wajib untuk membedakan overload (`TakeDamage(long)` vs `TakeDamage(long, Object, ...)`).

## `hookAllOverrides(image, base, method, argCount, impl)`

Untuk method `virtual` yang di-override subclass (misalnya `Monster.TakeDamage` override `GameUnit.TakeDamage`).
Hook di base class saja **tidak cukup** kalau subclass punya implementasi sendiri.

```ts
const count = hookAllOverrides(image, GameUnit, "TakeDamage", 5, function (orig, damage: Int64, ...rest) {
  return orig(damage, ...rest);
});
console.log("hooked", count);
```

## Tipe argumen

| C# | Frida (TypeScript) | Membuat nilai |
|---|---|---|
| `int`, `float`, `double` | `number` | `100` |
| `long` | `Int64` | `int64(100)` |
| `ulong` | `UInt64` | `uint64(100)` |
| `bool` | `boolean` | `true` |
| `string` | `Il2Cpp.String` | `Il2Cpp.string("abc")` |
| class | `Il2Cpp.Object` | - |
| struct | `Il2Cpp.ValueType` | - |

## Membaca field & memanggil method

```ts
hook(Hero, "Update", 0, function (orig) {
  const self = this as Il2Cpp.Object;
  const hp = self.field<Int64>("currentHP").value;
  if (state.godMode) self.method("SetCurrentHP", 1).invoke(int64(999999));
  return orig();
});
```

## Static method & singleton

```ts
const Manager = findClass(image, "Game.SoulManager")!;
const instance = Manager.method<Il2Cpp.Object>("get_Instance").invoke();
instance.method("AddSoul", 1).invoke(1000);
```

## Cek tipe object

```ts
const Monster = findClass(image, "Game.Monster")!;
function isMonster(obj: Il2Cpp.Object) {
  return obj.class.equals(Monster) || obj.class.isSubclassOf(Monster, false);
}
```

Cache hasilnya per `obj.class.handle` kalau dipanggil di hook yang sangat sering (lihat `examples/hellsquad.ts`).

## Tips performa

- Jangan panggil `Java.perform` / `.get()` menu di dalam hook. Pakai `syncState` + object `state`.
- Hook `Update()` dipanggil tiap frame. Hindari kecuali benar-benar perlu.
- Hindari `console.log` di hook yang sering terpanggil.

## Contoh nyata

`script/src/examples/hellsquad.ts` berisi mod lengkap STONE RRRUSH:
One Hit Kill Monster, God Mode (hero + base), dan Soul Multiplier.
