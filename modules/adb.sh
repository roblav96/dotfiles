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
# [[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="192.168.2.116"
# [[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="1323319022018"

# alias clp="curl --proxy $ANDROID_SERIAL:11080"
function cltv() {
	if [[ "$1" == "premiumize" ]]; then
		curl --proxy "$ANDROID_SERIAL:11080" "https://www.premiumize.me/api/transfer/directdl?customer_id=$PREMIUMIZE_ID&pin=$PREMIUMIZE_PIN&src=magnet:?xt=urn:btih:$2" | jq '.content' | jq "map(select(.link|endswith(\"${3:-mkv}\")))" | jq 'map(.link)[]' --raw-output | sortt --field-separator='/' --key=9
	elif [[ "$1" == "real-debrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:11080" "https://api.real-debrid.com/rest/1.0/unrestrict/link?auth_token=$REALDEBRID_SECRET" -d "link=https://real-debrid.com/d/$2" | jq '.download' --raw-output
	elif [[ "$1" == "alldebrid" ]]; then
		curl --proxy "$ANDROID_SERIAL:11080" "https://api.alldebrid.com/v4/link/unlock?agent=$ALLDEBRID_AGENT&apikey=$ALLDEBRID_KEY&link=https://uptobox.com/$2" | jq '.data.link' --raw-output
	fi
}

# ████  install adb busybox  ████
# adb push busybox-arm64 /data/local/tmp/bin/busybox; adb shell /data/local/tmp/bin/busybox --install -s /data/local/tmp/bin
alias adbshell="echo; echo 'export PATH=/data/local/tmp/bin:\$PATH'; echo; adb shell"
alias adbfd="adb exec-out /data/local/tmp/bin/fd -uu --base-directory=/ --exclude=/dev --exclude=/proc --exclude=/sys --absolute-path --fixed-strings"
alias adbl="adb exec-out /data/local/tmp/bin/ls --color=auto -laph"

# alias rogcat='rogcat $([[ $(tput cols) -lt 125 ]] && echo --hide-timestamp)'
# alias rogcat='rogcat $([[ $(tput cols) -lt 125 ]] && echo --hide-timestamp) --buffer all --level trace --message "!^loading \[eventTime=\d" --tag "!^netstats_\w+_sample$"'
# alias rogcat="rogcat \$([[ \$(tput cols) -lt 125 ]] && echo --hide-timestamp) --buffer all --level trace \
alias rogcat="rogcat --hide-timestamp --buffer all --level trace \
--tag '!^netstats_mobile_sample$' \
--tag '!^netstats_wifi_sample$' \
--message '!^Access denied finding property \"RB.tag\"$' \
--message '!^getLayerReleaseFence failed for display -1: Invalid display$' \
--message '!^loading \[eventTime=\d'"
declare rogs="rogcat"
rogs="$rogs --tag '!^bt_stack$'"
rogs="$rogs --tag '!^NewAvrcp'"
rogs="$rogs --message '!^Telecom Service not found.$'"
rogs="$rogs --message '!^SupplicantStartWaitTimer$'"

rogs="$rogs --message '! libvlc services discovery: Server with uuid '"
rogs="$rogs --message '! Trying Lua '"
rogs="$rogs --message '! is an AppCompat widget that can only be used with a Theme.AppCompat theme '"

rogs="$rogs --message '! http stream: in DATA '"
rogs="$rogs --message '! http stream: out WINDOW_UPDATE '"
rogs="$rogs --message '! VlcObject (expire|identical) \d+ line[s]?$'"

rogs="$rogs --tag '!^JsonPathTypeAdapter$'"
rogs="$rogs --tag '!^nvphsd$'"
rogs="$rogs --message '! /vendor/bin/nvphsd '"
rogs="$rogs --message '! scontext=u:r:nvphsd:s0 '"
rogs="$rogs --message '!\bINvCplHalService\b'"
# rogs="$rogs --message '!\bnvphsd\b'"

rogs="$rogs --message '!^isOnHomeScreen mLastTopComponent: null, componentName: ComponentInfo'"
rogs="$rogs --message '!^handleComboKeys isOnHomeScreen: false$'"
rogs="$rogs --message '!^Failed to find provider info for com.nvidia.ibeta$'"
rogs="$rogs --message '!^uid=1000\(system\) /system/bin/surfaceflinger identical \d line'"
rogs="$rogs --message '!^Exception checking for game stream. Exception: '"
rogs="$rogs --message '!^handleComboKeys key.ode: \d'"
rogs="$rogs --message '!^interceptKeyT. key.ode=\d'"
# rogs="$rogs --message '!^\b\w+ key.ode\b'"

rogs="$rogs --message '!^HttpAccessor#requestConnection: line \d+: '"

# emulator-5554
rogs="$rogs --message '!^hw scan \d+ MHz$'"

# Chromecast
rogs="$rogs --message '! setMaxDequeuedBufferCount: \d+ dequeued buffers would exceed the maxBufferCount '"
rogs="$rogs --message '!^\[unnamed-\d{5}-\d{3}\] disconnect: not connected \(req=\d+\)$'"
rogs="$rogs --message '!^EGLNativeWindowType \w{10} disconnect failed$'"
rogs="$rogs --message '!^IGraphicBufferProducer::setBufferCount\(\d+\) returned Invalid argument$'"
rogs="$rogs --message '!^get(Current)?PlayStatus$'"
rogs="$rogs --message '!^bufferpool2 .* \(fetch/transfer\)$'"

# # Pixel 3
# rogs="$rogs --message '!name=tethering scontext=u:r:grilservice_app:'"

# # Emulator
# rogs="$rogs --message '!^Can.t find service car_service$'"

# rogs="$rogs --message '!^CAndroidKey: key (down|up) '"
# rogs="$rogs --message '!^dispatchVolumeKeyEvent, pkg='"

# rogs="$rogs --message '!^new range: offset='"
# rogs="$rogs --message '!flags=\d+, suggestedStream=-\d+, preferSuggestedStream=false$'"
# rogs="$rogs --message '!process_input: Failure reading next input event: Try again$'"
# rogs="$rogs --tag '!^JS$'"
# rogs="$rogs --tag '!^JsonPath'"
# rogs="$rogs --tag '!^mobile-ffmpeg$'"
alias rog="$rogs"
unset rogs
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
alias adben="adb shell input keyevent KEYCODE_ENTER"
alias adbtt="adb shell input keyboard text"
function adbt() {
	adbtt "$*" && sleep 1 && adben
}
alias adbo="adb shell am start -a android.intent.action.VIEW -d"
alias adba="adb shell am start -a android.intent.action.VIEW -t 'audio/*' -d"
alias adbv="adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"
alias adbps="adb shell ps -A -w -f --sort=STIME | sed '/ \[.*\]$/d'"
alias adbp='adbps | grep -v " 0 $(adb shell uptime -s | cut -c 12-15)" | sed -e "/ ps -/d" -e "/ gost -/d" -e "/ rclone -/d" -e "/ com.genymobile.scrcpy./d" | bl strace'
alias adbtop="adb shell top -H -s11 -d1 -n1 -b | sed '/ \[.*\]$/d'"
alias adbconfig="adb shell am get-config --device | sortt | bl yml"
alias adbprops="adb shell getprop | sortt | bl sh"
function adbpropsf() {
	adb shell getprop | sortt | rg --smart-case "$@" | bl sh
}

function __adbpid() {
	adbps | rg --case-sensitive --fixed-strings "$*" | bl nix
	adbtop | rg --case-sensitive --fixed-strings "$*" | bl nix
	# adb shell cat "/proc/$*/status" | bl yml
} && alias adbpid=" __adbpid"

alias adbmusic="adb shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file:///sdcard/Music"
alias adbls="adb exec-out find /sdcard/ -type f | sed -e '/\/userdata\/Thumbnails\//d' -e '/\/files\/medialib\/thumbnails\//d' -e '/\/projectM\/presets\//d' -e '/\/strings.po$/d'"
alias adbscreenshot='adb exec-out screencap -p > "screenshot.$(date --iso-8601).$(date +%s).png"'

# alias rogcat="rogcat --level trace"
alias pidcat="pidcat --tag-width 32 --always-display-tags --all"
# alias adb-pm-bak="adb shell pm list packages -s > pm-list-system.log; adb shell pm list packages -e > pm-list-enabled.log; adb shell pm list packages -d > pm-list-disabled.log; adb shell pm list packages -u > pm-list-uninstalled.log; sd '^package:' '' pm-list-*.log"

alias adbdisplay="adb shell dumpsys SurfaceFlinger | rg --multiline --multiline-dotall --only-matching --regexp='\n\nh/w composer state.+?Display manufacturer.+?\n' | t2 | bl yml"
alias adbaudio="adbds media.audio_flinger"
alias adbstack="adb shell am stack list | sed 's/\b=/: /g' | t1 | bl yml"

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
		local packages=(
			# "app.debrids.tv"
			# "at.nullptr.dlnachannels"
			# "au.com.shiftyjelly.pocketcasts"
			# "com.amazon.amazonvideo.livingroom"
			# "com.amazon.amazonvideo.livingroom.nvidia"
			# "com.amazon.music.tv"
			# "com.android.defcontainer"
			"com.android.documentsui"
			"com.android.gallery3d"
			"com.android.htmlviewer"
			"com.android.vending"
			# "com.apple.android.music"
			# "com.brouken.player"
			# "com.curiosity.curiositystream.androidtv"
			# "com.doubleiq.podcast"
			# "com.fgl27.twitch"
			# "com.finalwire.aida64"
			"com.google.android.apps.mediashell"
			# "com.google.android.exoplayer2.demo"
			# "com.google.android.exoplayer2.playbacktests.test"
			"com.google.android.gms"
			"com.google.android.gsf"
			# "com.google.android.leanbacklauncher"
			# "com.google.android.packageinstaller"
			# "com.google.android.tts"
			"com.google.android.webview"
			# "com.google.android.youtube.tv"
			# "com.google.android.youtube.tvunplugged"
			# "com.google.stadia.androidtv"
			# "com.hbo.hbonow"
			# "com.hulu.livingroomplus"
			# "com.kfaraj.launcher"
			# "com.liskovsoft.smarttubetv"
			# "com.liskovsoft.leankeyboard"
			# "com.liskovsoft.smarttubetv.beta"
			# "com.liskovsoft.videomanager"
			# "com.mxtech.videoplayer.ad"
			# "com.mxtech.videoplayer.pro"
			# "com.mxtech.videoplayer.television"
			# "com.netflix.ninja"
			# "com.nvidia.feedback"
			# "com.nvidia.nvgamecast"
			# "com.nvidia.osc"
			"com.nvidia.ota"
			"com.nvidia.shieldbeta"
			# "com.parseus.codecinfo"
			# "com.peacocktv.peacockandroid"
			# "com.perflyst.twire"
			# "com.semperpax.spmc16"
			# "com.softmedia.receiver"
			# "com.softmedia.receiver.lite"
			# "com.sony.dtv.smartmediaapp"
			# "com.soundcloud.android"
			# "com.spotify.tv.android"
			# "com.teamsmart.videomanager.tv"
			# "com.vanced.manager"
			# "com.wiseplay"
			# "de.benzac.msx"
			# "de.cyberdream.iptv.tv.player"
			# "eu.chainfire.tv.sideloadlauncher"
			# "io.github.x0b.rcx"
			# "is.xyz.mpv"
			# "me.aap.fermata.auto"
			# "net.kodinerds.maven.kodi20"
			# "net.mediaarea.mediainfo"
			# "org.acestream.live"
			# "org.acestream.media.atv"
			# "org.courville.nova"
			# "org.jellyfin.androidtv"
			# "org.jellyfin.mobile"
			# "org.mozilla.tv.firefox"
			# "org.polymorphicshade.newpipe"
			# "org.schabi.newpipe"
			# "org.schabi.newpipelegacy"
			# "org.videolan.vlc"
			# "org.videolan.vlc.debug"
			# "org.videolan.vlcbenchmark"
			# "org.xbmc.kodi"
			# "pl.solidexplorer2"
			# "ru.iptvremote.android.iptv"
			# "se.hedekonsult.pvrlive"
			# "tv.emby.embyatv"
			# "tv.mrmc.mrmc"
			# "tv.mrmc.mrmc.lite"
			# "tv.twitch.android.app"
			# "us.nineworlds.serenity"
		)
		adb shell pm list packages -3 -e | sed 's/^package://' | while read i; do
			[[ "$i" == "nl.ndat.tvlauncher" ]] && continue
			[[ "$i" == "com.liskovsoft.leankeyboard" ]] && continue
			[[ "$i" == "org.liskovsoft.androidtv.rukeyboard" ]] && continue
			packages+=("$i")
		done
		adbk $packages
		sleep 1
		adbp
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
	# adbk nl.ndat.tvlauncher
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
		adb exec-out dumpsys "$v" 2>&1 | sed 's/\b=/: /' | t2 | bl yml
	done
}
function adbdsf() {
	adbdsls | rg --case-sensitive --fixed-strings "$*" | while read i; do
		adbds "$i"
	done
}

function adbnl() {
	adbcl nl.ndat.tvlauncher
	adb shell pm grant --user 0 nl.ndat.tvlauncher android.permission.READ_EXTERNAL_STORAGE
	sleep 1
	adb shell pm set-home-activity --user 0 nl.ndat.tvlauncher/.LauncherActivity
}

# https://developer.android.com/reference/android/provider/Settings
function adbsettingsls() {
	echo && echo "🟡 System Settings"
	adb shell settings list system | bl ini
	echo && echo "🟡 Secure Settings"
	adb shell settings list secure | bl ini
	echo && echo "🟡 Global Settings"
	adb shell settings list global | bl ini
}
function adbsettingsf() {
	echo && echo "🟡 System Settings"
	adb shell settings list system | rg --smart-case --fixed-strings -- "$*" | bl ini
	echo && echo "🟡 Secure Settings"
	adb shell settings list secure | rg --smart-case --fixed-strings -- "$*" | bl ini
	echo && echo "🟡 Global Settings"
	adb shell settings list global | rg --smart-case --fixed-strings -- "$*" | bl ini
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
	adb shell killall -v rclone
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "WD_GRAPHITE:" --name "WD_GRAPHITE" --addr "0.0.0.0:$(porthash "WD_GRAPHITE")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "premiumize:" --name "premiumize" --addr "0.0.0.0:$(porthash "premiumize")" --read-only
	# adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
	# 	-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
	# 	serve dlna "premiumizeme:" --name "premiumizeme" --addr "0.0.0.0:$(porthash "premiumizeme")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "alldebrid:" --name "alldebrid" --addr "0.0.0.0:$(porthash "alldebrid")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "megadav:" --name "megadav" --addr "0.0.0.0:$(porthash "megadav")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "Movies:" --name "Movies" --addr "0.0.0.0:$(porthash "Movies")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "Music:" --name "Music" --addr "0.0.0.0:$(porthash "Music")" --read-only
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
		serve dlna "youtube-dls:" --name "youtube-dls" --addr "0.0.0.0:$(porthash "youtube-dls")" --read-only
	sleep 1
	adbps | rg --case-sensitive --fixed-strings rclone | bl nix
}
function adbgost() {
	adb shell killall -v gost
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/gost -- -L "http://$ANDROID_SERIAL:11080?dns=1.1.1.1:53/tcp,1.1.1.1:853/tls,https://1.1.1.1/dns-query"
	sleep 1
	adbps | rg --case-sensitive --fixed-strings gost | bl nix
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
	# adbk nl.ndat.tvlauncher
}
function adbup() {
	local v && for v in "$@"; do
		adb shell pm enable --user 0 "$v"
	done
	# adbk nl.ndat.tvlauncher
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
