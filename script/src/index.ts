/// <reference path="./lib/globals.d.ts" />
import { bootstrap } from "./lib/bootstrap";
import { ModMenu, syncState } from "./lib/menu";
import { findClass, hook } from "./lib/il2cpp";
import { ICON } from "./icon";

// ==== 1. Pengaturan per game ====
const TAG = "[MyMod]";
const MAIN_ACTIVITY = "com.unity3d.player.UnityPlayerActivity";

// State yang dibaca hook. Diisi dari menu lewat syncState().
const state = { featureA: false, multiplier: 1 };

bootstrap({ mainActivity: MAIN_ACTIVITY, tag: TAG }, (activity, image) => {
  // ==== 2. Hook (ganti nama class/method sesuai dump.cs) ====
  const Player = findClass(image, "Namespace.PlayerClass");
  if (Player) {
    hook(Player, "AddCoin", 1, function (orig, amount: number) {
      return orig(state.featureA ? amount * state.multiplier : amount);
    });
  } else {
    console.error(TAG, "class tidak ketemu, cek nama di dump.cs");
  }

  // ==== 3. Menu ====
  const menu = new ModMenu(activity, {
    title: "Modmenu by Atoda",
    subtitle: "v1.0",
    icon: ICON,               // dibuat dengan tools/icon-to-ts.ps1
    // colors: { menuBg: "#EE101820", textPrimary: "#FFD54F" },
  });

  menu.category("Fitur");
  const featureA = menu.switchFlag("Feature A");
  const multiplier = menu.seekBar("Multiplier", 1, 1, 50);
  menu.attach();

  syncState(state, {
    featureA: () => featureA.get(),
    multiplier: () => multiplier.get(),
  });

  console.log(TAG, "ready");
});
