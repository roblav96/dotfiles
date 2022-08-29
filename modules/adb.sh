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
	export ANDROID_SERIAL="${$(adb devices 2>/dev/null | tail -n+2 | awk '{ print $1 }')%:5555}"
fi
# [[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="192.168.2.116"
# [[ -z "$ANDROID_SERIAL" ]] && export ANDROID_SERIAL="1323319022018"
alias adbre='adb kill-server && sleep 0.1; adb connect $ANDROID_SERIAL && adb devices -l'

# alias clp="curl --proxy $ANDROID_SERIAL:11080"
function cltv() {
	local proxy="$ANDROID_SERIAL:11080" && curl --silent "$proxy" &>/dev/null || proxy="$(getrouter):11080"
	if [[ "$1" == "premiumize" ]]; then
		curl --proxy "$proxy" "https://www.premiumize.me/api/transfer/directdl?customer_id=$PREMIUMIZE_ID&pin=$PREMIUMIZE_PIN&src=magnet:?xt=urn:btih:$2" | jq '.content' | jq "map(select(.link|endswith(\"${3:-mkv}\")))" | jq 'map(.link)[]' --raw-output | sortt --field-separator='/' --key=10
	elif [[ "$1" == "real-debrid" ]]; then
		curl --proxy "$proxy" "https://api.real-debrid.com/rest/1.0/unrestrict/link?auth_token=$REALDEBRID_SECRET" -d "link=https://real-debrid.com/d/$2" | jq '.download' --raw-output
	elif [[ "$1" == "alldebrid" ]]; then
		curl --proxy "$proxy" "https://api.alldebrid.com/v4/link/unlock?agent=$ALLDEBRID_AGENT&apikey=$ALLDEBRID_KEY&link=https://uptobox.com/$2" | jq '.data.link' --raw-output
	fi
}

alias adbshell="echo; echo 'export PATH=/data/local/tmp/bin:\$PATH'; echo; adb shell"
alias adbll="adb shell ls --color -lAFh"
alias adbl="adb shell /data/local/tmp/bin/lsd --color=always --icon=never --date=relative --size=short -lAF"
alias adblr="adbl --tree --depth=2"
alias adblra="adbl --tree"
alias adblb="adbl --sizesort --reverse"
alias adblm="adbl --timesort --reverse"
alias adblch="adbl --timesort --reverse"
alias adbfd="adb shell /data/local/tmp/bin/fd --color=always -uu --base-directory=/ --exclude=/dev --exclude=/proc --exclude=/sys --absolute-path"
alias adbcurl="adb shell /data/local/tmp/bin/curl --silent --show-error --fail-early --location --connect-timeout 5"
# alias adbhtop="adb shell TERM=xterm TERMINFO=/data/local/tmp/terminfo /data/local/tmp/bin/htop"
function adbbinstall() {
	local base="$(basename "$1")"
	[[ ! -f "$base" ]] && echo "🔴 !file -> '$base'" && return 1
	adb push "$base" "/data/local/tmp/bin/$base"
	adb shell chmod a+x "/data/local/tmp/bin/$base"
	adb shell "/data/local/tmp/bin/$base" --version
}

# alias rogcat='rogcat $([[ $(tput cols) -lt 125 ]] && echo --hide-timestamp)'
# alias rogcat='rogcat $([[ $(tput cols) -lt 125 ]] && echo --hide-timestamp) --buffer all --message "!^loading \[eventTime=\d" --tag "!^netstats_\w+_sample$"'
# alias rogcat="rogcat \$([[ \$(tput cols) -lt 125 ]] && echo --hide-timestamp) --buffer all \
alias rogcat="rogcat --hide-timestamp --buffer all \
\
--tag '!^JsonPathTypeAdapter$' \
--tag '!^netstats_mobile_sample$' \
--tag '!^netstats_wifi_sample$' \
\
--message '!^uid=\d+.* (expire|identical) \d+ line[s]?$' \
\
--message '!^btif_nv_stats_update_host_stats\(\) addr: ff:ff:ff:ff:ff:ff , json string: cmd_timeout_rsp_after_to$' \
--message '!^Failed to find provider info for com.nvidia.ibeta$' \
--message '!^NvRmStreamFree: WARN: pStream is NULL$' \
--message '!^tsec_version: 1$' \
\
--message '! /dev/usb-ffs/adb/' \
--message '! UsbFfs$' \
--message '!^timed out while waiting for FUNCTIONFS_BIND, trying again$' \
--message '!^UsbFfs' \
\
--message '!^handleComboKeys isOnHomeScreen: false$' \
--message '!^handleComboKeys key(C|c)ode: \d' \
--message '!^isOnHomeScreen mLastTopComponent: null, componentName: ComponentInfo' \
--message '!^oneway function results will be dropped but finished with status OK and parcel size \d+$' \
--message '!^Access denied finding property \"ro.vendor.sys.(NV|nv)' \
--message '!^Access denied finding property \"RB.tag\"$' \
\
--message '!^Input event injection from pid \d+ uid \d+$' \
--message '!^(Starting|Stopping) auto hide ui timer...$' \
--message '!^loading \[eventTime=\d'"

