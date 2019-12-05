alias adb-shell="echo && echo 'export PATH=/data/local/tmp/busybox:\$PATH && cd sdcard' && echo && adb shell"
alias adb-text="adb shell input keyboard text"
alias adb-settings="echo '\n🌕 System'; adb shell settings list system; echo '\n🌕 Secure'; adb shell settings list secure; echo '\n🌕 Global'; adb shell settings list global"

function exoplayer() {
	adb shell am start -a com.google.android.exoplayer.demo.action.VIEW -d $1
}
function kodi() {
	adb shell am start -a android.intent.action.VIEW -d $1 -t video/mkv
}
function soundcloud() {
	adb shell am start -a android.intent.action.VIEW -d $1
}

# function adb-wget() { adb shell export PATH=/data/data/ru.meefik.busybox/files/bin:$PATH }
function adb-wget() {
	adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
	adb shell input keyboard text "'wget -O /dev/null $1'"
	adb shell input keyevent KEYCODE_ENTER
	sleep 15
	adb shell am force-stop com.termux
	# sleep 1
	# adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
	# adb shell input keyboard text "'rm ./*'"
	# adb shell input keyevent KEYCODE_ENTER
	# adb shell am force-stop com.termux
}

function apksign() {
	rm -f $1-signed.apk
	rm -f $1-unsigned-aligned.apk
	zipalign -v -p 4 $1-unsigned.apk $1-unsigned-aligned.apk
	apksigner sign --ks $HOME/.android/release.keystore --out $1-signed.apk $1-unsigned-aligned.apk
	apksigner verify $1-signed.apk
}

function adb-pm-ls() {
	echo; echo 🌕 Disabled 🌕
	echo "$(adb shell pm list packages -f -d)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Uninstalled 🌕
	echo "$(adb shell pm list packages -f -u)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Enabled 🌕
	echo "$(adb shell pm list packages -f -e)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Default 🌕
	echo "$(adb shell pm list packages -f)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 System 🌕
	echo "$(adb shell pm list packages -f -s)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Third-Party 🌕
	echo "$(adb shell pm list packages -f -3)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
}

# function adb-pm-ls() {
# 	echo "$(adb shell '
# 		echo; echo 🌕 Disabled 🌕; pm list packages -f -d;
# 		echo; echo 🌕 Uninstalled 🌕; pm list packages -f -u;
# 		echo; echo 🌕 Default 🌕; pm list packages -f;
# 		echo; echo 🌕 System 🌕; pm list packages -f -s;
# 		echo; echo 🌕 Enabled 🌕; pm list packages -f -e;
# 		echo; echo 🌕 Third-Party 🌕; pm list packages -f -3;
# 	')" | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
# }
# alias adb-pm-f="adb-pm-ls | grep"
# alias adb-pm-f="adb-pm-ls | rg --smart-case --fixed-strings --color=always --passthru"
