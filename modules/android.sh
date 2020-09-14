export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK="$ANDROID_HOME/ndk-bundle"

# export PATH="$PATH:$ANDROID_HOME/build-tools/29.0.3"
# export PATH="$PATH:$ANDROID_HOME/ndk-bundle"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"
# export PATH="$PATH:$ANDROID_HOME/tools/bin"
# export PATH="$PATH:$ANDROID_HOME/tools"

# alias mvn="mvn -Dmaven.test.skip=true -DskipTests"
# alias mvnw='$PWD/mvnw -Dmaven.test.skip=true -DskipTests'
# alias gradle="gradle --no-daemon"

# alias androidx='rd $ANDROID_HOME/androidx/*; cp ~/Sandbox/android-dts-generator/dts-generator/jar-files/* $ANDROID_HOME/androidx'
function sync-jar-files() {
	rd "$ANDROID_HOME/jar-files"
	cp "$HOME/Sandbox/android-dts-generator/dts-generator/jar-files" "$ANDROID_HOME"
	fd --base-directory "$ANDROID_HOME/jar-files" --type=file --extension=jar lint.jar -X rm -rfv
	fd --base-directory "$ANDROID_HOME/jar-files" --type=file --extension=jar lint.jar -X rm -rfv
}

function gradlew() {
	if [[ -e "$PWD/gradlew" ]]; then
		bash "$PWD/gradlew" "$@"
	else
		gradle "$@"
	fi
} # && compdef gradlew=gradle
function mvnw() {
	if [[ -e "$PWD/mvnw" ]]; then
		bash "$PWD/mvnw" "$@"
	else
		mvn "$@"
	fi
} # && compdef mvnw=mvn
# alias gradlew="./gradlew || gradle"
# alias mvnw="./mvnw || mvn"
# alias gradle='bash "$(test -e "$PWD/gradlew" && echo "$PWD/gradlew" || echo "$(which -p gradle)")"' && compdef gradle=gradle
# alias mvn='bash "$(test -e "$PWD/mvnw" && echo "$PWD/mvnw" || echo "$(which -p mvn)")"' && compdef mvn=mvn
# alias gradlew="sh gradlew"
# alias mvnw="sh mvnw"

# alias smali="java -jar $ANDROID_HOME/smali-2.4.0.jar"
# alias baksmali="java -jar $ANDROID_HOME/baksmali-2.4.0.jar"
# alias google-java-format="/usr/local/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home/bin/java -jar $ANDROID_HOME/google-java-format-1.9-all-deps.jar"
alias fernflower='java -jar $ANDROID_HOME/fernflower.jar'
alias uber-apk-signer='java -jar $ANDROID_HOME/uber-apk-signer-1.1.0.jar'
alias uber-apk-release='uber-apk-signer --ks $HOME/.android/release.keystore --ksAlias androidreleasekey --ksKeyPass $(cat $DOTFILES/.env.kspass) --ksPass $(cat $DOTFILES/.env.kspass) --overwrite --apks'
function uber-apk-install() {
	uber-apk-release "$@"
	adb install "$@"
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
