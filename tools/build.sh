#!/usr/bin/env bash
# Builds: out/classes-lmofreeform.dex (goes into services.jar) and out/LMOFreeform.apk (resources only)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$ROOT/build"; OUT="$ROOT/out"
rm -rf "$WORK" "$OUT"; mkdir -p "$WORK" "$OUT"

SDK="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-/usr/local/lib/android/sdk}}"
BT="$(ls -d "$SDK"/build-tools/* | sort -V | tail -1)"
PLATFORM_JAR="$(ls -d "$SDK"/platforms/android-*/android.jar | sort -V | tail -1)"
echo "build-tools: $BT"; echo "platform jar: $PLATFORM_JAR"

# 1) android.jar WITH hidden APIs (compile only, never shipped)
HIDDEN="$ROOT/libs/android-hidden.jar"
if [ ! -s "$HIDDEN" ]; then
  mkdir -p "$ROOT/libs"
  for url in \
    "https://github.com/Reginer/aosp-android-jar/raw/main/android-33/android.jar" \
    "https://raw.githubusercontent.com/Reginer/aosp-android-jar/main/android-33/android.jar"; do
    echo "trying $url"
    if curl -fsSL "$url" -o "$HIDDEN" && [ -s "$HIDDEN" ]; then break; fi
  done
fi
[ -s "$HIDDEN" ] || { echo "ERROR: no hidden-API android.jar. Put one at libs/android-hidden.jar"; exit 1; }

# 2) Kotlin compiler + stdlib
KV=1.9.24
curl -fsSL "https://github.com/JetBrains/kotlin/releases/download/v$KV/kotlin-compiler-$KV.zip" -o "$WORK/kotlinc.zip"
unzip -q "$WORK/kotlinc.zip" -d "$WORK"
KOTLINC="$WORK/kotlinc/bin/kotlinc"
STDLIB="$WORK/kotlinc/lib/kotlin-stdlib.jar"

# 3) compile server code
mkdir -p "$WORK/classes"
"$KOTLINC" -jvm-target 17 -no-stdlib -no-reflect \
  -Xstring-concat=inline -Xlambdas=class -Xsam-conversions=class \
  -Xno-call-assertions -Xno-param-assertions -Xno-receiver-assertions \
  -cp "$HIDDEN:$STDLIB" -d "$WORK/classes" "$ROOT/server/src"

# 4) dex (our classes + kotlin stdlib in one dex)
mkdir -p "$WORK/dex"
"$BT/d8" --release --min-api 33 --lib "$HIDDEN" --output "$WORK/dex" \
  $(find "$WORK/classes" -name '*.class') "$STDLIB"
ls "$WORK/dex"
cp "$WORK/dex/classes.dex" "$OUT/classes-lmofreeform.dex"
[ -f "$WORK/dex/classes2.dex" ] && cp "$WORK/dex/classes2.dex" "$OUT/classes-lmofreeform2.dex" || true

# 5) signing key (same key for both apks)
keytool -genkeypair -keystore "$WORK/ks.jks" -storepass lmofreeform -keypass lmofreeform \
  -alias k -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=LMOFreeform" >/dev/null 2>&1
sign() { # in out
  "$BT/zipalign" -f -p 4 "$1" "$WORK/_aligned.apk"
  "$BT/apksigner" sign --ks "$WORK/ks.jks" --ks-pass pass:lmofreeform --key-pass pass:lmofreeform \
    --out "$2" "$WORK/_aligned.apk"
}

# 6) resource-only APK (LMOFreeform.apk)
"$BT/aapt2" compile --dir "$ROOT/apk/res" -o "$WORK/res.zip"
"$BT/aapt2" link -o "$WORK/unsigned.apk" -I "$PLATFORM_JAR" \
  --manifest "$ROOT/apk/AndroidManifest.xml" \
  --min-sdk-version 33 --target-sdk-version 33 "$WORK/res.zip"
sign "$WORK/unsigned.apk" "$OUT/LMOFreeform.apk"

# stale files from the old separate-sidebar version (sidebar now lives in system_server)
rm -f "$ROOT/launcher/src/com/libremobileos/freeform/launcher/SidebarService.java" \
      "$ROOT/launcher/src/com/libremobileos/freeform/launcher/BootReceiver.java" \
      "$ROOT/launcher/res/drawable/ic_apps.xml" "$ROOT/launcher/res/drawable/ic_settings.xml"

# 7) launcher app (FreeformLauncher.apk): plain Java, public SDK only
"$BT/aapt2" compile --dir "$ROOT/launcher/res" -o "$WORK/lres.zip"
"$BT/aapt2" link -o "$WORK/lunsigned.apk" -I "$PLATFORM_JAR" \
  --manifest "$ROOT/launcher/AndroidManifest.xml" \
  --min-sdk-version 33 --target-sdk-version 33 \
  --java "$WORK/lgen" "$WORK/lres.zip"
mkdir -p "$WORK/lclasses" "$WORK/ldex"
javac --release 17 -cp "$PLATFORM_JAR" -d "$WORK/lclasses" \
  $(find "$ROOT/launcher/src" "$WORK/lgen" -name '*.java')
"$BT/d8" --release --min-api 33 --lib "$PLATFORM_JAR" --output "$WORK/ldex" \
  $(find "$WORK/lclasses" -name '*.class')
( cd "$WORK/ldex" && zip -q "$WORK/lunsigned.apk" classes.dex )
sign "$WORK/lunsigned.apk" "$OUT/FreeformLauncher.apk"

ls -la "$OUT"
