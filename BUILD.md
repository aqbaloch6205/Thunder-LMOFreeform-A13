# Thunder LMO Freeform (Android 13)

Floating (freeform) windows for **Android 13** custom ROMs, ported from
[LibreMobileOS LMOFreeform](https://github.com/LibreMobileOS) (Android 14+). Apps run on a
VirtualDisplay and are shown in a movable, resizable overlay window. Built for ROM developers
who can edit their own system image: you apply **one smali hook** and drop in a few files.
No Xposed, no Magisk module, no signature spoofing.

What you get:
- Floating windows with title bar (pin / maximize / close), resize, hang-up (pin to corner), back button or gesture pill.
- **Smart window size**: portrait apps get a portrait window, landscape apps (games, video) a 16:9 window; rotation and `setRequestedOrientation` reshape the window live.
- **Minimize stack**: the pin button (or shrinking a window) hides the window and puts it in one floating bubble at the screen edge. Tap = restore (several apps: expand the list, tap an icon to restore, long-press to close). The app keeps running, nothing lags in games.
- **Live resize**: the app re-lays out while you drag the corner, any size or shape.
- **ThunderPad (iPad view)**: pick any app and a tablet resolution (iPad mini 5 2048x1536, iPad 10.2/Air/Pro, or custom WxH + dpi). The app runs fullscreen on a virtual display with that resolution, so it shows its tablet layout on your phone. Default **Fill** looks like a normal fullscreen app; **Original** / **Stretch** are available too. Home or another app hides it (app keeps running), reopen from the sidebar.
- **Per-app profile**: force orientation, width %, height %, dpi for any app.
- **Sidebar** inside `system_server`: open it by swiping in from the edge (taps do nothing, so it never triggers by accident in games). "All apps" is a cached system overlay (instant); long-press an app there to pin it. Open/close with a hardware key via one smali line.
- A small settings app (`FreeformLauncher.apk`).

Tested on LG V60 (Thunder OS, LG-stock based A13). Other A13 ROMs should work, but expect to adjust things.

---

## 1. Requirements

- A13 ROM you can modify (decompiled `services.jar`, ability to push files to `/system`).
- A GitHub account (the build runs on GitHub Actions, nothing to install locally).
- `adb` with root, or a way to edit the system image.

## 2. Build (GitHub Actions)

1. Fork / upload this repository to your GitHub account.
2. Open **Actions → Build LMOFreeform (A13) → Run workflow** (it also runs on every push to `main`).
3. When it finishes, download the artifact **LMOFreeform-A13**. It contains:

| File | What it is |
|---|---|
| `classes-lmofreeform.dex` (+ `classes-lmofreeform2.dex` if present) | Server + sidebar code. Goes **into `services.jar`**. |
| `LMOFreeform.apk` | Resources only (window layout, icons). No code. |
| `FreeformLauncher.apk` | Settings screen + app picker. |

The build needs no Gradle: it uses kotlinc, a hidden-API `android.jar` (downloaded from
[Reginer/aosp-android-jar](https://github.com/Reginer/aosp-android-jar), android-33), d8, aapt2 and apksigner.
To build locally instead: `bash tools/build.sh` (Linux, JDK 17, Android SDK build-tools).

## 3. Install

### 3.1 Add the dex to `services.jar`
Copy the dex file(s) into `services.jar` using the **next free name**: if it already has
`classes.dex … classes4.dex`, add yours as `classes5.dex` (and `classes6.dex`). Example:

```
cp services.jar services.zip && unzip -l services.zip | grep classes
zip -j services.zip classes5.dex      # after renaming classes-lmofreeform.dex -> classes5.dex
```
Keep the jar's original compression/alignment and signature handling as your ROM expects.

### 3.2 Add the smali hook (the only code change)
In `com/android/server/SystemServer.smali`, method `startOtherServices`, right **after** the call to
`ActivityManagerService.systemReady(...)`, insert (adapt the register to a free one; `v64` below is
the `Context` register in our ROM, `v2` is a scratch register):

```smali
    move-object/from16 v2, v64
    :lmo_try_start
    invoke-static {v2}, Lcom/libremobileos/freeform/server/LMOFreeformBoot;->start(Landroid/content/Context;)V
    :lmo_try_end
    .catchall {:lmo_try_start .. :lmo_try_end} :lmo_catch
    goto :lmo_done
    :lmo_catch
    move-exception v2
    :lmo_done
```
It is wrapped in try/catch, so a failure here can never break boot. A reference copy is in `hooks/`.

### 3.3 Install the APKs
```
/system/priv-app/LMOFreeform/LMOFreeform.apk              (644, root:root)
/system/priv-app/FreeformLauncher/FreeformLauncher.apk    (644, root:root)
```
Make sure your ROM has the freeform feature enabled:
`/system/etc/permissions/android.software.freeform_window_management.xml`.

### 3.4 Delete the old compiled code, clear cache (important!)
Otherwise ART keeps running the old compiled `services` and never loads your new dex:
```
rm -f /system/framework/oat/arm64/services.art /system/framework/oat/arm64/services.odex /system/framework/oat/arm64/services.vdex
rm -rf /data/dalvik-cache/*
reboot
```

## 4. Verify

```
logcat -b all -d | grep -i LMOFreeform
```
You should see `LMOFreeform (A13 port) started`.

```
# open an app in a floating window
am broadcast -a com.libremobileos.freeform.START_FREEFORM --es packageName com.android.settings
# toggle the sidebar
am broadcast -a com.libremobileos.freeform.TOGGLE_SIDEBAR
```
More logs: `setprop log.tag.LMOFreeform DEBUG`.

## 5. Open/close the sidebar with a key

Put this line in your key handler smali (e.g. `PhoneWindowManager`):
```smali
invoke-static {}, Lcom/libremobileos/freeform/server/LMOFreeformApi;->toggleSidebar()V
```
`openSidebar()V` and `closeSidebar()V` also exist. They are thread-safe and never throw.

## 6. Configuration

Everything is a `Settings.System` value, so you can use the settings app, `settings put system …`, or broadcast
`com.libremobileos.freeform.SET_CONFIG` with `lmo_*` extras.

| Key | Meaning (default) |
|---|---|
| `lmo_freeform_width_pct` / `lmo_freeform_height_pct` | Portrait window size, % of screen (90 / 62) |
| `lmo_freeform_land_height_pct` | Window height when the device itself is landscape (85) |
| `lmo_freeform_dpi` | Window dpi, 0 = system dpi |
| `lmo_freeform_profiles` | Per-app overrides: `pkg\|orientation\|w%\|h%\|dpi;…` (orientation 0 auto, 1 portrait, 2 landscape). Edit in the picker with a long-press. |
| `freeform_control_mode` | `Button` (default) or `Gesture` |
| `lmo_sb_enabled`, `lmo_sb_side` (0 left / 1 right), `lmo_sb_handle_len_dp`, `lmo_sb_handle_width_dp`, `lmo_sb_handle_alpha`, `lmo_sb_columns`, `lmo_sb_icon_size_dp`, `lmo_sb_panel_alpha`, `lmo_sb_pinned` | Sidebar look and pinned apps |

Broadcast actions (`com.libremobileos.freeform.…`): `START_FREEFORM` (extras `packageName`, optional `activityName`, `userId`, `taskId`, `pendingIntent`),
`STOP_FREEFORM` (`freeformId`), `SET_CONFIG`, `TOGGLE_SIDEBAR`, `OPEN_SIDEBAR`, `CLOSE_SIDEBAR`.

## 6b. ThunderPad

Configure in the settings app → *ThunderPad (iPad view, fullscreen)* → tap an app → preset / custom resolution + fit mode → *Save & open*.
Apps with a ThunderPad profile open fullscreen in pad mode when launched from the **sidebar / All apps**; other apps open as floating windows.

- **Fill** (default): fills the screen like a normal app, no bars, no distortion. The virtual display keeps the phone's aspect and uses the preset's size/dpi (at least ~600dp wide, so apps show their tablet layout).
- **Original**: exact tablet aspect (e.g. 2048x1536) with black bars. **Stretch**: exact tablet resolution stretched over the screen.
- Orientation follows the app (manifest / runtime request), otherwise the phone rotation. A landscape app on a portrait phone is shown rotated, so turning the phone makes it upright (⟳ flips the direction).
- **Truly fullscreen**: status and navigation bars are hidden (swipe from the edge shows them), nothing is cut at the sides/cutout. Rendering uses a SurfaceView (composed directly by SurfaceFlinger, best performance); only the rotated case uses a TextureView.
- **Home / Recents / another app hides the pad** and the app keeps running in the background, like a normal app. A small bubble (or the sidebar) brings it back exactly as it was, without restarting. Do not start the app from the home screen icon while it is hidden: Android would then move its task to the real display. The edge handle (⋮) has Back / fit mode / flip / **Close** (really closes the app). The Back key works too.

Broadcast: `am broadcast -a com.libremobileos.freeform.START_THUNDERPAD --es packageName <pkg> [--ei padW 2048 --ei padH 1536 --ei padDpi 326 --ei padFit 0|1|2]`, stop with `STOP_THUNDERPAD`.
Setting: `lmo_thunderpad_apps` = `pkg|w|h|dpi|fit;…` (fit 0 fill, 1 original, 2 stretch).
Note: a tablet resolution costs more GPU than the phone's own; lower the width/height for heavy games.

## 7. How it works (short)

`SystemServer` hook → `LMOFreeformBoot.start()` → a receiver and the sidebar live in `system_server`.
Starting a window creates a VirtualDisplay (flags PUBLIC | SECURE | OWN_CONTENT_ONLY | SUPPORTS_TOUCH |
DESTROY_CONTENT_ON_REMOVAL | TRUSTED …), launches the app on it with `launchDisplayId`, renders it into a
`TextureView` inside a `TYPE_APPLICATION_OVERLAY` window, and injects touches with `displayId` set.
Because it runs as uid 1000 inside the system, hidden APIs and permissions are not a problem.

## 8. Troubleshooting

| Symptom | Cause / fix |
|---|---|
| No `started` log, broadcasts not handled | Old `services.odex/vdex/art` still present, or dalvik-cache not cleared (section 3.4). Check the dex really is in `services.jar` (`unzip -l`). |
| `IllegalAccessError … ContextImpl` | Don't reference `ContextImpl` directly; this repo already uses reflection. |
| Window layout fails / "chrome view is null" | `LMOFreeform.apk` not installed or not scanned (package `com.libremobileos.freeform` must exist). |
| Sidebar "All apps" does nothing | `FreeformLauncher.apk` not installed. |
| App crashes only inside the floating window | Try `lmo_freeform_dpi`, or a per-app profile. |
| Build fails on stale launcher files | Delete `launcher/src/.../SidebarService.java` and `BootReceiver.java` (old version). |

When reporting a bug, attach `logcat -b all -d | grep -i -E "LMOFreeform|FreeformWindow"`.

## 9. Credits and license

- Original project: **LibreMobileOS LMOFreeform** (GPL-3.0). This port keeps the GPL-3.0 license (see `LICENSE`).
- A13 port, in-system sidebar, smart sizing and per-app profiles: **Thunder LMO Freeform** contributors.
