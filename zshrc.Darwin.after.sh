#!/usr/bin/env zsh

# source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/dotwatch.sh"

function binstall() {
	local base="$(basename "$1")"
	[[ ! -f "$base" ]] && echo "🔴 !file -> '$base'" && return 1
	local target="$(readlink -f "${2:-"$(brew --prefix)/bin"}")"
	[[ ! -d "$target" ]] && echo "🔴 !directory -> '$target'" && return 1
	cp -f -t "$target" "$base"
	chown $(id -un):admin "$target/$base"
	chmod 755 "$target/$base"
}

function ldd() {
	local v && for v in "$@"; do
		dyldinfo -dylibs "$v" | lscolors
	done
}

alias real-debrid="(cd ~/Projects/userscripts && just run src/real-debrid.ts)"

# alias ii="iina"
# alias vlc="vlc --verbose 2"
# alias mpv="mpv --msg-module --msg-level=all=status --no-audio-display"
alias .mpv-debug-input="mpv --input-test --input-cursor=no --force-window --idle"
# function .mpv.debug.input() {
# 	bhr
# 	echo "█ mplayer-input.conf" && curl https://raw.githubusercontent.com/mpv-player/mpv/master/etc/mplayer-input.conf | sed 's/^#\b//' | bl config
# 	echo "█ input.conf" && curl https://raw.githubusercontent.com/mpv-player/mpv/master/etc/input.conf | sed 's/^#\b//' | bl config
# 	mpv --input-test --input-cursor=no --force-window --idle
# }
# alias dstore="find . -type f -name .DS_Store -print -delete"
alias dstore="fd -uu --type=file --glob '.DS_Store' --exec-batch rm -fv"
alias kextstat="kextstat -sort"
if [[ -x "$(brew --prefix)/bin/scp" ]]; then
	alias scp="scp -D $(brew --prefix)/opt/openssh/libexec/sftp-server -4 -p -r"
fi

alias installer="installer -verbose"
alias pkginfo="installer -pkginfo -pkg"
alias pkgls="pkgutil --pkgs | sortt"
function pkgi() {
	local v && for v in "$@"; do
		echo && echo "🟡 $v"
		pkgutil --pkg-info "$v" | bl yml
		pkgutil --only-files --files "$v" | sed 's#^#/#' | sortt | lscolors
	done
}

[[ -x "/Applications/FileMonitor.app/Contents/MacOS/FileMonitor" ]] && alias FileMonitor="/Applications/FileMonitor.app/Contents/MacOS/FileMonitor"
[[ -x "/Applications/DNSMonitor.app/Contents/MacOS/DNSMonitor" ]] && alias DNSMonitor="/Applications/DNSMonitor.app/Contents/MacOS/DNSMonitor"
[[ -x "/Applications/ProcessMonitor.app/Contents/MacOS/ProcessMonitor" ]] && alias ProcessMonitor="/Applications/ProcessMonitor.app/Contents/MacOS/ProcessMonitor"

alias .duti-cache="(lsregister -dump | rg --color=never -e '^uti:\s+(\S+)' -or '\$1' | sortt --unique) > $HOME/.cache/lsregister.duti.dump && wc --lines $HOME/.cache/lsregister.duti.dump"
alias .duti-ls="cat $HOME/.cache/lsregister.duti.dump"
function .duti-sublime() {
	gc 'https://github.com/sublimehq/Packages'
	rm 'AppleScript/AppleScript.sublime-syntax' 'C++/C++.sublime-settings' 'R/R Console.sublime-syntax'
	local bundle_id="$(osascript -e 'id of app "Sublime Text"')"
	rg --files-with-matches 'file_extensions' | while read i; do
		echo && echo "🔴 $i 🔴"
		cat "$i" | oq -i yaml -r '.file_extensions[]' | while read ii; do
			echo && echo "🟡 $ii"
			duti -x "$ii"
			[[ -n "$ii" ]] && duti -s "$bundle_id" "$ii" all
		done
	done
}
# alias duti-sublime='gc https://github.com/sublimehq/Packages && rg --files-with-matches file_extensions | while read i; do echo; echo "🔴 $i"; cat "$i" | oq -i yaml -r ".file_extensions[]" | while read ii; do echo; echo "🟡 $ii"; duti -s com.sublimetext.3 "$ii" all; done; done'
# r --files-with-matches file_extensions | while read i; do echo; echo "🔴 $i"; cat "$i" | oq -i yaml -r '.file_extensions[]' | while read ii; do echo; echo "🟡 $ii"; duti -x "$ii"; done; done

