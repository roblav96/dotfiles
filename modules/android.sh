[[ -z "$ANDROID_HOME" ]] && export ANDROID_HOME="$HOME/Library/Android/sdk"
[[ -z "$ANDROID_SDK_ROOT" ]] && export ANDROID_SDK_ROOT="$ANDROID_HOME"
[[ -z "$ANDROID_NDK" ]] && export ANDROID_NDK="$ANDROID_HOME/ndk-bundle"

# export PATH="$PATH:$ANDROID_HOME/build-tools/29.0.3"
# export PATH="$PATH:$ANDROID_HOME/ndk-bundle"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"
# export PATH="$PATH:$ANDROID_HOME/tools/bin"
# export PATH="$PATH:$ANDROID_HOME/tools"

# alias mvn="mvn -Dmaven.test.skip=true -DskipTests"
# alias mvnw='$PWD/mvnw -Dmaven.test.skip=true -DskipTests'
# alias gradle="gradle --no-daemon"

function gradlew() {
	if [[ -e gradlew ]]; then bash gradlew "$@"; else gradle "$@"; fi
}
function mvnw() {
	if [[ -e mvnw ]]; then bash mvnw "$@"; else mvn "$@"; fi
}
# compdef mvnw=mvn
# alias gradlew="./gradlew || gradle"
# alias mvnw="./mvnw || mvn"
# alias gradle='bash "$(test -e "$PWD/gradlew" && echo "$PWD/gradlew" || echo "$(which -p gradle)")"' && compdef gradle=gradle
# alias mvn='bash "$(test -e "$PWD/mvnw" && echo "$PWD/mvnw" || echo "$(which -p mvn)")"' && compdef mvn=mvn
# alias gradlew="sh gradlew"
# alias mvnw="sh mvnw"

# alias sdkmanager="sdkmanager --channel=3"

alias apkanalyzer="apkanalyzer --human-readable"
function apkm() {
	local v && for v in "$@"; do
		apkanalyzer apk summary "$v" | bl fstab
	done
}
function apki() {
	local v && for v in "$@"; do
		aapt2 dump badging "$v" | sed -e "s/='/: '/g" -e "s/:'/: '/g" -e '/^application-label-/d' -e '/^application-icon-/d' | t2 | bat --file-name="$v" -l yml
	done
}

alias avdls="avdmanager list avd | bl yml"
local emulator_flags='-no-passive-gps -no-location-ui' # -accel on -gpu host'
alias emulator="emulator $emulator_flags -verbose"
alias emulatord="daemonize -- $(which -p emulator) $emulator_flags"
local scrcpy_flags='--serial $ANDROID_SERIAL --disable-screensaver --max-size 1080 --render-driver opengl'
alias scrcpy="scrcpy $scrcpy_flags --verbosity debug"
alias scrcpyd="daemonize -- $(which -p scrcpy) $scrcpy_flags"
unset emulator_flags scrcpy_flags

# alias smali="java -jar $ANDROID_HOME/smali-2.4.0.jar"
# alias baksmali="java -jar $ANDROID_HOME/baksmali-2.4.0.jar"
# alias google-java-format="/usr/local/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home/bin/java -jar $ANDROID_HOME/google-java-format-1.9-all-deps.jar"
alias fernflower='java -jar $ANDROID_HOME/fernflower.jar'
alias classyshark='java -jar $ANDROID_HOME/ClassyShark.jar'
alias bytecode-viewer='java -jar $ANDROID_HOME/Bytecode-Viewer-2.9.22.jar'

function unapk() {
	local outdir="${@%.apk}"
	apktool decode --frame-tag mdarcy --api-level 28 --match-original "$@"
	unzip "$@" '*.dex' -d "$outdir"
	cd "$outdir"
	command rm -rf smali*
	jadx --show-bad-code --output-dir . --log-level ERROR *.dex 2>&1 | bat --plain -l java
	command rm -rf *.dex
}

alias uber-apk-signer='java -jar $ANDROID_HOME/uber-apk-signer-1.1.0.jar'
alias uber-apk-release='uber-apk-signer --ks $HOME/.android/release.keystore --ksAlias androidreleasekey --ksKeyPass $(cat $DOTFILES/.env.kspass) --ksPass $(cat $DOTFILES/.env.kspass) --overwrite --apks'
function uber-apk-install() {
	uber-apk-release "$@"
	adb install -r "$@"
}

# alias apksign="java -jar $ANDROID_HOME/uber-apk-signer-1.1.0.jar --verbose --ks $HOME/.android/release.keystore --ksAlias androidreleasekey --apks"
# alias android-dts-generator="java -jar $ANDROID_HOME/android-dts-generator.jar"
# function apksign() {
# 	rm -f "$*-signed.apk"
# 	rm -f "$*-unsigned-aligned.apk"
# 	zipalign -v -p 4 "$*-unsigned.apk" "$*-unsigned-aligned.apk"
# 	apksigner sign --ks "$HOME/.android/release.keystore" --out "$*-signed.apk" "$*-unsigned-aligned.apk"
# 	apksigner verify "$*-signed.apk"
# }
