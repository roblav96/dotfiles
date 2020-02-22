export ANDROID_HOME="/usr/local/share/android-sdk"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk-bundle"
export ANDROID_SDK="$ANDROID_HOME"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

export PATH="$PATH:$ANDROID_HOME/build-tools/29.0.2"
export PATH="$PATH:$ANDROID_HOME/ndk-bundle"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/tools"

function apksign() {
	rm -f $@-signed.apk
	rm -f $@-unsigned-aligned.apk
	zipalign -v -p 4 $@-unsigned.apk $@-unsigned-aligned.apk
	apksigner sign --ks $HOME/.android/release.keystore --out $@-signed.apk $@-unsigned-aligned.apk
	apksigner verify $@-signed.apk
}