declare rogs="rogcat"
# rogs="$rogs --tag '!^bt_stack$'"
rogs="$rogs --tag '!^(New)?Avrcp'"
rogs="$rogs --message '!^Telecom Service not found.$'"
rogs="$rogs --message '!^SupplicantStartWaitTimer$'"

rogs="$rogs --message '! libvlc services discovery: Server with uuid '"
rogs="$rogs --message '! Trying Lua '"
rogs="$rogs --message '! is an AppCompat widget that can only be used with a Theme.AppCompat theme '"

rogs="$rogs --message '! http stream: in DATA '"
rogs="$rogs --message '! http stream: out WINDOW_UPDATE '"
# rogs="$rogs --message '! VlcObject (expire|identical) \d+ line[s]?$'"

rogs="$rogs --tag '!^nvphsd$'"
rogs="$rogs --message '! /vendor/bin/nvphsd '"
rogs="$rogs --message '! scontext=u:r:nvphsd:s0 '"
rogs="$rogs --message '!\bINvCplHalService\b'"
# rogs="$rogs --message '!\bnvphsd\b'"

rogs="$rogs --message '!^Exception checking for game stream. Exception: '"
# rogs="$rogs --message '!^interceptKeyT. key.ode=\d'"
# rogs="$rogs --message '!^\b\w+ key.ode\b'"

rogs="$rogs --message '!^HttpAccessor#requestConnection: line \d+: '"

# shield-atv-9.0.0
rogs="$rogs --message '!^onRead\(offset=\d+, size=\d+\)$'"
rogs="$rogs --message '!^\[\d{3},\d{2},\d{4}\]$'"
rogs="$rogs --message '!^skip emit ir command, use IR_MODE to send ir command$'"
rogs="$rogs --message '!^Called isFriday vendor:\d+ product:\d+$'"
rogs="$rogs --message '!^stop_output_stream: \d+ underruns seen on pcm device hdmi-playback$'"
rogs="$rogs --message '!^SecureHdcp_GetCurrentLevel: cur: 0x04, max: 0x04$'"

# kodi
rogs="$rogs --message '!^onPlaybackStateChanged\(\): '"
rogs="$rogs --message '!^The callback playback state .* match the current state$'"
rogs="$rogs --message '!^trySendMediaUpdate\(\): Metadata has been updated for '"
rogs="$rogs --message '!^sendMediaUpdate$'"
rogs="$rogs --message '!^sendMediaUpdate: Creating a one item queue for a player with no queue$'"
rogs="$rogs --message '!^sendMediaUpdate state=PlaybackState '"
rogs="$rogs --message '!^onMediaUpdated: track_changed=false state=false queue=false$'"
rogs="$rogs --message '!^sendMediaUpdate: metadata=false playStatus=false queue=false$'"
rogs="$rogs --message '!^sendMediaUpdateNative$'"
rogs="$rogs --message '! virtual void bluetooth::avrcp::AvrcpService::SendMediaUpdate'"
rogs="$rogs --message '!^CAndroidKey: key (down|up) '"
# rogs="$rogs --message '! Resume from position '"
# rogs="$rogs --message '! cache completely reset for seek to position '"

# emulator-5554
rogs="$rogs --message '!^hw scan \d+ MHz$'"

# Chromecast
rogs="$rogs --message '! setMaxDequeuedBufferCount: \d+ dequeued buffers would exceed the maxBufferCount '"
rogs="$rogs --message '!^\[unnamed-\d{5}-\d{3}\] disconnect: not connected \(req=\d+\)$'"
rogs="$rogs --message '!^EGLNativeWindowType \w{10} disconnect failed$'"
rogs="$rogs --message '!^IGraphicBufferProducer::setBufferCount\(\d+\) returned Invalid argument$'"
rogs="$rogs --message '!^get(Current)?PlayStatus$'"
rogs="$rogs --message '!^bufferpool2 .* \(fetch/transfer\)$'"
rogs="$rogs --message '!^a2dp_sbc_get_num_frame_iteration: limiting frames to be sent from '"
rogs="$rogs --message '!^Warning message AMessage\(what = \x27omxI\x27\) = \{$'"
rogs="$rogs --message '!^int32_t (data1|data2|event|type) = \d+$'"
rogs="$rogs --message '!^\} unhandled in root state.$'"
rogs="$rogs --message '!^btif_a2dp_source_read_callback: UNDERFLOW: ONLY READ \d+ BYTES OUT OF \d+$'"
rogs="$rogs --message '!^a2dp_sbc_encode_frames: underflow \d+, \d+$'"
# rogs="$rogs --message '! RunTask: Periodic task execution took \d+ microseconds, longer than interval \d+ microseconds$'"
# rogs="$rogs --message '! ReadAudioData: \d+/\d+ no data \d+ ms$'"

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
# alias rog="rogcat $(printf "--message '%q' " "$rogs") --tag '!^netstats_(\w+)_sample$'"
# unset rogs
# alias rog='rogcat $([[ $COLUMNS -lt 125 ]] && echo --hide-timestamp)'

