# 4. Ganti Ikon, Warna, dan Desain

Semua tampilan diatur lewat opsi kedua `new ModMenu(activity, options)`. Tidak perlu edit smali.

## Judul & subtitle

```ts
new ModMenu(activity, {
  title: "Hellsquad Mod",
  subtitle: "v1.0 &bull; by <font color='#FFD54F'><b>kamu</b></font>",
});
```

`title` dan `subtitle` mendukung HTML sederhana (`<b>`, `<i>`, `<u>`, `<font color>`, `<br>`, entity seperti `&bull;`).

## Ganti ikon

1. Siapkan gambar PNG/JPG. Gambar otomatis di-crop ke tengah jadi persegi dan di-resize (default 192 px). Pakai PNG transparan kalau mau ikon tanpa background.
2. Konversi:

   ```powershell
   .\tools\icon-to-ts.ps1 -Image C:\path\icon.jpg
   .\tools\icon-to-ts.ps1 -Image C:\path\icon.png -Size 256   # ukuran lain
   ```

   Hasilnya `script/src/icon.ts` berisi `export const ICON = "..."`.
3. Pakai:

   ```ts
   import { ICON } from "./icon";
   new ModMenu(activity, { icon: ICON, iconSize: 50 });
   ```

> Base64 ikon ikut masuk ke script. Dengan resize 192 px, ukurannya biasanya cuma 5–30 KB.

## Ukuran & transparansi

| Opsi | Default | Satuan |
|---|---|---|
| `width` | 290 | dp, lebar panel menu |
| `height` | 210 | dp, tinggi area fitur (bisa di-scroll) |
| `iconSize` | 45 | dp, ukuran ikon melayang |
| `collapsedAlpha` | 0.7 | 0–1, transparansi ikon |
| `hideButtonText` | `&#x25B3;` (△) | teks tombol minimize |
| `closeButtonText` | `&#x2715;` (✕) | teks tombol close |

## Warna

Format `"#RRGGBB"` atau `"#AARRGGBB"` (AA = alpha/transparansi).

```ts
new ModMenu(activity, {
  colors: {
    menuBg: "#EE0D1117",
    featureBg: "#DD161B22",
    categoryBg: "#30363D",
    textPrimary: "#58A6FF",
    buttonOn: "#238636",
    buttonOff: "#DA3633",
    seekbar: "#58A6FF",
    seekbarProgress: "#58A6FF",
  },
});
```

| Key | Bagian | Default |
|---|---|---|
| `menuBg` | Background panel | `#EE1C2A35` |
| `featureBg` | Background area fitur | `#DD141C22` |
| `menuButtonBg` | Background tombol | `#1C262D` |
| `categoryBg` | Background kategori | `#2F3D4C` |
| `collapseBg` | Background grup collapse | `#222D38` |
| `textPrimary` | Judul & teks utama | `#82CAFD` |
| `textSecondary` | Teks fitur | `#FFFFFF` |
| `numberText` | Angka seekbar/input | `#41C300` |
| `buttonOn` / `buttonOff` | `buttonOnOff` | `#1B5E20` / `#7F0000` |
| `checkbox` | Checkbox | `#80CBC4` |
| `radioButton` | Radio button | `#FFFFFF` |
| `seekbar` / `seekbarProgress` | Slider | `#80CBC4` |
| `seekbarNegative` / `seekbarPositive` | Warna angka slider | `#FF0000` / `#00FF00` |

## Contoh tema

```ts
// Dark Red
colors: { menuBg: "#EE1A0A0A", featureBg: "#DD220E0E", categoryBg: "#5C1A1A",
          textPrimary: "#FF6B6B", seekbar: "#FF6B6B", seekbarProgress: "#FF6B6B", checkbox: "#FF6B6B" }

// Purple
colors: { menuBg: "#EE1B1028", featureBg: "#DD150C20", categoryBg: "#3D2466",
          textPrimary: "#C792EA", seekbar: "#C792EA", seekbarProgress: "#C792EA", checkbox: "#C792EA" }
```

## Desain lebih jauh (layout, font, bentuk)

Hal yang tidak ada di opsi (bentuk sudut, font, posisi awal, animasi) harus diubah di
`payload/smali/com/maars/fmenu/Menu.smali`, method `Init()`.

Cara paling nyaman:

1. Ambil source Java dari [repo asli](https://github.com/maarsalien/frida-android-mod-menu).
2. Edit `Menu.java`, compile jadi APK kecil dengan Android Studio.
3. `apktool d` APK tersebut, ambil folder `smali*/com/maars/fmenu/`, timpa `payload/smali/com/maars/fmenu/`.
4. Pastikan nama package dan method publik tetap sama supaya `menu.ts` masih cocok.

> Kalau mengganti smali dari repo asli, patch kecil template ini (subtitle/ikon/ukuran dibaca dari Config)
> ikut hilang. Lihat [06-how-it-works.md](06-how-it-works.md#patch-smali-menu) untuk daftar patch-nya.
