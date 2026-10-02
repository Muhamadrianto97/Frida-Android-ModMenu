import Java from "frida-java-bridge";

/**
 * Semua opsi tampilan menu. Semua field opsional, default-nya mengikuti Config bawaan.
 * Warna memakai format Android: "#RRGGBB" atau "#AARRGGBB".
 */
export interface MenuOptions {
  title?: string;
  /** Mendukung HTML sederhana, contoh: "<b>v1.0</b> by <font color='#ff0'>kamu</font>" */
  subtitle?: string;
  /** PNG/JPG dalam bentuk base64 (tanpa prefix data:). Buat dengan tools/icon-to-ts.ps1 */
  icon?: string;
  /** Ukuran ikon melayang (dp). Default 45 */
  iconSize?: number;
  /** Lebar menu (dp). Default 290 */
  width?: number;
  /** Tinggi area fitur (dp). Default 210 */
  height?: number;
  /** Transparansi ikon saat menu ditutup, 0.0 - 1.0. Default 0.7 */
  collapsedAlpha?: number;
  /** Teks tombol hide/close, boleh HTML entity. */
  hideButtonText?: string;
  closeButtonText?: string;
  colors?: Partial<MenuColors>;
}

export interface MenuColors {
  menuBg: string;
  featureBg: string;
  menuButtonBg: string;
  categoryBg: string;
  collapseBg: string;
  textPrimary: string;
  textSecondary: string;
  numberText: string;
  buttonOn: string;
  buttonOff: string;
  checkbox: string;
  radioButton: string;
  seekbar: string;
  seekbarProgress: string;
  seekbarNegative: string;
  seekbarPositive: string;
}

const COLOR_FIELDS: Record<keyof MenuColors, string> = {
  menuBg: "MENU_BG_COLOR",
  featureBg: "MENU_FEATURE_BG_COLOR",
  menuButtonBg: "MENU_BUTTON_BG_COLOR",
  categoryBg: "MENU_CATEGORY_BG_COLOR",
  collapseBg: "COLLAPSE_BG_COLOR",
  textPrimary: "TEXT_COLOR_PRIMARY",
  textSecondary: "TEXT_COLOR_SECONDARY",
  numberText: "NUMBER_TEXT_COLOR",
  buttonOn: "BTN_ON_BG_COLOR",
  buttonOff: "BTN_OFF_BG_COLOR",
  checkbox: "CHECKBOX_COLOR",
  radioButton: "RADIO_BUTTON_COLOR",
  seekbar: "SEEKBAR_COLOR",
  seekbarProgress: "SEEKBAR_PROGRESS_COLOR",
  seekbarNegative: "SEEKBAR_NUMBER_NEG_COLOR",
  seekbarPositive: "SEEKBAR_NUMBER_POS_COLOR",
};

let runnableCounter = 0;

/**
 * Wrapper untuk library menu com.maars.fmenu (smali di payload/smali).
 * Harus dipanggil di main thread (bootstrap() sudah mengurus ini).
 */
export class ModMenu {
  private menu: Java.Wrapper;

  constructor(activity: Java.Wrapper, options: MenuOptions = {}) {
    const Config = Java.use("com.maars.fmenu.Config");
    const Menu = Java.use("com.maars.fmenu.Menu");
    const Color = Java.use("android.graphics.Color");
    const config = Config.$new();

    if (options.title !== undefined) config.MENU_TITLE.value = options.title;
    if (options.subtitle !== undefined) config.MENU_SUBTITLE.value = options.subtitle;
    if (options.icon !== undefined) config.MENU_LAUNCHER_ICON.value = options.icon;
    if (options.iconSize !== undefined) config.MENU_LAUNCHER_ICON_SIZE.value = options.iconSize;
    if (options.width !== undefined) config.MENU_WIDTH.value = options.width;
    if (options.height !== undefined) config.MENU_HEIGHT.value = options.height;
    if (options.collapsedAlpha !== undefined) config.MENU_COLLAPSED_ALPHA.value = options.collapsedAlpha;
    if (options.hideButtonText !== undefined) config.MENU_HIDE_BUTTON_TEXT.value = options.hideButtonText;
    if (options.closeButtonText !== undefined) config.MENU_CLOSE_BUTTON_TEXT.value = options.closeButtonText;

    for (const key in options.colors ?? {}) {
      const value = options.colors![key as keyof MenuColors];
      const field = COLOR_FIELDS[key as keyof MenuColors];
      if (value && field) config[field].value = Color.parseColor(value);
    }

    this.menu = Menu.$new(activity, config);
  }

  switchFlag(label: string, initial = false) {
    const flag = Java.use("com.maars.fmenu.PBoolean").of(initial);
    this.menu.Switch(label, flag);
    return flag;
  }

  checkBox(label: string, initial = false) {
    const flag = Java.use("com.maars.fmenu.PBoolean").of(initial);
    this.menu.CheckBox(label, flag);
    return flag;
  }

  /** Tombol toggle ON/OFF (warna buttonOn / buttonOff). */
  buttonOnOff(label: string, initial = false) {
    const flag = Java.use("com.maars.fmenu.PBoolean").of(initial);
    this.menu.ButtonOnOff(label, flag);
    return flag;
  }

  seekBar(label: string, initial: number, min: number, max: number, step?: number) {
    const value = Java.use("com.maars.fmenu.PInteger").of(initial);
    if (step !== undefined) this.menu.SeekBar(label, value, min, max, step);
    else this.menu.SeekBar(label, value, min, max);
    return value;
  }

  radioButton(label: string, choices: string[], initial = 0) {
    const value = Java.use("com.maars.fmenu.PInteger").of(initial);
    this.menu.RadioButton(label, Java.array("java.lang.String", choices), value);
    return value;
  }

  inputNum(label: string, initial: number) {
    const value = Java.use("com.maars.fmenu.PInteger").of(initial);
    this.menu.InputNum(label, value);
    return value;
  }

  inputText(label: string, initial: string) {
    const value = Java.use("com.maars.fmenu.PString").of(initial);
    this.menu.InputText(label, value);
    return value;
  }

  buttonAction(label: string, onClick: () => void) {
    const Runnable = Java.use("java.lang.Runnable");
    const Impl = Java.registerClass({
      name: `com.maars.fmenu.gen.Action${runnableCounter++}`,
      implements: [Runnable],
      methods: { run: onClick },
    });
    this.menu.ButtonAction(label, Impl.$new());
  }

  buttonLink(label: string, url: string) {
    this.menu.ButtonLink(label, url);
  }

  category(label: string) {
    this.menu.Category(label);
  }

  textView(html: string) {
    this.menu.TextView(html);
  }

  webTextView(html: string) {
    this.menu.WebTextView(html);
  }

  /** Grup fitur yang bisa dilipat. Semua fitur yang dibuat di dalam callback masuk ke grup. */
  collapse(label: string, build: () => void) {
    this.menu.startCollapse(label);
    try {
      build();
    } finally {
      this.menu.endCollapse();
    }
  }

  attach() {
    this.menu.attach();
  }

  detach() {
    this.menu.detach();
  }
}

/** Salin nilai PBoolean/PInteger/PString ke object state biasa secara berkala. */
export function syncState<T extends Record<string, any>>(
  state: T,
  getters: { [K in keyof T]?: () => T[K] },
  intervalMs = 300
) {
  setInterval(() => {
    Java.perform(() => {
      for (const key in getters) {
        const getter = getters[key];
        if (getter) state[key] = getter();
      }
    });
  }, intervalMs);
}
