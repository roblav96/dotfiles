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
# [[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="192.168.1.2"
[[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="192.168.2.40"

function curltv() {
	if [[ "$1" == "premiumize" ]]; then
		curl --proxy "$ANDROID_SERIAL:11080" "https://www.premiumize.me/api/transfer/directdl?customer_id=$PREMIUMIZE_ID&pin=$PREMIUMIZE_PIN&src=magnet:?xt=urn:btih:$2" | jq '.content' | jq "map(select(.link|endswith(\"${3:-mkv}\")))" | jq 'map(.link)[]' --raw-output | sortt --field-separator='/' --key=10
	elif [[ "$1" == "real-debrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:11080" "https://api.real-debrid.com/rest/1.0/unrestrict/link?auth_token=$REALDEBRID_SECRET" -d "link=https://real-debrid.com/d/$2" | jq '.download' --tab --monochrome-output --raw-output
	elif [[ "$1" == "alldebrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:11080" "https://api.alldebrid.com/v4/link/unlock?agent=$ALLDEBRID_AGENT&apikey=$ALLDEBRID_KEY&link=https://uptobox.com/$2" | jq '.data.link' --tab --monochrome-output --raw-output
	fi
}
which cltv &>/dev/null || alias cltv="curltv"

# ████  install adb busybox  ████
# adb push busybox-arm64 /data/local/tmp/bin/busybox; adb shell /data/local/tmp/bin/busybox --install -s /data/local/tmp/bin
alias adbshell="echo; echo 'export PATH=/data/local/tmp/bin:\$PATH'; echo; adb shell"
alias adbfd="adb shell /data/local/tmp/bin/fd -uu --fixed-strings --absolute-path --base-directory=/ --exclude=/dev --exclude=/proc --exclude=/sys"

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
	rogs="$rogs --message '!^CAndroidKey: key (down|up) '"
	rogs="$rogs --message '!^dispatchVolumeKeyEvent, pkg='"
	rogs="$rogs --message '!^Exception checking for game stream. Exception: '"
	rogs="$rogs --message '!^getLayerReleaseFence failed for display -1: Invalid display$'"
	rogs="$rogs --message '!^handleComboKeys key.ode: \d'"
	rogs="$rogs --message '!^interceptKeyT. key.ode=\d'"
	rogs="$rogs --message '!^new range: offset='"
	rogs="$rogs --message '!flags=\d+, suggestedStream=-\d+, preferSuggestedStream=false$'"
	rogs="$rogs --message '!process_input: Failure reading next input event: Try again$'"
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
alias adben="adb shell input keyevent KEYCODE_ENTER"
alias adbo="adb shell am start -a android.intent.action.VIEW -d"
alias adba="adb shell am start -a android.intent.action.VIEW -t 'audio/*' -d"
alias adbv="adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"
alias adbps="adb shell ps -A -w -f --sort=STIME | sed '/ \[.*\]$/d'"
alias adbtop="adb shell top -H -s11 -d1 -n1 -b | sed '/ \[.*\]$/d'"
alias adbconfig="adb shell am get-config --device | sortt | bl yml"
alias adbprops="adb shell getprop | sortt | bl sh"
function adbpropsf() {
	adb shell getprop | sortt | rg --smart-case "$@" | bl sh
}

alias adbpid=" adbps | rg --case-sensitive --fixed-strings"
function __adbpida() {
	adbps | rg --case-sensitive --fixed-strings "$*" | bl nix
	adbtop | rg --case-sensitive --fixed-strings "$*" | bl nix
	adb shell cat "/proc/$*/status" | bl yml
} && alias adbpida=" __adbpida"

alias adbmusic="adb shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file:///sdcard/Music"
alias adbls="adb shell find /sdcard/ -type f | sed -e '/\/userdata\/Thumbnails\//d' -e '/\/projectM\/presets\//d' -e '/\/strings.po$/d' | sortt"
alias adbscreenshot='adb shell "screencap -p" > "screenshot.$(date --iso-8601).$(date +%s).png"'

# alias rogcat="rogcat --level trace"
alias pidcat="pidcat --all"
# alias adb-pm-bak="adb shell pm list packages -s > pm-list-system.log; adb shell pm list packages -e > pm-list-enabled.log; adb shell pm list packages -d > pm-list-disabled.log; adb shell pm list packages -u > pm-list-uninstalled.log; sd '^package:' '' pm-list-*.log"

alias adbdisplay="adb shell dumpsys SurfaceFlinger | rg --multiline --multiline-dotall --only-matching --regexp='\n\nh/w composer state.+?Display manufacturer.+?\n' | t2 | bl yml"
alias adbaudio="adbds media.audio_flinger"
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
alias gallery3d="adb shell am start -n com.android.gallery3d/.app.MovieActivity -d"

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
			"com.android.gallery3d"
			"com.android.vending"
			"com.brouken.player.online"
			"com.curiosity.curiositystream.androidtv"
			"com.fgl27.twitch"
			"com.finalwire.aida64"
			"com.google.android.apps.mediashell"
			"com.google.android.exoplayer2.demo"
			"com.google.android.exoplayer2.playbacktests.test"
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
			"com.mxtech.videoplayer.ad"
			"com.mxtech.videoplayer.pro"
			"com.netflix.ninja"
			"com.nvidia.nvgamecast"
			"com.nvidia.osc"
			"com.nvidia.ota"
			"com.parseus.codecinfo"
			"com.peacocktv.peacockandroid"
			"com.perflyst.twire"
			"com.semperpax.spmc16"
			"com.softmedia.receiver"
			"com.softmedia.receiver.lite"
			"com.soundcloud.android"
			"com.spotify.tv.android"
			"com.teamsmart.videomanager.tv"
			"com.vanced.manager"
			"eu.chainfire.tv.sideloadlauncher"
			"io.github.x0b.rcx"
			"is.xyz.mpv"
			"me.aap.fermata.auto"
			"net.mediaarea.mediainfo"
			"org.courville.nova"
			"org.jellyfin.androidtv"
			"org.jellyfin.androidtv.debug"
			"org.jellyfin.mobile"
			"org.mozilla.tv.firefox"
			"org.polymorphicshade.newpipe"
			"org.schabi.newpipe"
			"org.schabi.newpipelegacy"
			"org.videolan.vlc"
			"org.videolan.vlc.debug"
			"org.videolan.vlcbenchmark"
			"org.xbmc.kodi"
			"pl.solidexplorer2"
			"tv.emby.embyatv"
			"tv.mrmc.mrmc"
			"tv.mrmc.mrmc.lite"
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
		adb shell rm -rf "/sdcard/Android/data/$v/"
		adb shell rm -rf "/sdcard/Android/obb/$v/"
	done
}
function adbrm() {
	local v && for v in "$@"; do
		adb shell am force-stop "$v"
		adb shell pm clear "$v"
		adb uninstall "$v"
		adb shell rm -rf "/sdcard/Android/data/$v/"
		adb shell rm -rf "/sdcard/Android/obb/$v/"
	done
}
function adbi() {
	local v && for v in "$@"; do
		adb shell dumpsys package "$v" | sed 's/\b=/: /' | t2 | bat -l yml --file-name="$v"
	done
}
function adbdp() {
	local v && for v in "$@"; do
		adb shell pm dump "$v" | sed 's/\b=/: /' | t2 | bat -l yml --file-name="$v"
	done
}
function adblp() {
	local v && for v in "$@"; do
		adb shell monkey -p "$v" -c android.intent.category.LAUNCHER 1
	done
}

alias adbdsls="adb shell dumpsys -l | tail -n+2 | sed 's/^  //'"
function adbds() {
	local v && for v in "$@"; do
		echo && bhr && echo "█ $v"
		adb shell dumpsys "$v" 2>&1 | sed 's/\b=/: /' | t2 | bl yml
	done
	# adb shell dumpsys "$*" | sed 's/\b=/: /' | t2 | bat -l yml --file-name="$*"
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
	adb shell settings put global animator_duration_scale 0.5
	adb shell settings put global transition_animation_scale 0.5
	adb shell settings put global window_animation_scale 0.5
	adb shell settings put global hidden_api_policy 1
	adb shell settings put global hidden_api_policy_p_apps 1
	adb shell settings put global hidden_api_policy_pre_p_apps 1
	adb shell settings put secure long_press_timeout 250
	adb shell settings put secure multi_press_timeout 250
	local verify="1" && [[ "$ANDROID_SERIAL" == "emulator-5554" ]] && verify="0"
	adb shell settings put global verifier_verify_adb_installs $verify
}

function adbrclone() {
	# adb shell find /data/local/tmp -type f -name '*.pid' -print -delete
	adb shell killall -v -KILL rclone
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "WD_GRAPHITE:" --name "WD_GRAPHITE" --addr "$ANDROID_SERIAL:$(porthash "WD_GRAPHITE")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "premiumizeme:" --name "premiumizeme" --addr "$ANDROID_SERIAL:$(porthash "premiumizeme")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "alldebrid:" --name "alldebrid" --addr "$ANDROID_SERIAL:$(porthash "alldebrid")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "mega:Public" --name "mega" --addr "$ANDROID_SERIAL:$(porthash "mega")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "megadav" --name "megadav" --addr "$ANDROID_SERIAL:$(porthash "megadav")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "Movies:" --name "Movies" --addr "$ANDROID_SERIAL:$(porthash "Movies")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "Music:" --name "Music" --addr "$ANDROID_SERIAL:$(porthash "Music")" --read-only
	sleep 1
	adbps | g rclone | bl nix
}
function adbgost() {
	adb shell killall -v -KILL gost
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/gost -- -L "http://$ANDROID_SERIAL:11080?dns=1.1.1.1:53/tcp,1.1.1.1:853/tls,https://1.1.1.1/dns-query"
	sleep 1
	adbps | g gost | bl nix
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
		# if [[ -d "$v" ]]; then
		# 	echo "🔴 directory exists -> '$v'"
		# 	return 1
		# fi
		# echo && mkdir "$v"
		# adb shell pm path --user 0 "$v" | sed 's/^package://' | while read i; do
		# 	adb pull "$i" "$v"
		# done
		# echo && la "$v"
	done
}

function adbdown() {
	local v && for v in "$@"; do
		adb shell pm disable-user --user 0 "$v" && adb shell am force-stop "$v"
	done
	adb shell am force-stop com.google.android.tvlauncher
	sleep 1
	adb shell input keyevent KEYCODE_HOME
}
function adbup() {
	local v && for v in "$@"; do
		adb shell pm enable --user 0 "$v"
	done
	adb shell am force-stop com.google.android.tvlauncher
	sleep 1
	adb shell input keyevent KEYCODE_HOME
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
