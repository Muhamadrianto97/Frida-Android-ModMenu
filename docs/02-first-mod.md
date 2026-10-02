# 2. Membuat Mod Pertama

## Langkah 1 — Dump IL2CPP

Pakai Il2CppDumper dengan `libil2cpp.so` + `global-metadata.dat` dari APK.
Hasil yang penting: `dump.cs` (nama class/method) dan `DummyDll/` (bisa dibuka di dnSpy).

## Langkah 2 — Cari fungsi target

Contoh di `dump.cs`:

```csharp
// Namespace: Game.Core
public class PlayerWallet : MonoBehaviour
{
    // RVA: 0x1234ABC
    public void AddCoin(int amount) { }
}
```

Nama lengkap class = `Namespace.Class` → `Game.Core.PlayerWallet`.

## Langkah 3 — Tulis hook + menu di `script/src/index.ts`

```ts
/// <reference path="./lib/globals.d.ts" />
import { bootstrap } from "./lib/bootstrap";
import { ModMenu, syncState } from "./lib/menu";
import { findClass, hook } from "./lib/il2cpp";

const state = { coinBoost: false, multiplier: 1 };

bootstrap({ mainActivity: "com.unity3d.player.UnityPlayerActivity", tag: "[MyMod]" }, (activity, image) => {
  const Wallet = findClass(image, "Game.Core.PlayerWallet");
  if (Wallet) {
    hook(Wallet, "AddCoin", 1, function (orig, amount: number) {
      return orig(state.coinBoost ? amount * state.multiplier : amount);
    });
  }

  const menu = new ModMenu(activity, { title: "My Game Mod", subtitle: "v1.0" });
  menu.category("Currency");
  const coinBoost = menu.switchFlag("Coin Boost");
  const multiplier = menu.seekBar("Multiplier", 2, 1, 100);
  menu.attach();

  syncState(state, {
    coinBoost: () => coinBoost.get(),
    multiplier: () => multiplier.get(),
  });
});
```

Pola yang dipakai:

1. **Hook** membaca dari object `state` biasa (cepat, tanpa panggilan Java).
2. **Menu** membuat `PBoolean` / `PInteger` yang nilainya diubah user.
3. **`syncState`** menyalin nilai menu ke `state` tiap 300 ms.

## Langkah 4 — Build & install

```powershell
.\tools\build.ps1 `
  -Project C:\Mod\Game\Game_mod `
  -Out C:\Mod\Game\out\Game_ModMenu.apk `
  -Install -Device 192.168.1.10:5555
```

Tanpa `-Device`, adb memakai device USB yang terhubung.
Tanpa `-Install`, tinggal salin APK ke HP dan install manual.

> Uninstall dulu versi resmi game (signature berbeda), atau install akan gagal
> dengan `INSTALL_FAILED_UPDATE_INCOMPATIBLE`.

## Langkah 5 — Edit & build ulang

Cukup edit `index.ts`, lalu jalankan `build.ps1` yang sama.
Gadget, smali menu, dan patch `onCreate` hanya dipasang sekali; build berikutnya hanya mengganti script.

## Mode development (lebih cepat)

Daripada rebuild APK tiap edit, build sekali dengan `-Listen`:

```powershell
.\tools\build.ps1 -Project ... -Out ... -Listen -Install
cd script
npm run watch                 # terminal 1: auto compile
frida -U Gadget -l dist/index.js   # terminal 2: load script dari PC
```

Game akan menunggu PC saat dibuka. Kalau script sudah final, build ulang **tanpa** `-Listen` untuk versi permanen.
