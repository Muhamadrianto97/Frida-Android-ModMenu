# 7. Troubleshooting

Lihat log script di HP:

```powershell
adb logcat -s Frida:V
adb logcat | Select-String "MyMod|Frida|AndroidRuntime"
```

`console.log` dari script muncul dengan tag `Frida`.

| Masalah | Penyebab | Solusi |
|---|---|---|
| `running scripts is disabled` | Execution policy Windows | `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | Signature beda dengan versi terpasang | Uninstall game asli dulu |
| `INSTALL_FAILED_INVALID_APK` / split | Game dari XAPK/split APK | Merge split dulu (APKEditor `m`) lalu `apktool d` hasil merge |
| Game langsung force close | Gadget/ABI salah, atau proteksi anti-tamper | Cek `adb logcat`; pastikan `-Abi` cocok; patch proteksi |
| Game hang di splash | Config mode `listen` (`on_load: wait`) | Build ulang tanpa `-Listen` |
| Menu tidak muncul | Nama activity salah / izin overlay | Cek `-Activity`; cek log `menu error` |
| `class not found` | Nama class salah | Pakai `Namespace.Class` persis dari `dump.cs` |
| `couldn't find method X` | `argCount` salah / overload | Cek jumlah parameter di `dump.cs` |
| Hook tidak terpanggil | Method di-override subclass | Pakai `hookAllOverrides` |
| Game crash saat hook | Tipe argumen salah (mis. `long` dikirim `number`) | Pakai `int64()` untuk `long` |
| `Cannot find name 'console'` | Reference globals hilang | Tambah `/// <reference path="./lib/globals.d.ts" />` di `index.ts` |
| `onCreate(Bundle) ... tidak ketemu` | Activity tidak override `onCreate` | Pilih activity lain atau patch manual |
| `apktool build gagal` | Resource error | Coba `apktool d -r` (tanpa decode resource) |

## Cek apakah gadget ter-load

```powershell
adb shell "cat /proc/`$(pidof <package>)/maps | grep frida"
```

Kalau ada `libfrida-gadget.so`, gadget berhasil dimuat. Kalau script tidak jalan, cek isi
`lib/<Abi>/libfrida-gadget.config.so` dan pastikan `path` cocok dengan nama file script.
