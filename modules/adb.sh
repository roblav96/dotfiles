# export ADB_LIBUSB="1"

# alias adbls="adb devices -l"
# alias fastbootls="fastboot devices -l && fastboot getvar current-slot"

# if [[ -e "/usr/local/etc/bash_completion.d/rogcat.bash" ]]; then
# 	source "/usr/local/etc/bash_completion.d/rogcat.bash"
# fi
# if [[ -e "/usr/local/etc/bash_completion.d/pidcat" ]]; then
# 	source "/usr/local/etc/bash_completion.d/pidcat"
# fi

if pgrep -x adb &>/dev/null; then
	if [[ $(adb devices | wc -l) -gt 2 ]]; then
		export ANDROID_SERIAL="${"$(adb get-serialno)"%:5555}"
	fi
fi
[[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="192.168.2.40"

function curltv() {
	if [[ "$1" == "premiumize" ]]; then
		curl --proxy "$ANDROID_SERIAL:8888" "https://www.premiumize.me/api/transfer/directdl?customer_id=$_PREMIUMIZE_ID&pin=$_PREMIUMIZE_PIN&src=magnet:?xt=urn:btih:$2" | jq '.content' | jq "map(select(.link|endswith(\"${3:-mkv}\")))" | jq 'map(.link)' --tab --monochrome-output --raw-output
	elif [[ "$1" == "real-debrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:8888" "https://api.real-debrid.com/rest/1.0/unrestrict/link?auth_token=$_REALDEBRID_SECRET" -d "link=https://real-debrid.com/d/$2" | jq '.download' --tab --monochrome-output --raw-output
	elif [[ "$1" == "alldebrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:8888" "https://api.alldebrid.com/v4/link/unlock?agent=$_ALLDEBRID_AGENT&apikey=$_ALLDEBRID_KEY&link=https://uptobox.com/$2" | jq '.data.link' --tab --monochrome-output --raw-output
	fi
}

# ████  install adb busybox  ████
# adb push busybox-arm64 /data/local/tmp/busybox; adb shell /data/local/tmp/busybox/busybox --install -s /data/local/tmp/busybox
alias adbshell="echo; echo 'export PATH=/data/local/tmp/busybox:\$PATH'; echo; adb shell"

alias rogcat="rogcat --hide-timestamp --level trace"
alias rog="rogcat --tag '!^netstats_(\w+)_sample$' --message '!^loading \[eventTime=\d'"
# alias rog='rogcat $([[ $COLUMNS -lt 125 ]] && echo --hide-timestamp) --level trace'

# function adbt() {
# 	adb shell am broadcast -a ADB_INPUT_B64 --es msg $(echo -n "$*" | base64)
# }
alias adbt="adb shell input keyboard text"
alias adbo="adb shell am start -a android.intent.action.VIEW -d"
alias adbps="adb shell ps -A -w -f --sort=STIME"
alias adbpid=" adbps | rg --fixed-strings --case-sensitive"
alias adbtop="adb shell top -H -s11 -d1 -n1 -b"

alias adbscanmusic="adb shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file:///sdcard/Music"
alias adbsdcard="adb shell find /sdcard/ | sed 's#^/sdcard/##' | sortt"

# alias rogcat="rogcat --level trace"
alias pidcat="pidcat --all"
# alias adb-pm-bak="adb shell pm list packages -s > pm-list-system.log; adb shell pm list packages -e > pm-list-enabled.log; adb shell pm list packages -d > pm-list-disabled.log; adb shell pm list packages -u > pm-list-uninstalled.log; sd '^package:' '' pm-list-*.log"

alias adbdisplay="adb shell dumpsys SurfaceFlinger | rg --multiline --multiline-dotall --only-matching --regexp='\n\nh/w composer state.+?Display manufacturer.+?\n' | bat --style=grid -l yml"
alias adbstack="adb shell am stack list | bat --style=grid -l nix"

function exoplayer() {
	if [[ $# -eq 1 ]]; then
		adb shell am start -a com.google.android.exoplayer.demo.action.VIEW -d "$@" # --ez prefer_extension_decoders FALSE
	else
		local args=""
		local i && for ((i = 0; i < $#; i++)); do
			args="$args--es uri_$i ${@[$((i + 1))]} "
		done
		adb shell am start -a com.google.android.exoplayer.demo.action.VIEW_LIST "$args" # --ez prefer_extension_decoders FALSE
	fi
}
alias kodi="adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"

alias adb3="adb shell pm list packages -3 | sed 's#^package:##' | sortt"

function adbk() {
	local v && for v in "$@"; do
		adb shell am force-stop "$v"
	done
}
function adbcl() {
	local v && for v in "$@"; do
		adb shell am force-stop "$v"
		adb shell pm clear "$v"
	done
}
function adbrm() {
	local v && for v in "$@"; do
		adb shell am force-stop "$v"
		adb shell pm clear "$v"
		adb uninstall "$v"
	done
}
function adbdp() {
	local v && for v in "$@"; do
		adb shell pm dump "$v" | bat --file-name="$v" -l yml
	done
}
function adblp() {
	adb shell monkey -p "$@" -c android.intent.category.LAUNCHER 1
}

# https://developer.android.com/reference/android/provider/Settings
function adbsettingsls() {
	echo && echo "🌕 System Settings"
	adb shell settings list system | sortt | bat --style=grid -l ini
	echo && echo "🌕 Secure Settings"
	adb shell settings list secure | sortt | bat --style=grid -l ini
	echo && echo "🌕 Global Settings"
	adb shell settings list global | sortt | bat --style=grid -l ini
}
function adbsettingsf() {
	echo && echo "🌕 System Settings"
	adb shell settings list system | sortt | rg --smart-case --fixed-strings "$*" | bat --style=grid -l ini
	echo && echo "🌕 Secure Settings"
	adb shell settings list secure | sortt | rg --smart-case --fixed-strings "$*" | bat --style=grid -l ini
	echo && echo "🌕 Global Settings"
	adb shell settings list global | sortt | rg --smart-case --fixed-strings "$*" | bat --style=grid -l ini
}

function adbsu() {
	adb shell su -c "${@:2}"
}

# function adb-wget() {
# 	adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
# 	adb shell input keyboard text "'wget -O /dev/null $1'"
# 	adb shell input keyevent KEYCODE_ENTER
# 	sleep 10
# 	adb shell am force-stop com.termux
# 	# sleep 1
# 	# adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
# 	# adb shell input keyboard text "'rm ./*'"
# 	# adb shell input keyevent KEYCODE_ENTER
# 	# adb shell am force-stop com.termux
# }
# # function adb-wget() { adb shell export PATH=/data/data/ru.meefik.busybox/files/bin:$PATH }

# https://developer.android.com/studio/command-line/adb#pm
function adbpmls() {
	echo && echo "🌕 System Enabled Packages"
	adb shell pm list packages -s -e | sed 's#^package:##' | sortt
	echo && echo "🌕 System Disabled Packages"
	adb shell pm list packages -s -d | sed 's#^package:##' | sortt
	echo && echo "🌕 User Enabled Packages"
	adb shell pm list packages -3 -e | sed 's#^package:##' | sortt
	echo && echo "🌕 User Disabled Packages"
	adb shell pm list packages -3 -d | sed 's#^package:##' | sortt
}
function adbpmf() {
	echo && echo "🌕 Enabled Packages"
	adb shell pm list packages -e | sed 's#^package:##' | sortt | rg --smart-case --fixed-strings "$*"
	echo && echo "🌕 Disabled Packages"
	adb shell pm list packages -d | sed 's#^package:##' | sortt | rg --smart-case --fixed-strings "$*"
}
function adbpmp() {
	local v && for v in "$@"; do
		adb shell pm path --user 0 "$v" | sed 's#^package:##'
	done
}
function adbpmd() {
	local v && for v in "$@"; do
		# adb shell am set-inactive --user 0 "$v"
		adb shell pm disable-user --user 0 "$v" && adb shell am force-stop "$v"
	done
}
function adbpmu() {
	local v && for v in "$@"; do
		adb shell pm enable --user 0 "$v"
	done
}

# function adbjadx() {
# 	local v && for v in "$@"; do
# 		local apk="$(adbpmp "$v")"
# 		adb pull $(adbpmp "$v")
# 	done
# }

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
		'com.android.providers.tv'
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
		'com.google.android.tvrecommendations'
		'com.nvidia.ota'
	)
	local package && for package in "${packages[@]}"; do
		echo "🌕 $action -> '$package'"
		adb shell pm "$action" --user 0 "$package" && adb shell am force-stop "$package"
	done
}
