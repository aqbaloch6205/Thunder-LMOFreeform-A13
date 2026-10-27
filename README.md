# LMOFreeform A13 port (LG V60 / Thunder OS)

LMOFreeform ka A13 version. Floating window = VirtualDisplay + TextureView.
Custom DisplayAdapter nahi, stock VirtualDisplay API use hoti hai, isliye framework mein sirf 1 smali hook.

## 1. Build (GitHub)
Is folder ko GitHub repo mein push karein, Actions -> "Build LMOFreeform (A13)" -> Run workflow.
Artifact `LMOFreeform-A13` mein: `classes-lmofreeform.dex` aur `LMOFreeform.apk`.
Agar hidden-API jar download fail ho to `libs/android-hidden.jar` (android 33, hidden APIs ke saath) commit karein.

## 2. services.jar
1. `classes-lmofreeform.dex` ko services.jar mein agle number ka `classesN.dex` bana kar add karein (MT Manager).
   (`classes2.dex` ho to `classes-lmofreeform2.dex` bhi add karein.)
2. `hooks/com/android/server/SystemServer.smali` se apni SystemServer.smali replace karein
   (ya sirf `ActivityManagerService;->systemReady` ke baad "LMOFreeform hook" block paste karein), dex recompile karein.
3. `/system/framework/oat/arm64/services.*` (odex/vdex/art) delete karein.

## 3. APK
`LMOFreeform.apk` -> `/system/priv-app/LMOFreeform/LMOFreeform.apk`, permission 644. Sirf resources hain (code nahi).

## 3b. Launcher app
`FreeformLauncher.apk` -> `/system/app/FreeformLauncher/FreeformLauncher.apk` (644). Reboot ke baad "Freeform" icon aayega:
app par tap = floating window, "Size" button = width/height/dpi sliders.
(LMOFreeform.apk pehle install honi chahiye, taake permission declare ho.)

## 4. Test (root)
    su -c 'am broadcast --user 0 -a com.libremobileos.freeform.START_FREEFORM --es packageName com.whatsapp'
Log: `logcat | grep LMOFreeform`. Debug logs: `setprop log.tag.LMOFreeform DEBUG`.

## 5. Size / DPI (rebuild ke baghair)
    settings put system lmo_freeform_width_pct 90
    settings put system lmo_freeform_height_pct 62
    settings put system lmo_freeform_land_height_pct 85
    settings put system lmo_freeform_dpi 420
Controls: `settings put system freeform_control_mode Button` (ya Gesture).

## Notes
- Trigger abhi broadcast hai. Original sidebar A14+ hai, A13 par nahi chalega.
- Broadcast bhejne wale ke paas `com.libremobileos.permission.START_FREEFORM` hona chahiye (root ke paas hamesha hota hai).
- Yeh code compile/test nahi hua. Build error aaye to Actions ka log bhej dein.
