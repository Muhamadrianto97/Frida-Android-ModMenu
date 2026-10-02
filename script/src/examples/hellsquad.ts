/// <reference path="../lib/globals.d.ts" />
import { bootstrap } from "../lib/bootstrap";
import { ModMenu, syncState } from "../lib/menu";
import { findClass, subclassesOf } from "../lib/il2cpp";
import { ICON } from "../icon";

// Contoh mod STONE RRRUSH (net.lightcon.projectscwp):
// One Hit Kill Monster, God Mode (hero + base), Soul Multiplier.
// Build: .\tools\build.ps1 -Entry src/examples/hellsquad.ts -Project ... -Out ...

const TAG = "[HellsquadMod]";
const state = { oneHitKill: false, godMode: false, soulMultiplier: 1 };

bootstrap({ mainActivity: "com.unity3d.player.UnityPlayerActivity", tag: TAG }, (activity, image) => {
  const GameUnit = findClass(image, "Rush.In.Game.FieldObject.GameUnit")!;
  const Monster = findClass(image, "Rush.In.Game.FieldObject.Monster")!;
  const Hero = findClass(image, "Rush.In.Game.FieldObject.Hero")!;
  const GamePlay = findClass(image, "Rush.In.Game.Core.GamePlay")!;
  const SoulManager = findClass(image, "Rush.In.Game.Core.SoulManager")!;

  const ZERO = int64(0);
  const ONE = int64(1);
  const MONSTER = 1;
  const HERO = 2;

  const kindCache = new Map<string, number>();
  function unitKind(unit: Il2Cpp.Object): number {
    const klass = unit.class;
    const key = klass.handle.toString();
    let kind = kindCache.get(key);
    if (kind === undefined) {
      if (klass.equals(Monster) || klass.isSubclassOf(Monster, false)) kind = MONSTER;
      else if (klass.equals(Hero) || klass.isSubclassOf(Hero, false)) kind = HERO;
      else kind = 0;
      kindCache.set(key, kind);
    }
    return kind;
  }

  function isDead(unit: Il2Cpp.Object): boolean {
    try {
      return unit.method<boolean>("get_IsDead").invoke();
    } catch (_) {
      return true;
    }
  }

  // TakeDamage(long, ...) di GameUnit dan semua override-nya
  const hooked = new Set<string>();
  for (const klass of [GameUnit, ...subclassesOf(image, GameUnit)]) {
    for (const method of klass.methods) {
      if (method.name !== "TakeDamage" || method.isStatic) continue;
      const first = method.parameters[0];
      if (!first || first.type.name !== "System.Int64") continue;
      if (method.virtualAddress.isNull()) continue;
      const key = method.virtualAddress.toString();
      if (hooked.has(key)) continue;
      hooked.add(key);

      method.implementation = function (this: Il2Cpp.Object, damage: Int64, ...rest: any[]) {
        const original = (method as any).bind(this);
        const kind = unitKind(this);

        if (state.godMode && kind === HERO) return original.invoke(ZERO, ...rest);
        if (!state.oneHitKill || kind !== MONSTER || isDead(this)) return original.invoke(damage, ...rest);

        try {
          this.method("SetCurrentHP", 1).invoke(ONE);
        } catch (_) {}
        const result = original.invoke(damage, ...rest);
        if (!isDead(this)) {
          try {
            const hitter = rest[0] instanceof Il2Cpp.Object ? rest[0] : null;
            this.method("Kill", 1).invoke(hitter as any);
          } catch (error: any) {
            console.error(TAG, "kill fallback failed", error.message ?? error);
          }
        }
        return result;
      } as any;
    }
  }
  console.log(TAG, `hooked ${hooked.size} TakeDamage methods`);

  const baseTakeDamage = GamePlay.method("BaseTakeDamage", 1);
  baseTakeDamage.implementation = function (this: Il2Cpp.Object, damage: Int64) {
    if (state.godMode) return;
    return (baseTakeDamage as any).bind(this).invoke(damage);
  } as any;

  const addSoul = SoulManager.method("AddSoul", 1);
  addSoul.implementation = function (this: Il2Cpp.Object, point: number) {
    const boosted = point > 0 && state.soulMultiplier > 1 ? Math.round(point * state.soulMultiplier) : point;
    return (addSoul as any).bind(this).invoke(boosted);
  } as any;

  const menu = new ModMenu(activity, {
    title: "Modmenu by Atoda",
    subtitle: "Hellsquad Rrrush &bull; v1.0",
    icon: ICON,
  });
  menu.category("Combat");
  const oneHitKill = menu.switchFlag("One Hit Kill Monster");
  const godMode = menu.switchFlag("God Mode (Hero + Base)");
  menu.category("Resource");
  const soulMultiplier = menu.seekBar("Soul Multiplier", 1, 1, 20);
  menu.attach();

  syncState(state, {
    oneHitKill: () => oneHitKill.get(),
    godMode: () => godMode.get(),
    soulMultiplier: () => soulMultiplier.get(),
  });
  console.log(TAG, "menu ready");
});