# function adbt() {
# 	adb shell am broadcast -a ADB_INPUT_B64 --es msg $(echo -n "$*" | base64)
# }
alias adben="adb shell input keyevent KEYCODE_ENTER"
alias adbtt="adb shell input keyboard text"
function adbt() {
	adbtt "$*" && sleep 0.1 && adben
}
alias adbo="adb shell am start -a android.intent.action.VIEW -d"
alias adba="adb shell am start -a android.intent.action.VIEW -t 'audio/*' -d"
alias adbv="adb shell am start -a android.intent.action.VIEW -t 'video/*' -d"
alias adbps="adb shell ps -A -w -f --sort=STIME | sed '/ \[.*\]$/d'"
alias adbp='adbps | rg -v " \d $(adb shell uptime -s | cut -c 12-15)" | sed -e "/ ps -/d" | bl strace'
alias adbtop="adb shell top -H -s11 -d1 -n1 -b | sed '/ \[.*\]$/d'"
alias adbconfig="adb shell am get-config --device | sortt | bl yml"
alias adbprops="adb shell getprop | bl yml"
function adbpropsf() {
	adb shell getprop | rg --smart-case "$@" | bl yml
}
function adbb() {
	adb shell cat "$@" | bat --file-name="$@"
}

function __adbpid() {
	adbps | rg --case-sensitive --fixed-strings "$*" | bl strace
	adbtop | rg --case-sensitive --fixed-strings "$*" | bl strace
	# adb shell cat "/proc/$*/status" | bl yml
} && alias adbpid=" __adbpid"

alias adbmusic="adb shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file:///sdcard/Music"
alias adbls="adb exec-out find /sdcard/ -type f | sed -e '/\/userdata\/Thumbnails\//d' -e '/\/files\/medialib\/thumbnails\//d' -e '/\/projectM\/presets\//d' -e '/\/strings.po$/d'"
alias adbscreenshot='adb exec-out screencap -p > "screenshot.$(date --iso-8601).$(date +%s).png"'

# alias rogcat="rogcat"
alias pidcat="pidcat --tag-width 32 --always-display-tags --all"
# alias adb-pm-bak="adb shell pm list packages -s > pm-list-system.log; adb shell pm list packages -e > pm-list-enabled.log; adb shell pm list packages -d > pm-list-disabled.log; adb shell pm list packages -u > pm-list-uninstalled.log; sd '^package:' '' pm-list-*.log"

alias adbdisplay="adb shell dumpsys SurfaceFlinger | rg --multiline --multiline-dotall --only-matching -e '\n\nh/w composer state.+?Display manufacturer.+?\n' | bl yml"
alias adbaudio="dr $DOTFILES/deno/adb-audio_flinger.ts | sed -e 's/\b =/: /' -e 's/\b=/: /' -e 's/|/ /g' -e 's/\[//g' -e 's/\]//g' | bl yml"
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
			"com.amazon.amazonvideo.livingroom"
			"com.amazon.amazonvideo.livingroom.nvidia"
			# "com.amazon.music.tv"
			# "com.android.defcontainer"
			"com.android.documentsui"
			"com.android.gallery3d"
			"com.android.htmlviewer"
			# "com.android.providers.tv"
			"com.android.tv.settings"
			"com.android.vending"
			# "com.apple.android.music"
			# "com.brouken.player"
			# "com.curiosity.curiositystream.androidtv"
			# "com.doubleiq.podcast"
			# "com.droidlogic"
			# "com.fgl27.twitch"
			# "com.finalwire.aida64"
			"com.google.android.apps.mediashell"
			"com.google.android.apps.tv.launcherx"
			# "com.google.android.exoplayer2.demo"
			# "com.google.android.exoplayer2.playbacktests.test"
			"com.google.android.gms"
			"com.google.android.gsf"
			"com.google.android.inputmethod.latin"
			"com.google.android.leanbacklauncher"
			# "com.google.android.packageinstaller"
			# "com.google.android.tts"
			"com.google.android.tv.axel"
			"com.google.android.tvlauncher"
			"com.google.android.videos"
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
			"com.netflix.ninja"
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
			# [[ "$i" == "com.liskovsoft.leankeyboard" ]] && continue
			[[ "$i" == "me.efesser.flauncher" ]] && continue
			[[ "$i" == "nl.ndat.tvlauncher" ]] && continue
			# [[ "$i" == "org.liskovsoft.androidtv.rukeyboard" ]] && continue
			packages+=("$i")
		done
		adbk $packages
		sleep 0.1
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
		adb shell dumpsys package "$v" | sed 's/\b=/: /' | bat -l yml --file-name="$v"
	done
}
function adbdp() {
	local v && for v in "$@"; do
		adb shell pm dump "$v" | sed 's/\b=/: /' | bat -l yml --file-name="$v"
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
		adb exec-out dumpsys "$v" 2>&1 | sed -e 's/\b =/: /' -e 's/\b=/: /' -e 's/ >/  /' -e 's/ #/ /' -e 's/|/ /g' -e 's/\[//g' -e 's/\]//g' | bl yml
	done
}
function adbdsf() {
	adbdsls | rg --smart-case --fixed-strings "$*" | while read i; do
		adbds "$i"
	done
}

