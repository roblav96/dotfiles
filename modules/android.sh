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

function gradle() {
	sh "$(test -e "$PWD/gradlew" && echo "$PWD/gradlew" || echo "$(which -p gradle)")" "$@"
} && compdef gradle=gradle
function mvn() {
	sh "$(test -e "$PWD/mvnw" && echo "$PWD/mvnw" || echo "$(which -p mvn)")" "$@"
} && compdef mvn=mvn
# alias gradle="./gradlew || gradle"
# alias mvn="./mvnw || mvn"
# alias gradle='sh "$(test -e "$PWD/gradlew" && echo "$PWD/gradlew" || echo "$(which -p gradle)")"' && compdef gradle=gradle
# alias mvn='sh "$(test -e "$PWD/mvnw" && echo "$PWD/mvnw" || echo "$(which -p mvn)")"' && compdef mvn=mvn
# alias gradlew="sh gradlew"
# alias mvnw="sh mvnw"

alias fernflower="java -jar ${ANDROID_HOME:-"$ANDROID_SDK_ROOT"}/fernflower.jar"
alias uber-apk-signer="java -jar ${ANDROID_HOME:-"$ANDROID_SDK_ROOT"}/uber-apk-signer-1.1.0.jar --verbose --ks $HOME/.android/release.keystore --ksAlias androidreleasekey --ksKeyPass \$(cat \$DOTFILES/.env.kspass) --ksPass \$(cat \$DOTFILES/.env.kspass) --apks"

# alias apksign="java -jar $ANDROID_HOME/uber-apk-signer-1.1.0.jar --verbose --ks $HOME/.android/release.keystore --ksAlias androidreleasekey --apks"
# alias android-dts-generator="java -jar $ANDROID_HOME/android-dts-generator.jar"
# function apksign() {
# 	rm -f "$*-signed.apk"
# 	rm -f "$*-unsigned-aligned.apk"
# 	zipalign -v -p 4 "$*-unsigned.apk" "$*-unsigned-aligned.apk"
# 	apksigner sign --ks "$HOME/.android/release.keystore" --out "$*-signed.apk" "$*-unsigned-aligned.apk"
# 	apksigner verify "$*-signed.apk"
# }
