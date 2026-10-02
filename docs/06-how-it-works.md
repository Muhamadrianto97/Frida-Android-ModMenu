# 6. Cara Kerja Mode Permanen

## Alur saat game dibuka

```
UnityPlayerActivity.onCreate()
  └─ System.loadLibrary("frida-gadget")         ← patch smali dari build.ps1
       └─ libfrida-gadget.so baca libfrida-gadget.config.so
            └─ interaction.type = "script"
                 └─ load lib<ScriptLib>.so (script JS hasil compile)
                      └─ bootstrap(): tunggu Il2Cpp + Activity → hook + menu
```

Karena script dimuat dari dalam APK, tidak ada koneksi ke PC sama sekali.

## Apa yang dilakukan `tools/build.ps1`

| Langkah | Detail |
|---|---|
| Compile | `frida-compile src/index.ts -o dist/index.js -c` |
| Gadget | Salin `libfrida-gadget.so` ke `lib/<Abi>/` |
| Config | Tulis `libfrida-gadget.config.so` (mode `script` atau `listen`) |
| Script | Salin `dist/index.js` jadi `lib/lib<ScriptLib>.so` |
| Smali menu | Salin `com/maars/fmenu` ke `smali_classesN` baru (sekali) |
| Patch activity | Sisipkan `loadLibrary("frida-gadget")` di awal `onCreate` (sekali) |
| Manifest | Ubah `extractNativeLibs="false"` jadi `true` kalau ada |
| Build | `apktool b` → `zipalign -p 4` → `apksigner` (testkey) |
| Install | `adb install -r` (kalau `-Install`) |

Script disimpan dengan ekstensi `.so` supaya ikut di-extract Android ke folder native lib,
di mana gadget bisa membacanya.

## Parameter `build.ps1`

| Parameter | Default | Keterangan |
|---|---|---|
| `-Project` | (wajib) | Folder hasil `apktool d` |
| `-Out` | (wajib) | Path APK hasil |
| `-Activity` | `com.unity3d.player.UnityPlayerActivity` | Activity yang di-patch |
| `-ScriptLib` | `modmenu` | Nama file script → `libmodmenu.so` |
| `-Abi` | `arm64-v8a` | Folder ABI |
| `-Resources` | `E:\Mod\APKToolGUI\Resources` | Folder apktool/zipalign/apksigner/adb/testkey |
| `-SkipCompile` | - | Pakai `dist/index.js` yang sudah ada |
| `-Listen` | - | Mode dev: gadget menunggu koneksi Frida dari PC |
| `-Install` | - | Install via adb setelah build |
| `-Device` | - | `ip:port` untuk adb wireless |

## Mencari activity utama (game non-Unity)

```powershell
Select-String -Path C:\Mod\Game\Game_mod\AndroidManifest.xml -Pattern 'android.intent.action.MAIN' -Context 8,0
```

Ambil `android:name` dari `<activity>` yang punya intent `MAIN`, lalu:

```powershell
.\tools\build.ps1 ... -Activity com.example.game.MainActivity
```

## Patch smali menu

Library menu di `payload/smali` sudah dimodifikasi dari versi asli supaya beberapa nilai
benar-benar dibaca dari `Config` (versi asli meng-hardcode nilainya):

| Field Config | Sebelum | Sesudah |
|---|---|---|
| `MENU_SUBTITLE` | string hardcoded | `iget-object Config->MENU_SUBTITLE` |
| `MENU_LAUNCHER_ICON` | base64 hardcoded | `iget-object Config->MENU_LAUNCHER_ICON` |
| `MENU_LAUNCHER_ICON_SIZE` | `45.0f` | `iget` + `int-to-float` |
| `MENU_WIDTH` | `0x122` (290) | `iget Config->MENU_WIDTH` |
| `MENU_HEIGHT` | `0xd2` (210) | `iget Config->MENU_HEIGHT` |
| `MENU_COLLAPSED_ALPHA` | `0.7f` | `iget Config->MENU_COLLAPSED_ALPHA` |

Semua perubahan ada di method `Init()` pada `Menu.smali`.

## Proteksi tambahan

Beberapa game punya pengecekan lisensi/signature (contoh: pairip `LicenseClient.checkLicense`).
Ini **tidak** ditangani otomatis karena beda tiap game. Patch manual di smali,
contohnya membuat method langsung `return-void`, lalu jalankan `build.ps1` lagi.
