# Frida Android Mod Menu Template (Permanent)

Template mod menu Android berbasis **Frida Gadget** + **frida-il2cpp-bridge** untuk game Unity IL2CPP.
Script mod di-embed ke dalam APK, jadi **berjalan permanen tanpa PC, tanpa root, tanpa `frida` CLI**.

Menu UI memakai library [frida-android-mod-menu](https://github.com/maarsalien/frida-android-mod-menu) oleh maarsalien,
dengan patch kecil supaya subtitle, ikon, ukuran, dan transparansi bisa diatur dari script.

| | Project asli | Template ini |
|---|---|---|
| Menjalankan script | `frida -U` dari PC | Embedded di APK (gadget mode `script`) |
| Butuh PC saat main | Ya | Tidak |
| Inject ke APK | Manual | `tools/build.ps1` otomatis |
| Atur ikon/subtitle/ukuran | Edit smali | Dari TypeScript (`MenuOptions`) |
| Helper hook IL2CPP | - | `hook`, `hookAllOverrides`, `findClass` |

## Struktur

```
ModMenuTemplate/
├─ script/                 Script Frida (TypeScript)
│  ├─ src/index.ts         ← file utama mod kamu
│  ├─ src/lib/bootstrap.ts Tunggu Il2Cpp + Activity siap
│  ├─ src/lib/menu.ts      Wrapper menu (ModMenu, syncState)
│  ├─ src/lib/il2cpp.ts    Helper hook
│  └─ src/examples/        Contoh mod
├─ payload/
│  ├─ gadget/              libfrida-gadget.so (arm64)
│  └─ smali/com/maars/fmenu/  Library menu (smali)
├─ tools/
│  ├─ build.ps1            Compile → inject → build → sign → install
│  └─ icon-to-ts.ps1       Konversi gambar jadi ikon menu
├─ assets/                 Gambar sumber ikon (lihat docs/04-customize.md)
└─ docs/                   Dokumentasi lengkap
```

## Quick Start

```powershell
# 1. Install dependency (sekali)
cd script
npm install
cd ..

# 2. Decompile APK target
java -jar apktool.jar d game.apk -o C:\Mod\Game\Game_mod

# 3. Edit script\src\index.ts (hook + menu)

# 4. Build, inject, sign, install
.\tools\build.ps1 -Project C:\Mod\Game\Game_mod -Out C:\Mod\Game\out\Game_ModMenu.apk -Resources C:\Tools -Install
```

Buka game, ikon menu melayang akan muncul. Selesai, tanpa PC.

> Kalau muncul error *running scripts is disabled on this system*, jalankan sekali
> `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`, atau panggil script dengan
> `powershell -ExecutionPolicy Bypass -File .\tools\build.ps1 ...`.

## Dokumentasi

1. [Persiapan & instalasi](docs/01-setup.md)
2. [Membuat mod pertama](docs/02-first-mod.md)
3. [Referensi API menu](docs/03-menu-api.md)
4. [Ganti ikon, warna, dan desain](docs/04-customize.md)
5. [Hook fungsi IL2CPP](docs/05-hooking.md)
6. [Cara kerja mode permanen](docs/06-how-it-works.md)
7. [Troubleshooting](docs/07-troubleshooting.md)

## Credits

- [maarsalien/frida-android-mod-menu](https://github.com/maarsalien/frida-android-mod-menu) — library menu UI
- [Frida](https://frida.re) — Frida Gadget
- [vfsfitvnm/frida-il2cpp-bridge](https://github.com/vfsfitvnm/frida-il2cpp-bridge) — IL2CPP API

## License

MIT, lihat [LICENSE](LICENSE). Komponen pihak ketiga: [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## Disclaimer

Gunakan hanya pada aplikasi milik sendiri atau yang kamu punya izin untuk dimodifikasi
(misalnya testing atas permintaan developer). Jangan dipakai untuk game online/kompetitif.
