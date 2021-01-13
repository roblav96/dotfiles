#!/usr/bin/env zsh

# source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/dotwatch.sh"

alias ii="iina"
alias mp="command mpv --msg-module --msg-level=all=info"
alias dstore="find . -type f -name .DS_Store -print -delete"
# alias dstore="fd --hidden --no-ignore --fixed-strings --type=file .DS_Store --exec-batch rm -fv"

alias duti-cache="(/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump | grep uti: | awk '{ print \$2 }' | sortt | uniq) > $HOME/.cache/lsregister.duti.dump && wc --lines $HOME/.cache/lsregister.duti.dump"
alias duti-ls="cat $HOME/.cache/lsregister.duti.dump"
function duti-sublime() {
	git clone "https://github.com/sublimehq/Packages.git"
	cd "Packages"
	rm "AppleScript/AppleScript.sublime-syntax" "C++/C++.sublime-settings" "R/R Console.sublime-syntax"
	local bundle_id="$(osascript -e 'id of app "Sublime Text"')"
	rg --files-with-matches "file_extensions" | while read i; do
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
alias rmxattr="xattr -c"
alias rmaxattr="xattr -c -r"
alias unquarantine="xattr -d -r com.apple.quarantine"

alias hostsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias .hosts="sudo $EDITOR /etc/hosts"
alias .paths="sudo $EDITOR /etc/paths"
alias .profile="sudo $EDITOR /etc/.profile"

alias .prettierrc="subl $DOTFILES/configs/.prettierrc"
alias .gitconfig="subl $DOTFILES/configs/gitignore $DOTFILES/configs/gitconfig"
alias .alacritty="subl $DOTFILES/configs/alacritty.yml"
alias .starship="subl $DOTFILES/configs/starship.toml"
alias .ssh_config="subl $HOME/.ssh/config"
alias .known_hosts="subl $HOME/.ssh/known_hosts"
alias .rclone="subl $HOME/.config/rclone/rclone.conf"
alias .h2o="subl /usr/local/etc/h2o/h2o.conf"
alias .gradle="subl $HOME/.gradle/gradle.properties"

alias .pfc="sudo $EDITOR /etc/pf.conf"
alias pfcat="cat /etc/pf.conf | sed -e '/^[ ]*#/d' -e '/^$/d' | bat --file-name=/etc/pf.conf -l py"
alias pfs="sudo pfctl -q -s info | head -n 1; sudo pfctl -q -s states"
alias pfsr="sudo pfctl -q -s rules | bat --style=grid -l py"
alias pfsa="sudo pfctl -q -s all"
alias pfd="sudo pfctl -q -d -F all; pfs"
alias pfu="sudo pfctl -q -d -F all || true; sudo pfctl -q -F all -e -f /etc/pf.conf; pfs"

alias wg-up="sudo launchctl load -w /Library/LaunchDaemons/com.wireguard.ivpn-ny.plist; sleep 1; echo; sudo wg; echo; pfs"
alias wg-down="sudo launchctl unload -w /Library/LaunchDaemons/com.wireguard.ivpn-ny.plist; sleep 1; echo; sudo wg; echo; pfd"

alias gmls="genyshell -c 'devices list'; echo; VBoxManage list vms"
alias gmup="open -a player --args --vm-name"

alias ifcls="ifconfig -v -a -r | bat --style=grid -l yml"
alias lsapps="lsappinfo list | bat --style=grid -l ini"

alias restic-laptop="restic --verbose --repo rclone:drive:restic-laptop"

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

alias gmtool="gmtool --verbose"

alias voxel="echo; echo nj3nxCEBUX7BDDei; echo; telnet 192.168.1.1"

alias denonavr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o yaml '.Information' | prettier --parser yaml | bl yml"
# alias denonavr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o yaml '.Information' | t2 | bat --style=grid -l yml"
alias denonavr-device-info='curl http://192.168.2.119:8080/goform/Deviceinfo.xml | oq -i xml -o yaml | prettier --parser yaml | bl yml'
# alias denon-avr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o json --sort-keys --tab '.Information'"
# alias denon-avr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o json '.Information' | jq --sort-keys --tab '{Audio:.Audio,Video:.Video,Zone:.Zone}'"
# alias denon="curl --insecure 'https://192.168.50.136:10443/ajax/general/get_config?type=12' | xq -x '. | { Audio: .Information.Audio, HDMISignalInfo: .Information.Video.HDMISignalInfo }' | prettier --parser xml | bat --style=grid -l html"

function tapianalyze() {
	tapi-analyze -v "$@" | bat --style=grid -l yml
} && compdef tapianalyze=tapi-analyze

function wifi() {
	m wifi status | bat --file-name='airport --getinfo' -l yml
	networksetup -getinfo 'Wi-Fi' | bat --file-name='networksetup -getinfo Wi-Fi' -l yml
}
# alias wifi-setmanual-hotspot='networksetup -setmanual Wi-Fi $(cat $DOTFILES/.env.hotspot)'
# alias wifi-setmanual-r7800='networksetup -setmanual Wi-Fi $(cat $DOTFILES/.env.r7800)'
# alias wifi-setmanual-e300='networksetup -setmanual Wi-Fi $(cat $DOTFILES/.env.e300)'

alias mdisplay="m display status | bl yml"

alias cdp="cd $HOME/.playground"
alias cdd="cd $HOME/Downloads"
alias lmd="lm --color=always $HOME/Downloads | tail --lines=\$(ty)"

alias o="open ."
# function o() {
# 	test $# -eq 0 && open . || open $@
# }; compdef o=open

# alias sw_vers="echo 10.14.6"
# alias sw_vers="echo 10.14.6; &>/dev/null"

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"

function phone-bak() {
	adb shell pm list packages -3 | sed 's|^package:||' | sortt >'pm_list_packages_-3.log'
	adb shell pm list packages -3 -d | sed 's|^package:||' | sortt >'pm_list_packages_-3_-d.log'
	adb shell pm list packages -s -d | sed 's|^package:||' | sortt >'pm_list_packages_-s_-d.log'
	adb pull "/sdcard/.rclone/"
	adb pull "/sdcard/.ssh/"
	adb pull "/sdcard/data/"
	adb pull "/sdcard/DCIM/"
	adb pull "/sdcard/Download/"
	adb pull "/sdcard/Pictures/"
	adb pull "/sdcard/SwiftBackup/"
	adb pull "/sdcard/TitaniumBackup/"
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

declare SUBLIME_DATA="$(realpath "$HOME/Library/Application Support/Sublime Text 3")"
alias st="subl"
alias stn="subl --new-window"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd '$SUBLIME_DATA'"
alias stcdp="cd '$SUBLIME_DATA/Packages'"
alias stcdu="cd '$SUBLIME_DATA/Packages/User'"
alias stst="subl '$SUBLIME_DATA/Packages/User/Projects/Sublime Text.sublime-project'"
alias stgs="(stcd && gs)"
alias stgl="(stcd && gla --max-count=1)"
alias stpush="(stcd && gpush)"
alias stupd='
(cd "$HOME/Sandbox/Packages" && echo && echo "▶ $(pwd)" && gpr && gmt -q);
(cd "$HOME/Sandbox/PackageDev" && echo && echo "▶ $(pwd)" && gpr && gmt -q);
'
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

unalias dotsrc &>/dev/null
alias dot="subl --command 'project_manager {\"project\": \"Dotfiles\"}'"
alias dotgs="(dotcd && gs)"
alias dotgl="(dotcd && gla --max-count=1)"
alias dotpush="(dotcd && gpush) && zcomp"

if [[ -n "$DOTBENCH" ]]; then
	echo && echo "🟠 DOTBENCH -> $(bc <<<"$(date +%s%3N) - $DOTBENCH")"
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
