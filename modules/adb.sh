# export ADB_LIBUSB="1"

# alias adbls="adb devices -l"
# alias fastbootls="fastboot devices -l && fastboot getvar current-slot"

# if [[ -e "/usr/local/etc/bash_completion.d/rogcat.bash" ]]; then
# 	source "/usr/local/etc/bash_completion.d/rogcat.bash"
# fi
# if [[ -e "/usr/local/etc/bash_completion.d/pidcat" ]]; then
# 	source "/usr/local/etc/bash_completion.d/pidcat"
# fi

# ████  install adb busybox  ████
# adb push busybox-arm64 /data/local/tmp/busybox; adb shell /data/local/tmp/busybox/busybox --install -s /data/local/tmp/busybox
alias adbshell="echo; echo 'export PATH=/data/local/tmp/busybox:\$PATH'; echo; adb shell"
# function adbt() {
# 	adb shell am broadcast -a ADB_INPUT_B64 --es msg $(echo -n "$*" | base64)
# }
alias adbt="adb shell input keyboard text"
alias adbo="adb shell am start -a android.intent.action.VIEW -d"
alias adbps="adb shell ps -A -w -f --sort=STIME"
alias adbtop="adb shell top -H -s11 -d1 -n1 -b"

alias adb-scan-music="adb shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file:///sdcard/Music"
alias adb-display="adb shell dumpsys SurfaceFlinger | rg --multiline --multiline-dotall --only-matching --regexp='\n\nh/w composer state.+?Display manufacturer.+?\n' | bat --style=grid --language yml"

# alias rogcat="rogcat --level trace"
alias pidcat="pidcat --all"
# alias adb-pm-bak="adb shell pm list packages -s > pm-list-system.log; adb shell pm list packages -e > pm-list-enabled.log; adb shell pm list packages -d > pm-list-disabled.log; adb shell pm list packages -u > pm-list-uninstalled.log; sd '^package:' '' pm-list-*.log"

# alias exoplayer="adb shell am start -a com.google.android.exoplayer.demo.action.VIEW -d"
function exoplayer() {
	if [[ "$#" == "1" ]]; then
		adb shell am start -a 'com.google.android.exoplayer.demo.action.VIEW' -d "$@"
	else
		local args=""
		local i && for ((i = 0; i < $#; i++)); do
			args="$args--es uri_$i ${@[$((i + 1))]} "
		done
		adb shell am start -a 'com.google.android.exoplayer.demo.action.VIEW_LIST' "$args"
	fi
}
alias kodi="adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"
alias soundcloud="adb shell am start -a android.intent.action.VIEW -d"

# https://developer.android.com/reference/android/provider/Settings
function adb-settings-ls() {
	echo && echo "🌕 System Settings"
	adb shell settings list system | sortt | bat --style=grid -l properties
	echo && echo "🌕 Secure Settings"
	adb shell settings list secure | sortt | bat --style=grid -l properties
	echo && echo "🌕 Global Settings"
	adb shell settings list global | sortt | bat --style=grid -l properties
}
function adb-settings-f() {
	echo && echo "🌕 System Settings"
	adb shell settings list system | sortt | rg --smart-case --fixed-strings "$*" | bat --color=always --style=grid -l properties
	echo && echo "🌕 Secure Settings"
	adb shell settings list secure | sortt | rg --smart-case --fixed-strings "$*" | bat --color=always --style=grid -l properties
	echo && echo "🌕 Global Settings"
	adb shell settings list global | sortt | rg --smart-case --fixed-strings "$*" | bat --color=always --style=grid -l properties
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
function adb-pm-ls() {
	echo && echo "🌕 System Enabled Packages"
	adb shell pm list packages -s -e | sed 's#^package:##' | sortt
	echo && echo "🌕 System Disabled Packages"
	adb shell pm list packages -s -d | sed 's#^package:##' | sortt
	echo && echo "🌕 User Enabled Packages"
	adb shell pm list packages -3 -e | sed 's#^package:##' | sortt
	echo && echo "🌕 User Disabled Packages"
	adb shell pm list packages -3 -d | sed 's#^package:##' | sortt
}
function adb-pm-f() {
	echo && echo "🌕 Enabled Packages"
	adb shell pm list packages -e | sed 's#^package:##' | sortt | rg --smart-case --fixed-strings "$*"
	echo && echo "🌕 Disabled Packages"
	adb shell pm list packages -d | sed 's#^package:##' | sortt | rg --smart-case --fixed-strings "$*"
}

# function adb-pm-ls() {
# 	echo "$(adb shell '
# 		echo && echo "🌕 Disabled"; pm list packages -d;
# 		echo && echo "🌕 Uninstalled"; pm list packages -u;
# 		echo && echo "🌕 Default"; pm list packages;
# 		echo && echo "🌕 System"; pm list packages -s;
# 		echo && echo "🌕 Enabled"; pm list packages -e;
# 		echo && echo "🌕 Third-Party"; pm list packages -3;
# 	')" | sed 's#^package:##' | bat -p -l properties
# }
# alias adb-pm-f="adb-pm-ls | grep"
# alias adb-pm-f="adb-pm-ls | rg --smart-case --fixed-strings --passthru"

function adb-play-store() {
	local action="${1:-disable-user}"
	local packages=(
		'com.android.inputmethod.latin'
		'com.android.vending'
		'com.google.android.ext.services'
		'com.google.android.feedback'
		'com.google.android.gms'
		'com.google.android.gsf'
		'com.google.android.inputmethod.latin'
		'com.google.android.katniss'
		'com.google.android.sss'
		'com.google.android.sss.authbridge'
		'com.google.android.tv.bugreportsender'
	)
	local package && for package in "${packages[@]}"; do
		echo "🌕 $action -> '$package'"
		adb shell pm "$action" --user 0 "$package" && adb shell am force-stop "$package"
	done
}
