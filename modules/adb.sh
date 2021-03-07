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
		export ANDROID_SERIAL="${"$(adb get-serialno 2>/dev/null)"%:5555}"
	fi
fi
[[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="192.168.1.2"
# [[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="192.168.2.40"

function curltv() {
	if [[ "$1" == "premiumize" ]]; then
		curl --proxy "$ANDROID_SERIAL:8888" "https://www.premiumize.me/api/transfer/directdl?customer_id=$PREMIUMIZE_ID&pin=$PREMIUMIZE_PIN&src=magnet:?xt=urn:btih:$2" | jq '.content' | jq "map(select(.link|endswith(\"${3:-mkv}\")))" | jq 'map(.link)[]' --raw-output | sortt --field-separator='/' --key=10
	elif [[ "$1" == "real-debrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:8888" "https://api.real-debrid.com/rest/1.0/unrestrict/link?auth_token=$REALDEBRID_SECRET" -d "link=https://real-debrid.com/d/$2" | jq '.download' --tab --monochrome-output --raw-output
	elif [[ "$1" == "alldebrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:8888" "https://api.alldebrid.com/v4/link/unlock?agent=$ALLDEBRID_AGENT&apikey=$ALLDEBRID_KEY&link=https://uptobox.com/$2" | jq '.data.link' --tab --monochrome-output --raw-output
	fi
}

# ████  install adb busybox  ████
# adb push busybox-arm64 /data/local/tmp/busybox; adb shell /data/local/tmp/busybox/busybox --install -s /data/local/tmp/busybox
alias adbshell="echo; echo 'export PATH=/data/local/tmp/busybox:\$PATH'; echo; adb shell"

# alias rogcat='rogcat $([[ $(tput cols) -lt 125 ]] && echo --hide-timestamp)'
alias rogcat='rogcat $([[ $(tput cols) -lt 125 ]] && echo --hide-timestamp) --buffer all --level trace --message "!^loading \[eventTime=\d" --tag "!^netstats_\w+_sample$"'
declare rogs="rogcat"
if [[ "91PX1WGPV" == "$ANDROID_SERIAL" ]]; then
	rogs="$rogs --message '!name=tethering scontext=u:r:grilservice_app:'"
fi
if [[ "emulator-5554" == "$ANDROID_SERIAL" ]]; then
	rogs="$rogs --message '!^Can.t find service car_service$'"
fi
if [[ "192.168." == "${ANDROID_SERIAL:0:8}" ]]; then
	# rogs="$rogs --message '!^\b\w+ key.ode\b'"
	# rogs="$rogs --message '!^NVMEDIA: FrameRate\(for last 120 frames\) = \d'"
	rogs="$rogs --message '!^Access denied finding property \"RB.tag\"$'"
	rogs="$rogs --message '!^dispatchVolumeKeyEvent, pkg='"
	rogs="$rogs --message '!^Exception checking for game stream. Exception: '"
	rogs="$rogs --message '!^getLayerReleaseFence failed for display -1: Invalid display$'"
	rogs="$rogs --message '!^handleComboKeys key.ode: \d'"
	rogs="$rogs --message '!^interceptKeyT. key.ode=\d'"
	rogs="$rogs --message '!flags=\d+, suggestedStream=-\d+, preferSuggestedStream=false$'"
	rogs="$rogs --tag '!^bt_stack$'"
	rogs="$rogs --tag '!^NewAvrcp'"
fi
rogs="$rogs --tag '!^JS$'"
rogs="$rogs --tag '!^JsonPath'"
rogs="$rogs --tag '!^mobile-ffmpeg$'"
alias rog="$rogs" && unset rogs
# local rogs=(
# 	"!^Exception checking for game stream. Exception: "
# 	"!^interceptKeyT. key.ode=\d"
# 	"!^handleComboKeys key.ode: \d"
# 	"!^loading \[eventTime=\d"
# )
# alias rog="rogcat --level trace $(printf "--message '%q' " "$rogs") --tag '!^netstats_(\w+)_sample$'"
# unset rogs
# alias rog='rogcat $([[ $COLUMNS -lt 125 ]] && echo --hide-timestamp) --level trace'

# function adbt() {
# 	adb shell am broadcast -a ADB_INPUT_B64 --es msg $(echo -n "$*" | base64)
# }
alias adbt="adb shell input keyboard text"
alias adbo="adb shell am start -a android.intent.action.VIEW -d"
alias adbp="adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"
alias adbps="adb shell ps -A -w -f --sort=STIME | sed '/\[kworker\//d'"
alias adbpid=" adbps | rg --fixed-strings --case-sensitive"
alias adbtop="adb shell top -H -s11 -d1 -n1 -b"
alias adbconfig="adb shell am get-config --device | sortt | bl yml"

alias adbmusic="adb shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file:///sdcard/Music"
alias adbsdcard="adb shell find /sdcard/ | sed 's#^/sdcard/##' | sortt"
alias adbscreenshot='adb shell "screencap -p" > "screenshot.$(date --iso-8601).$(date +%s).png"'

# alias rogcat="rogcat --level trace"
alias pidcat="pidcat --all"
# alias adb-pm-bak="adb shell pm list packages -s > pm-list-system.log; adb shell pm list packages -e > pm-list-enabled.log; adb shell pm list packages -d > pm-list-disabled.log; adb shell pm list packages -u > pm-list-uninstalled.log; sd '^package:' '' pm-list-*.log"

alias adbdisplay="adb shell dumpsys SurfaceFlinger | rg --multiline --multiline-dotall --only-matching --regexp='\n\nh/w composer state.+?Display manufacturer.+?\n' | t2 | bl yml"
alias adbaudio="adb shell dumpsys media.audio_flinger | rg --multiline --multiline-dotall --only-matching --regexp='\n\n.+?type 1 \(DIRECT\):\n  .+?\n\n' | bl yml"
alias adbstack="adb shell am stack list | bl nix"

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
alias kodi="adb shell truncate -s0 /sdcard/Android/data/org.xbmc.kodi/files/.kodi/temp/kodi.log; adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"
alias debrids="adb shell am start -a app.debrids.tv.action.VIEW -d"

# alias adbin="adb install -r"
function adbin() {
	local v && for v in "$@"; do
		adb install -r "$v"
	done
}

function adbk() {
	if [[ $# -eq 0 ]]; then
		adb shell input keyevent KEYCODE_HOME
		local pkgs=(
			"app.debrids.tv"
			"au.com.shiftyjelly.pocketcasts"
			"com.amazon.amazonvideo.livingroom"
			"com.android.tv.settings"
			"com.android.vending"
			"com.curiosity.curiositystream.androidtv"
			"com.fgl27.twitch"
			"com.google.android.apps.mediashell"
			"com.google.android.exoplayer2.demo"
			"com.google.android.gms"
			"com.google.android.gsf"
			"com.google.android.leanbacklauncher"
			"com.google.android.tts"
			"com.google.android.webview"
			"com.google.android.youtube.tv"
			"com.google.android.youtube.tvunplugged"
			"com.hbo.hbonow"
			"com.hulu.livingroomplus"
			"com.kfaraj.launcher"
			"com.liskovsoft.smarttubetv"
			"com.liskovsoft.smarttubetv.beta"
			"com.liskovsoft.videomanager"
			"com.netflix.ninja"
			"com.nvidia.nvgamecast"
			"com.nvidia.ota"
			"com.peacocktv.peacockandroid"
			"com.perflyst.twire"
			"com.semperpax.spmc16"
			"com.soundcloud.android"
			"com.teamsmart.videomanager.tv"
			"com.vanced.manager"
			"is.xyz.mpv"
			"org.courville.nova"
			"org.jellyfin.androidtv"
			"org.mozilla.tv.firefox"
			"org.polymorphicshade.newpipe"
			"org.schabi.newpipe"
			"org.schabi.newpipelegacy"
			"org.videolan.vlc"
			"org.videolan.vlcbenchmark"
			"org.xbmc.kodi"
			"tv.emby.embyatv"
			"tv.twitch.android.app"
		)
		adbk $pkgs
	fi
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
function adbi() {
	local v && for v in "$@"; do
		adb shell dumpsys package "$v" | sed 's/\b=/: /' | t2 | bl yml --file-name="$v"
	done
}
function adbdp() {
	local v && for v in "$@"; do
		adb shell pm dump "$v" | sed 's/\b=/: /' | t2 | bl yml --file-name="$v"
	done
}
function adblp() {
	local v && for v in "$@"; do
		adb shell monkey -p "$v" -c android.intent.category.LAUNCHER 1
	done
}

function adbds() {
	local v && for v in "$@"; do
		adb shell dumpsys "$v" | sed 's/\b=/: /' | t2 | bl yml --file-name="$v"
	done
}

# https://developer.android.com/reference/android/provider/Settings
function adbsettingsls() {
	echo && echo "🟡 System Settings"
	adb shell settings list system | sortt | sed 's/\b=/: /' | bl yml
	echo && echo "🟡 Secure Settings"
	adb shell settings list secure | sortt | sed 's/\b=/: /' | bl yml
	echo && echo "🟡 Global Settings"
	adb shell settings list global | sortt | sed 's/\b=/: /' | bl yml
}
function adbsettingsf() {
	echo && echo "🟡 System Settings"
	adb shell settings list system | sortt | rg --smart-case --fixed-strings -- "$*" | sed 's/\b=/: /' | bl yml
	echo && echo "🟡 Secure Settings"
	adb shell settings list secure | sortt | rg --smart-case --fixed-strings -- "$*" | sed 's/\b=/: /' | bl yml
	echo && echo "🟡 Global Settings"
	adb shell settings list global | sortt | rg --smart-case --fixed-strings -- "$*" | sed 's/\b=/: /' | bl yml
}
function adbsettingsinit() {
	adb shell settings put global development_settings_enabled 1
	adb shell settings put global stay_on_while_plugged_in 3
	adb shell settings put global verifier_verify_adb_installs 0
	adb shell settings put global animator_duration_scale 0.5
	adb shell settings put global transition_animation_scale 0.5
	adb shell settings put global window_animation_scale 0.5
	adb shell settings put global hidden_api_policy 1
	adb shell settings put global hidden_api_policy_p_apps 1
	adb shell settings put global hidden_api_policy_pre_p_apps 1
	adb shell settings put secure location_mode 0
	adb shell settings delete secure location_providers_allowed
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
	echo && echo "🟢 System Enabled Packages"
	# echo "   adb shell pm list packages -s -e"
	adb shell pm list packages -s -e | sed 's/^package://' | sortt
	echo && echo "🔴 System Disabled Packages"
	# echo "   adb shell pm list packages -s -d"
	adb shell pm list packages -s -d | sed 's/^package://' | sortt
	adb3
}
function adb3() {
	echo && echo "🟢 User Enabled Packages"
	# echo "   adb shell pm list packages -3 -e"
	adb shell pm list packages -3 -e | sed 's/^package://' | sortt
	echo && echo "🔴 User Disabled Packages"
	# echo "   adb shell pm list packages -3 -d"
	adb shell pm list packages -3 -d | sed 's/^package://' | sortt
}
function adbpmf() {
	echo && echo "🟢 Enabled Packages"
	adb shell pm list packages -e | sed 's/^package://' | sortt | rg --smart-case --fixed-strings -- "$*"
	echo && echo "🔴 Disabled Packages"
	adb shell pm list packages -d | sed 's/^package://' | sortt | rg --smart-case --fixed-strings -- "$*"
}
# alias adb3="adb shell pm list packages -3 | sed 's/^package://' | sortt"

function adbapk() {
	local v && for v in "$@"; do
		local apkpath="$(adb shell pm path --user 0 "$v" | sed 's/^package://')"
		[[ -e "$v.apk" ]] && mv "$v.apk" "$v.bak.apk"
		adb pull "$apkpath" "$v.apk"
	done
}
function adbdown() {
	local v && for v in "$@"; do
		# adb shell am set-inactive --user 0 "$v" true
		adb shell pm disable-user --user 0 "$v" && adb shell am force-stop "$v"
	done
}
function adbup() {
	local v && for v in "$@"; do
		adb shell pm enable --user 0 "$v"
	done
}

# function adbjadx() {
# 	local v && for v in "$@"; do
# 		local apk="$(adbpmapk "$v")"
# 		adb pull $(adbpmapk "$v")
# 	done
# }

# function adb-pm-ls() {
# 	echo "$(adb shell '
# 		echo && echo "🟡 Disabled"; pm list packages -d;
# 		echo && echo "🟡 Uninstalled"; pm list packages -u;
# 		echo && echo "🟡 Default"; pm list packages;
# 		echo && echo "🟡 System"; pm list packages -s;
# 		echo && echo "🟡 Enabled"; pm list packages -e;
# 		echo && echo "🟡 Third-Party"; pm list packages -3;
# 	')" | sed 's/^package://' | bl properties
# }
# alias adb-pm-f="adb-pm-ls | grep"
# alias adb-pm-f="adb-pm-ls | rg --smart-case --fixed-strings --passthru"

# function adbgmsup() {
# 	adbup "com.google.android.gsf" "com.google.android.gms" "com.android.vending" "com.nvidia.ota"
# 	adb shell am force-stop "com.google.android.tvlauncher"
# }
# function adbgmsdown() {
# 	adbdown "com.android.vending" "com.google.android.gms" "com.google.android.gsf" "com.nvidia.ota"
# 	adb shell am force-stop "com.google.android.tvlauncher"
# }

# declare PLAY_STORE_PACKAGES=(
# 	"android.autoinstalls.config.nvidia"
# 	"com.android.inputmethod.latin"
# 	"com.android.vending"
# 	"com.google.android.backdrop"
# 	"com.google.android.ext.services"
# 	"com.google.android.ext.shared"
# 	"com.google.android.feedback"
# 	"com.google.android.gms"
# 	"com.google.android.gsf"
# 	"com.google.android.inputmethod.latin"
# 	"com.google.android.katniss"
# 	"com.google.android.leanbacklauncher.recommendations"
# 	"com.google.android.music"
# 	"com.google.android.overlay.googlewebview"
# 	"com.google.android.play.games"
# 	"com.google.android.sss"
# 	"com.google.android.sss.authbridge"
# 	"com.google.android.tts"
# 	"com.google.android.tv.bugreportsender"
# 	"com.google.android.tvrecommendations"
# 	"com.google.android.youtube.tv"
# 	"com.nvidia.ota"
# )
