# 1. Persiapan & Instalasi

## Tools yang dibutuhkan

| Tool | Fungsi | Cek |
|---|---|---|
| Node.js 18+ | Compile script TypeScript | `node --version` |
| Java 11+ | apktool, apksigner | `java -version` |
| apktool.jar | Decompile/build APK | |
| zipalign.exe | Align APK | dari Android build-tools |
| apksigner.jar | Sign APK | dari Android build-tools |
| testkey.pk8 + testkey.x509.pem | Key untuk sign | |
| adb.exe (opsional) | Install ke HP | `adb devices` |

Taruh `apktool.jar`, `zipalign.exe`, `apksigner.jar`, `adb.exe`, `testkey.pk8`, `testkey.x509.pem`
dalam satu folder, lalu arahkan dengan `-Resources`:

```powershell
.\tools\build.ps1 ... -Resources C:\Tools\apk
```

> Default `-Resources` adalah `E:\Mod\APKToolGUI\Resources`. Ubah di `tools/build.ps1` kalau mau permanen.

## Install dependency script

```powershell
cd script
npm install
npm run build      # cek: harus menghasilkan script/dist/index.js
```

## Frida Gadget

`payload/gadget/libfrida-gadget.so` adalah **Frida Gadget 17.3.2 android-arm64**.
Mau ganti versi? Download `frida-gadget-<versi>-android-arm64.so.xz` dari
[Frida releases](https://github.com/frida/frida/releases), extract, rename jadi `libfrida-gadget.so`,
lalu timpa file di `payload/gadget/`.

> Versi gadget harus kompatibel dengan `frida-il2cpp-bridge` di `package.json`.
> Kombinasi yang sudah teruji: Gadget 17.3.2 + frida-il2cpp-bridge 0.14.0 + frida-java-bridge 7.0.13.

## Cek ABI game

Template ini untuk **arm64-v8a**. Cek APK target:

```powershell
# setelah apktool d
dir C:\Mod\Game\Game_mod\lib
```

Kalau hanya ada `armeabi-v7a`, pakai gadget `android-arm` dan jalankan build dengan `-Abi armeabi-v7a`.

## Execution policy PowerShell

> Kalau muncul error *running scripts is disabled on this system*, jalankan sekali
> `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`, atau panggil script dengan
> `powershell -ExecutionPolicy Bypass -File .\tools\build.ps1 ...`.
