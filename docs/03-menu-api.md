# 3. Referensi API Menu

Semua ada di `script/src/lib/menu.ts`. Buat menu **di dalam callback `bootstrap()`** (sudah berjalan di main thread).

```ts
const menu = new ModMenu(activity, { title: "Judul", subtitle: "Sub" });
// ... tambah fitur ...
menu.attach();   // wajib, tampilkan menu
```

## Fitur

| Method | Return | Keterangan |
|---|---|---|
| `switchFlag(label, initial?)` | `PBoolean` | Switch on/off |
| `checkBox(label, initial?)` | `PBoolean` | Checkbox |
| `buttonOnOff(label, initial?)` | `PBoolean` | Tombol toggle berwarna ON/OFF |
| `seekBar(label, initial, min, max, step?)` | `PInteger` | Slider angka |
| `radioButton(label, choices[], initial?)` | `PInteger` | Pilihan, nilainya index |
| `inputNum(label, initial)` | `PInteger` | Input angka (dialog) |
| `inputText(label, initial)` | `PString` | Input teks (dialog) |
| `buttonAction(label, onClick)` | - | Tombol yang menjalankan fungsi |
| `buttonLink(label, url)` | - | Tombol yang membuka URL |
| `category(label)` | - | Judul kategori |
| `textView(html)` | - | Teks (HTML sederhana) |
| `webTextView(html)` | - | Teks via WebView (HTML penuh) |
| `collapse(label, build)` | - | Grup fitur yang bisa dilipat |
| `attach()` / `detach()` | - | Tampilkan / hapus menu |

Nilai dibaca dengan `.get()` dan bisa diubah dengan `.set(v)`.

## Contoh lengkap

```ts
const menu = new ModMenu(activity, { title: "Demo" });

menu.category("Player");
const god = menu.switchFlag("God Mode");
const speed = menu.seekBar("Speed", 1, 1, 10);

menu.collapse("Currency", () => {
  menu.inputNum("Set Coin", 0);
  menu.buttonAction("Add 1000 Coin", () => addCoin(1000));
});

menu.category("Lainnya");
const mode = menu.radioButton("Mode", ["Normal", "Hard", "Insane"]);
menu.textView("<font color='#FFD54F'>Dibuat untuk testing</font>");
menu.buttonLink("GitHub", "https://github.com/username");

menu.attach();
```

## Membaca nilai menu

Pilih salah satu:

**A. `syncState` (direkomendasikan untuk hook yang sering terpanggil)**

```ts
const state = { god: false, speed: 1 };
syncState(state, { god: () => god.get(), speed: () => speed.get() });
// di hook: if (state.god) ...
```

**B. Baca langsung** (untuk hook yang jarang dipanggil)

```ts
Java.perform(() => { if (god.get()) { ... } });
```

## Memanggil IL2CPP dari tombol

`buttonAction` berjalan di thread Java (UI). Untuk memanggil method IL2CPP, sebaiknya jadwalkan ke thread game:

```ts
menu.buttonAction("Add Soul", () => {
  Il2Cpp.mainThread.schedule(() => {
    const manager = SoulManager.method("get_Instance").invoke() as Il2Cpp.Object;
    manager.method("AddSoul").invoke(1000);
  });
});
```
