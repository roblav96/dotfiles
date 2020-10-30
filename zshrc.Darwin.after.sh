# source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/dotwatch.sh"

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
			echo && echo "🌕 $ii"
			duti -x "$ii"
			[[ "$1" == "set" && -n "$ii" ]] && duti -s "$bundle_id" "$ii" all
		done
	done
}
# alias duti-sublime='gc https://github.com/sublimehq/Packages && rg --files-with-matches file_extensions | while read i; do echo; echo "🔴 $i"; cat "$i" | oq -i yaml -r ".file_extensions[]" | while read ii; do echo; echo "🌕 $ii"; duti -s com.sublimetext.3 "$ii" all; done; done'
# r --files-with-matches file_extensions | while read i; do echo; echo "🔴 $i"; cat "$i" | oq -i yaml -r '.file_extensions[]' | while read ii; do echo; echo "🌕 $ii"; duti -x "$ii"; done; done

# alias ssh="ssh -L 52698:localhost:52699"
# alias pbcopy="pbcopy -Prefer txt"
alias rmxattr="xattr -c"
alias rmaxattr="xattr -c -r"
alias unquarantine="xattr -d -r com.apple.quarantine"

alias hostsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias .hosts="sudo $EDITOR /etc/hosts"
alias .paths="sudo $EDITOR /etc/paths"
alias .profile="sudo $EDITOR /etc/.profile"

alias .z="subl --new-window $HOME/.z:999999"
alias .zsh_history="subl --new-window $HOME/.zsh_history:999999; exit"
alias .prettierrc="subl --new-window $DOTFILES/configs/.prettierrc"
alias .alacritty="subl --new-window $DOTFILES/configs/alacritty.yml"
alias .starship="subl --new-window $DOTFILES/configs/starship.toml"
alias .ssh_config="subl --new-window $HOME/.ssh/config"
alias .known_hosts="subl --new-window $HOME/.ssh/known_hosts"
alias .rclone="subl --new-window $HOME/.config/rclone/rclone.conf"
alias .h2o="subl --new-window /usr/local/etc/h2o/h2o.conf"

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
alias denon-avr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o yaml --sort-keys '.Information' | pb yaml"
# alias denon-avr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o json --sort-keys --tab '.Information'"
# alias denon-avr="curl --insecure 'https://192.168.2.119:10443/ajax/general/get_config?type=12' | oq -i xml -o json '.Information' | jq --sort-keys --tab '{Audio:.Audio,Video:.Video,Zone:.Zone}'"
# alias denon="curl --insecure 'https://192.168.50.136:10443/ajax/general/get_config?type=12' | xq -x '. | { Audio: .Information.Audio, HDMISignalInfo: .Information.Video.HDMISignalInfo }' | prettier --parser xml | bat --style=grid -l html"

function wifi() {
	m wifi status | bat --file-name='airport --getinfo' -l yml
	networksetup -getinfo 'Wi-Fi' | bat --file-name='networksetup -getinfo Wi-Fi' -l yml
}
alias wifi-setmanual-hotspot='networksetup -setmanual Wi-Fi $(cat $DOTFILES/.env.hotspot)'
alias wifi-setmanual-r7800='networksetup -setmanual Wi-Fi $(cat $DOTFILES/.env.r7800)'
alias wifi-setmanual-e300='networksetup -setmanual Wi-Fi $(cat $DOTFILES/.env.e300)'
alias getip="ifconfig | awk '/inet /{print \$2}' | grep ^192 | cat"

alias display="m display status | bat --plain -l yml"

# alias cdpl='cd "$HOME/.playground"'
# alias cdd='cd "$HOME/Downloads"'
alias lmd='lm --color=always "$HOME/Downloads" | tail --lines="$(expr "$(tput lines)" / 2)"'

alias o="open ."
# function o() {
# 	test $# -eq 0 && open . || open $@
# }; compdef o=open

# alias sw_vers="echo 10.14.6"
# alias sw_vers="echo 10.14.6; &>/dev/null"

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"

function phone-bak() {
	adb shell pm list packages -3 | sed 's|^package:||' | sortt > 'pm list packages -3.log'
	adb shell pm list packages -3 -d | sed 's|^package:||' | sortt > 'pm list packages -3 -d.log'
	adb shell pm list packages -s -d | sed 's|^package:||' | sortt > 'pm list packages -s -d.log'
	adb pull "/sdcard/.rclone/"
	adb pull "/sdcard/.ssh/"
	adb pull "/sdcard/data/"
	adb pull "/sdcard/DCIM/"
	adb pull "/sdcard/Download/"
	adb pull "/sdcard/Pictures/"
	adb pull "/sdcard/SwiftBackup/"
	adb pull "/sdcard/TitaniumBackup/"
}

function app-bak() {
	# echo "🌕 # -> '$#'"
	if [[ -z "$1" ]]; then
		echo "🔴 Application name required"
		return 1
	fi
	local appdir="$HOME/Library/Application Support/$1"
	# echo "🌕 appdir -> '$appdir'"
	if [[ ! -d "$appdir" ]]; then
		echo "🔴 No such file or directory -> '$appdir'"
		return 1
	fi
	local date="$(date --iso-8601)"
	# echo "🌕 date -> '$date'"
	local tarname="${1//\// } ($date).tar.gz"
	# echo "🌕 tarname -> '$tarname'"
	local tarpath="$HOME/Downloads/$tarname"
	# echo "🌕 tarpath -> '$tarpath'"
	if [[ -e "$tarpath" ]]; then
		rm -iv "$tarpath"
		if [[ -e "$tarpath" ]]; then
			echo "🔴 Aborted, existing backup exists"
			return 1
		fi
	fi
	cd "$appdir"
	dstore
	tar --create --gzip --verbose --preserve-permissions --file "$tarpath" --exclude='.git' '.'
	cd "$OLDPWD"
	echo && echo "✅ Backup complete"
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
alias stgs='(stcd && gs)'
alias stgl='(stcd && gla --max-count=1)'
alias stpush='(stcd && gpush)'
function stbak() {
	(
		cd "$(dirname "$SUBLIME_DATA")"
		local name="$(basename "$SUBLIME_DATA")"
		tar --create --gzip --preserve-permissions --verbose --file "$HOME/Downloads/$name ($(date --iso-8601)).tar.gz" "$name" | lscolors
		echo && l "$HOME/Downloads/$name ($(date --iso-8601)).tar.gz"
	)
}
alias sm="smerge"
alias smo="smerge ."

unalias dotsrc &>/dev/null
alias dot="subl '$SUBLIME_DATA/Packages/User/Projects/Dotfiles.sublime-project'"
alias dotgs='(dotcd && gs)'
alias dotgl='(dotcd && gla --max-count=1)'
alias dotpush='(dotcd && gpush) && zcomp'

# echo "🌕 $PLATFORM after -> '$(bc <<< "$(date +%s%3N) - $DOTBENCH")'"
# unset DOTBENCH