# alias ssh="ssh -L 52698:localhost:52699"
# alias pbcopy="pbcopy -Prefer txt"
alias ppcopy="tr -d '\n' | pbcopy"
alias pwg="pwgen --ambiguous --num-passwords=1 16"
alias gpw="echo; pwg | tee /dev/tty | tr -d '\n' | pbcopy"
# alias gpw="echo; gpg --armor --gen-random 0 12 | tee /dev/tty | tr -d '\n' | pbcopy"

alias hostsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias .hosts="sudo $EDITOR /etc/hosts && echo '$(echo $aliases[hostsflush])' && hostsflush"
alias .paths="sudo $EDITOR /etc/paths"
alias .profile="sudo $EDITOR /etc/.profile"

alias .alacritty="subl $DOTFILES/configs/alacritty.yml"
alias .gitconfig="subl $DOTFILES/configs/gitconfig"
alias .gitignore="subl $DOTFILES/configs/gitignore"
alias .gradle="subl $DOTFILES/configs/gradle.properties"
alias .prettierrc="subl $DOTFILES/configs/.prettierrc"
alias .starship="subl $DOTFILES/configs/starship.toml"

alias .ssh_config="subl $HOME/.ssh/config"
alias .known_hosts="subl $HOME/.ssh/known_hosts"
alias .rclone="subl $HOME/.config/rclone/rclone.conf"
alias .vlc="subl $HOME/Library/Preferences/org.videolan.vlc/vlcrc"
alias .h2o="subl $(brew --prefix)/etc/h2o/h2o.conf"
alias .nginx="subl $(brew --prefix)/etc/nginx/nginx.conf"
alias .lighttpd="subl $(brew --prefix)/etc/lighttpd/lighttpd.conf"

alias .pfc="sudo $EDITOR /etc/pf.conf"
alias pfcat="cat /etc/pf.conf | sed -e '/^[ ]*#/d' -e '/^$/d' | bat --file-name=/etc/pf.conf -l py"
alias pfs="sudo pfctl -q -s info | head -n 1; sudo pfctl -q -s states"
alias pfsr="sudo pfctl -q -s rules | bat --style=grid -l py"
alias pfsa="sudo pfctl -q -s all"
alias pfd="sudo pfctl -q -d -F all; pfs"
alias pfu="sudo pfctl -q -d -F all || true; sudo pfctl -q -F all -e -f /etc/pf.conf; pfs"

alias wgdown="wg-quick down ivpn.ny || true; echo; sudo wg"
alias wgup="wgdown; echo; wg-quick up ivpn.ny; echo; sudo wg"
# alias wg-up="sudo launchctl load -w /Library/LaunchDaemons/com.wireguard.ivpn-ny.plist; sleep 1; echo; sudo wg; echo; pfs"
# function wg-up() {
# 	# [[ -z "$1" ]] && echo "🔴 WireGuard interface -> 'com.wireguard.$1.plist'" && return 1
# 	if [[ ! -e "/Library/LaunchDaemons/com.wireguard.$1.plist" ]]; then
# 		echo "🔴 '/Library/LaunchDaemons/com.wireguard.$1.plist' -> Not Found"
# 		return 1
# 	fi
# 	wg-down
# 	sudo launchctl load -w "/Library/LaunchDaemons/com.wireguard.$1.plist"
# 	sleep 1 && echo
# 	sudo wg && echo
# 	pfs
# }
# alias wg-down="sudo launchctl unload -w /Library/LaunchDaemons/com.wireguard.ivpn-ny.plist; sleep 1; echo; sudo wg; echo; pfd"
# function wg-down() {
# 	find /Library/LaunchDaemons -type f -name 'com.wireguard.*.plist' | while read i; do (
# 		# echo && echo "▶ $i" &&
# 		sudo launchctl unload -w "$i" 2> /dev/null
# 	); done
# 	echo && sleep 1
# 	sudo wg
# 	pfd
# 	# local i && for i in /Library/LaunchDaemons/com.wireguard.*.plist; do (
# 	# 	echo && echo "▶ $i" && sudo launchctl unload -w "$i"
# 	# ); done
# }

alias gmls="genyshell -c 'devices list'; echo; VBoxManage list vms"
alias gmup="open -a player --args --vm-name"

alias ifcls="ifconfig -v -a -r | bat --style=grid -l yml"
alias lsapps="lsappinfo list | bat --style=grid -l ini"

alias restic-laptop="restic --verbose --repo rclone:drive:restic-laptop"

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

