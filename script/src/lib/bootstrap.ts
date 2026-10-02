/// <reference path="./globals.d.ts" />
import Java from "frida-java-bridge";
import "frida-il2cpp-bridge";

(globalThis as any).Java = Java;

/**
 * Generic Il2Cpp mod-menu bootstrap.
 *
 * Usage:
 *   import { bootstrap } from "./lib/bootstrap";
 *   bootstrap({ mainActivity: "com.unity3d.player.UnityPlayerActivity" }, (activity) => { ... });
 */

export interface BootstrapOptions {
  /** Fully qualified Java activity class to wait for before building the menu. */
  mainActivity: string;
  /** Il2Cpp assembly that contains the game logic, defaults to "Assembly-CSharp". */
  assembly?: string;
  /** Log tag prefix. */
  tag?: string;
}

export function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export async function waitForActivity(className: string): Promise<Java.Wrapper> {
  for (;;) {
    let found: Java.Wrapper | null = null;
    Java.performNow(() => {
      Java.choose(className, {
        onMatch(instance) {
          found = instance;
          return "stop";
        },
        onComplete() {},
      });
    });
    if (found) return found;
    await sleep(500);
  }
}

export function bootstrap(
  options: BootstrapOptions,
  onReady: (activity: Java.Wrapper, image: Il2Cpp.Image) => void | Promise<void>
) {
  const tag = options.tag ?? "[Mod]";
  Java.perform(() => {
    Il2Cpp.perform(() => {
      run().catch((error) => console.error(tag, error.stack ?? error));
    }, "main");
  });

  async function run() {
    const image = Il2Cpp.domain.assembly(options.assembly ?? "Assembly-CSharp").image;
    const activity = await waitForActivity(options.mainActivity);
    Java.scheduleOnMainThread(() => {
      // Attach UI thread ke domain IL2CPP supaya hook & invoke aman dipanggil di sini.
      Il2Cpp.perform(() => onReady(activity, image)).catch((error: any) =>
        console.error(tag, "onReady error", error.stack ?? error)
      );
    });
  }
}
