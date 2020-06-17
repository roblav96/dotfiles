export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
# export ANDROID_NDK_HOME="$ANDROID_HOME/ndk-bundle"

# export PATH="$PATH:$ANDROID_HOME/build-tools/29.0.3"
# export PATH="$PATH:$ANDROID_HOME/ndk-bundle"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"
# export PATH="$PATH:$ANDROID_HOME/tools/bin"
# export PATH="$PATH:$ANDROID_HOME/tools"

alias gradlew="\$PWD/gradlew"
# alias gradle="gradle --no-daemon"

function apksign() {
	rm -f "$*-signed.apk"
	rm -f "$*-unsigned-aligned.apk"
	zipalign -v -p 4 "$*-unsigned.apk" "$*-unsigned-aligned.apk"
	apksigner sign --ks "$HOME/.android/release.keystore" --out "$*-signed.apk" "$*-unsigned-aligned.apk"
	apksigner verify "$*-signed.apk"
}