alias gmtool="gmtool --verbose"

alias voxel="echo; echo nj3nxCEBUX7BDDei; echo; telnet 192.168.1.1"
alias voxel-gost=" echo 'start-stop-daemon -S -b -x /root/gost -- -L=:11080'"

alias avr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o yaml '{MainZone:.Information.Zone.MainZone,HDMISignalInfo:.Information.Video.HDMISignalInfo,HDMIMonitor1:.Information.Video.HDMIMonitor1,Audio:.Information.Audio}' | t2 | bl yml"
alias avr.device-info="curl http://192.168.2.119:8080/goform/Deviceinfo.xml | oq -i xml -o yaml | t2 | bl yml"
# alias denonavr="curl --insecure 'https://192.168.1.119:10443/ajax/general/get_config?type=12' | oq -i xml -o yaml '.Information' | prettier --parser yaml | bl yml"
# alias denonavr="curl --insecure 'https://192.168.1.119:10443/ajax/general/get_config?type=12' | oq -i xml -o yaml '.Information' | t2 | bat --style=grid -l yml"
# alias denon-avr="curl --insecure 'https://192.168.1.119:10443/ajax/general/get_config?type=12' | oq -i xml -o json --sort-keys --tab '.Information'"
# alias denon-avr="curl --insecure 'https://192.168.1.119:10443/ajax/general/get_config?type=12' | oq -i xml -o json '.Information' | jq --sort-keys --tab '{Audio:.Information.Audio,Video:.Information.Video,Zone:.Information.Zone}'"
# alias denon="curl --insecure 'https://192.168.50.136:10443/ajax/general/get_config?type=12' | xq -x '. | { Audio: .Information.Audio, HDMISignalInfo: .Information.Video.HDMISignalInfo }' | prettier --parser xml | bat --style=grid -l html"

function upg() {
	bhr && echo "🟡 brew" && bhr
	bupd; bupg; bclr
	bhr && echo "🟡 npm" && bhr
	npmo -g; npmupgg
	bhr && echo "🟡 gem" && bhr
	gemupgsys; gemupg; gemclr
	bhr && echo "🟡 tldr" && bhr
	tldr --update
	bhr && echo "🟡 rustup" && bhr
	rustup update
	bhr && echo "🟡 cargo" && bhr
	cgout; cgupg
	bhr && echo "🟡 antibody update" && bhr
	abupd
}

function tapianalyze() {
	tapi-analyze -v "$@" | bat --style=grid -l yml
} && compdef tapianalyze=tapi-analyze

function wifi() {
	m wifi status | bat --file-name='airport --getinfo' -l yml
	networksetup -getinfo 'Wi-Fi' | bat --file-name='networksetup -getinfo Wi-Fi' -l yml
}
# alias wifi-setmanual-hotspot='networksetup -setmanual Wi-Fi $(cat $DOTFILES/configs/.env.hotspot)'
# alias wifi-setmanual-r7800='networksetup -setmanual Wi-Fi $(cat $DOTFILES/configs/.env.r7800)'
# alias wifi-setmanual-e300='networksetup -setmanual Wi-Fi $(cat $DOTFILES/configs/.env.e300)'

alias mdisplay="m display status | bl yml"

alias cdd="cd ~/Downloads"
alias lmd="lm --color=always ~/Downloads | tail --lines=\$(ty)"

alias o="open ."
# function o() {
# 	test $# -eq 0 && open . || open $@
# }; compdef o=open

# alias sw_vers="echo 10.14.6"
# alias sw_vers="echo 10.14.6; &>/dev/null"

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"

alias fastboot="arch -x86_64 fastboot"
function phone-bak() {
	local i && for i in "data" "DCIM" "Download" "Pictures" "SwiftBackup" "TitaniumBackup"; do
		adb pull "/sdcard/$i/"
	done
	if [[ -d "Pictures" ]]; then
		fd --search-path "Pictures" --type=directory --hidden --case-sensitive --glob ".thumbnails" --exec-batch rm -rf
	fi
	[[ ! -d "Download" ]] && mkdir -p "Download"
	adb shell pm list packages -3 | sed 's/^package://' | sortt > "Download/pm_user.log"
	adb shell pm list packages -3 -d | sed 's/^package://' | sortt > "Download/pm_user_disabled.log"
	adb shell pm list packages -s -d | sed 's/^package://' | sortt > "Download/pm_system_disabled.log"
}