function adbnl() {
	adbcl nl.ndat.tvlauncher
	adb shell pm grant --user 0 nl.ndat.tvlauncher android.permission.READ_EXTERNAL_STORAGE
	sleep 0.1
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
	adb shell settings put global development_settings_enabled '1'
	adb shell settings put global stay_on_while_plugged_in '3'
	adb shell settings put global animator_duration_scale '0.5'
	adb shell settings put global transition_animation_scale '0.5'
	adb shell settings put global window_animation_scale '0.5'
	adb shell settings put secure long_press_timeout '250'
	adb shell settings put secure multi_press_timeout '200'
	adb shell settings put global package_verifier_enable '0'
	adb shell settings put global verifier_verify_adb_installs '0'
	adb shell settings put global verifier_timeout '10000'
	adb shell settings put global package_verifier_user_consent '-1'
}

alias adbkillall="adb shell killall -v rclone tinyproxy"
function adbrclone() {
	adb shell killall -v rclone
	local v && for v in "$@"; do
		adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
			-x /data/local/tmp/bin/rclone -- --config /data/local/tmp/rclone.conf \
			serve dlna "$v:" --name "$v" --addr "$ANDROID_SERIAL:$(porthash "$v")" --read-only --no-modtime
	done
	sleep 0.1
	adbps | rg --case-sensitive --fixed-strings rclone | bl strace
}
function adbtinyproxy() {
	adb shell killall -v tinyproxy
	adb shell /data/local/tmp/bin/start-stop-daemon -S -b -p /dev/null \
		-x /data/local/tmp/bin/tinyproxy -- -c /data/local/tmp/tinyproxy.conf -d
	sleep 0.1
	adbps | rg --case-sensitive --fixed-strings tinyproxy | bl strace
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
# 	# sleep 0.1
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

function adbsmarttv() {
	curl https://github.com/yuliskov/SmartTubeNext/releases/download/latest/smarttube_beta.json 2>/dev/null | head -n$(ty) | bl json
	wget https://github.com/yuliskov/SmartTubeNext/releases/download/latest/smarttube_stable.apk
	apkm smarttube_stable.apk
	adbin smarttube_stable.apk
	rd smarttube_stable.apk
	sleep 3
	adbk com.teamsmart.videomanager.tv
}
function adbkodinerds() {
	local cpu="${1:-"arm64-v8a"}"
	xhp --download -f https://repo.kodinerds.net/index.php \
		"c_item[]=$(curl "https://repo.kodinerds.net/index.php?action=list&scope=all&version=nexus/" \
		| rg -o "download=addons/nexus/zip/net.kodinerds.maven.kodi20.$cpu/net.kodinerds.maven.kodi20.$cpu-.+-Nexus.apk")"
	apkm *-Nexus.apk && adbin *-Nexus.apk && rd *-Nexus.apk
}
function adbvlc() {
	local cpu="${1:-"arm64"}"
	wget "https://artifacts.videolan.org/vlc-android/nightly-$cpu/$(curl "https://artifacts.videolan.org/vlc-android/nightly-$cpu/" \
		| pup 'body > table > tbody > tr:nth-child(2) > td:nth-child(1) > a attr{href}')"
	apkm VLC-Android-*.apk && adbin VLC-Android-*.apk && rd VLC-Android-*.apk
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
