# Third-Party Notices

Template ini memakai komponen dari project lain. Lisensi masing-masing tetap berlaku
untuk bagian tersebut.

## frida-android-mod-menu (maarsalien)

- Sumber: https://github.com/maarsalien/frida-android-mod-menu
- Lisensi: MIT
- Dipakai di: `payload/smali/com/maars/fmenu/` (library menu, sudah dimodifikasi:
  subtitle, ikon, ukuran, dan alpha dibaca dari `Config`)
- Project tersebut juga mengambil sebagian dari LGLTeam Android-Mod-Menu (lihat di bawah).

```
MIT License

Copyright (c) 2023 maarsalien

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Android-Mod-Menu (LGLTeam)

- Sumber: https://github.com/LGLTeam/Android-Mod-Menu
- Lisensi: GNU General Public License v3.0 (GPL-3.0)
- Hubungan: desain dan sebagian konsep menu di frida-android-mod-menu berasal dari project ini.
  Terima kasih untuk LGLTeam sebagai pelopor mod menu Android.

## Frida Gadget

- Sumber: https://frida.re / https://github.com/frida/frida
- Lisensi: wxWindows Library Licence 3.1
- Dipakai di: `payload/gadget/libfrida-gadget.so` (binary, tidak dimodifikasi)

## frida-il2cpp-bridge (vfsfitvnm)

- Sumber: https://github.com/vfsfitvnm/frida-il2cpp-bridge
- Lisensi: MIT, Copyright (c) 2021-2026 vfsfitvnm
- Dipakai sebagai dependency npm (tidak disertakan di repo)
