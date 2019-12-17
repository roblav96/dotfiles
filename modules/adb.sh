# export ADB_LIBUSB="1"

# ████  install adb busybox  ████
# adb push busybox-arm64 /data/local/tmp/busybox; adb shell /data/local/tmp/busybox/busybox --install -s /data/local/tmp/busybox
alias adb-shell="echo; echo 'export PATH=/data/local/tmp/busybox:\$PATH'; echo; adb shell"
alias adb-text="adb shell input keyboard text"
alias exoplayer="adb shell am start -a com.google.android.exoplayer.demo.action.VIEW -d"
alias kodi="adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"
alias soundcloud="adb shell am start -a android.intent.action.VIEW -d"

# https://developer.android.com/reference/android/provider/Settings
function adb-settings() {
	echo; echo 🌕 System Settings 🌕
	echo "$(adb shell settings list system)" | sort --ignore-case | bat --style=grid -l sh
	echo; echo 🌕 Secure Settings 🌕
	echo "$(adb shell settings list secure)" | sort --ignore-case | bat --style=grid -l sh
	echo; echo 🌕 Global Settings 🌕
	echo "$(adb shell settings list global)" | sort --ignore-case | bat --style=grid -l sh
}
function adb-settings-f() {
	if [[ $# -eq 0 ]]; then
		adb-settings
		return 0
	fi
	echo; echo 🌕 System Settings 🌕
	echo "$(adb shell settings list system)" | sort --ignore-case | bat --style=grid -l sh | rgp $@
	echo; echo 🌕 Secure Settings 🌕
	echo "$(adb shell settings list secure)" | sort --ignore-case | bat --style=grid -l sh | rgp $@
	echo; echo 🌕 Global Settings 🌕
	echo "$(adb shell settings list global)" | sort --ignore-case | bat --style=grid -l sh | rgp $@
}

function adb-su() {
	adb shell su -c ${@:2}
}

function adb-wget() {
	adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
	adb shell input keyboard text "'wget -O /dev/null $1'"
	adb shell input keyevent KEYCODE_ENTER
	sleep 10
	adb shell am force-stop com.termux
	# sleep 1
	# adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
	# adb shell input keyboard text "'rm ./*'"
	# adb shell input keyevent KEYCODE_ENTER
	# adb shell am force-stop com.termux
}
# function adb-wget() { adb shell export PATH=/data/data/ru.meefik.busybox/files/bin:$PATH }

# https://developer.android.com/studio/command-line/adb#pm
function adb-pm() {
	echo; echo 🌕 Disabled Packages 🌕
	echo "$(adb shell pm list packages -f -d)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat --style=grid -l properties
	echo; echo 🌕 Uninstalled Packages 🌕
	echo "$(adb shell pm list packages -f -u)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat --style=grid -l properties
	echo; echo 🌕 Enabled Packages 🌕
	echo "$(adb shell pm list packages -f -e)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat --style=grid -l properties
	echo; echo 🌕 Default Packages 🌕
	echo "$(adb shell pm list packages -f)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat --style=grid -l properties
	echo; echo 🌕 System Packages 🌕
	echo "$(adb shell pm list packages -f -s)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat --style=grid -l properties
	echo; echo 🌕 Third-Party Packages 🌕
	echo "$(adb shell pm list packages -f -3)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat --style=grid -l properties
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
# alias adb-pm-f="adb-pm-ls | rgp"