function fbak() {
	local outzip="$HOME/Downloads/$*.bak.$(dateiso).zip"
	[[ -e "$outzip" ]] && rd "$outzip"
	echo
	fd --base-directory=$HOME --search-path=Library \
		--exclude=Caches --exclude=CrashReporter --exclude=WebKit --exclude=.git \
		--type=file --full-path "$*" \
		--exec-batch zip -r "$outzip"
	echo && l "$outzip"
}

function app-bak() {
	# echo "🟡 # -> '$#'"
	if [[ -z "$1" ]]; then
		echo "🔴 Application name required"
		return 1
	fi
	local appdir="$HOME/Library/Application Support/$1"
	# echo "🟡 appdir -> '$appdir'"
	if [[ ! -d "$appdir" ]]; then
		echo "🔴 No such file or directory -> '$appdir'"
		return 1
	fi
	local date="$(dateiso)"
	# echo "🟡 date -> '$date'"
	local tarname="${1//\// } ($date).tar.gz"
	# echo "🟡 tarname -> '$tarname'"
	local tarpath="$HOME/Downloads/$tarname"
	# echo "🟡 tarpath -> '$tarpath'"
	if [[ -e "$tarpath" ]]; then
		rm -iv "$tarpath"
		if [[ -e "$tarpath" ]]; then
			echo "🔴 Aborted, existing backup exists"
			return 1
		fi
	fi
	cd "$appdir"
	dstore
	tar --create --gzip --verbose --preserve-permissions --file "$tarpath" --exclude='.git' '.' | lscolors
	cd "$OLDPWD"
	echo && echo "🟢 Backup complete"
	echo && exa --oneline "$tarpath"
}

local SUBLIME_DATA="$(realpath "$HOME/Library/Application Support/Sublime Text")"
alias st="subl"
alias stn="subl --new-window"
alias sto="subl --new-window --command 'prompt_select_workspace'"
alias stcd="cd '$SUBLIME_DATA'"
alias stcdp="cd '$SUBLIME_DATA/Packages'"
alias stcdu="cd '$SUBLIME_DATA/Packages/User'"
alias stst="subl --project '$SUBLIME_DATA/Packages/User/Projects/Sublime Text.sublime-project'"
alias stgs="(stcd && gs)"
alias stgl="(stcd && gla --max-count=1)"
alias stpush="(stcd && gpush)"
function stbak() {
	(
		cd "$(dirname "$SUBLIME_DATA")"
		local name="$(basename "$SUBLIME_DATA")"
		tar --create --gzip --preserve-permissions --verbose --file "$HOME/Downloads/$name ($(dateiso)).tar.gz" "$name" | lscolors
		echo && l "$HOME/Downloads/$name ($(dateiso)).tar.gz"
	)
}
alias sm="smerge"
alias smo="smerge ."

declare VSCODE_DATA="$(realpath "$HOME/Library/Application Support/VSCodium")"
alias vs="code"
alias vsn="code --new-window"
alias vscd="cd '$VSCODE_DATA'"
alias vscdp="cd '$HOME/.vscode-oss/extensions'"
alias vscdu="cd '$VSCODE_DATA/User'"

unalias dotsrc &> /dev/null
alias dot="subl --project '$SUBLIME_DATA/Packages/User/Projects/Dotfiles.sublime-project'"
alias dotgs="(dotcd && gs)"
alias dotgl="(dotcd && gla --max-count=1)"
alias dotpush="(dotcd && gpush) && zcomp"

if [[ -n "$DOTBENCH" ]]; then
	echo && echo "🟠 DOTBENCH -> $(bc <<< "$(date +%s%3N) - $DOTBENCH")"
	unset DOTBENCH
fi

# unalias k &>/dev/null
# function k() {
# 	local cmds=$@
# 	if [[ $# -eq 0 ]]; then
# 		cmds=(
# 			"com.apple.CoreSimulator.CoreSimulatorService"
# 			"dart"
# 			"dotnet"
# 			"gradle"
# 			"ibtoold"
# 			"IDECacheDeleteAppExtension"
# 			"java"
# 			"just"
# 			"mono"
# 			"mono-sgen32"
# 			"mono-sgen64"
# 			"node"
# 			"npm"
# 			"rls"
# 			"rust-analyzer"
# 			"script"
# 			"SimAudioProcessorService"
# 			"SimLaunchHostService"
# 			"SimStreamProcessorService"
# 			"SimulatorTrampoline"
# 			"watchexec"
# 		)
# 	fi
# 	killall -KILL "$cmds"
# } && compdef k=killall
