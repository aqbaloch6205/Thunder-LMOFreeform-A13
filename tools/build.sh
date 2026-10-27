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

# 5) resource-only APK
"$BT/aapt2" compile --dir "$ROOT/apk/res" -o "$WORK/res.zip"
"$BT/aapt2" link -o "$WORK/unsigned.apk" -I "$PLATFORM_JAR" \
  --manifest "$ROOT/apk/AndroidManifest.xml" \
  --min-sdk-version 33 --target-sdk-version 33 "$WORK/res.zip"
"$BT/zipalign" -f -p 4 "$WORK/unsigned.apk" "$WORK/aligned.apk"
keytool -genkeypair -keystore "$WORK/ks.jks" -storepass lmofreeform -keypass lmofreeform \
  -alias k -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=LMOFreeform" >/dev/null 2>&1
"$BT/apksigner" sign --ks "$WORK/ks.jks" --ks-pass pass:lmofreeform --key-pass pass:lmofreeform \
  --out "$OUT/LMOFreeform.apk" "$WORK/aligned.apk"

ls -la "$OUT"
