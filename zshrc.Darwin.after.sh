# source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/dotwatch.sh"

alias dstore="find . -name .DS_Store -type f -print -delete"
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
alias pbcopy="pbcopy -Prefer txt"
alias rmxattr="xattr -c"
alias rmfxattr="xattr -c -r"
alias unquarantine="xattr -d -r com.apple.quarantine"

alias hostsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias .hosts="sudo $EDITOR /etc/hosts && read -q '?hostsflush...?' && return 1; hostsflush; echo '✅ hostsflush'"
alias .paths="sudo $EDITOR /etc/paths"
alias .profile="sudo $EDITOR /etc/.profile"

alias .z="subl --new-window $HOME/.z:999999"
alias .zsh_history="subl --new-window $HOME/.zsh_history:999999; exit"
alias .prettierrc="subl --new-window $DOTFILES/configs/.prettierrc"
alias .alacritty="subl --new-window $DOTFILES/configs/alacritty.yml"
alias .starship="subl --new-window $DOTFILES/configs/starship.toml"
alias .ssh_config="subl --new-window $HOME/.ssh/config"
alias .known_hosts="subl --new-window $HOME/.ssh/known_hosts"

alias .pfc="sudo $EDITOR /etc/pf.conf"
alias pfcat="cat /etc/pf.conf | grep --invert-match '^#' | sed '/^$/d' | bat --style=grid -l py"
alias pfs="sudo pfctl -q -s info | head -n 1; sudo pfctl -q -s states"
alias pfsr="sudo pfctl -q -s rules | bat --style=grid -l py"
alias pfsa="sudo pfctl -q -s all"
alias pfd="sudo pfctl -q -d -F all; pfs"
alias pfu="sudo pfctl -q -d -F all || true; sudo pfctl -q -F all -e -f /etc/pf.conf; pfs"

alias wg-up="sudo launchctl load -w /Library/LaunchDaemons/com.wireguard.ivpn-nj.plist; sleep 1; echo; sudo wg; echo; pfs"
alias wg-down="sudo launchctl unload -w /Library/LaunchDaemons/com.wireguard.ivpn-nj.plist; sleep 1; echo; sudo wg; echo; pfd"

alias ifcls="ifconfig -v -a -r | bat --style=grid -l yml"
alias lsapps="lsappinfo list | bat --style=grid -l ini"

alias restic-laptop="restic --verbose --repo rclone:drive:restic-laptop"

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

alias voxel="echo; echo nj3nxCEBUX7BDDei; echo; telnet 192.168.1.1"
alias denon-avr="curl --insecure 'https://192.168.2.54:10443/ajax/general/get_config?type=12' | oq -i xml -o json | json '.Information'"
# alias denon="curl --insecure 'https://192.168.50.136:10443/ajax/general/get_config?type=12' | xq -x '. | { Audio: .Information.Audio, HDMISignalInfo: .Information.Video.HDMISignalInfo }' | prettier --parser xml | bat --style=grid -l html"

function wifi() {
	m wifi status | bat --file-name='airport --getinfo' -l yml
	networksetup -getinfo Wi-Fi | bat --file-name='networksetup -getinfo Wi-Fi' -l yml
}
alias wifi-setmanual-hotspot="networksetup -setmanual Wi-Fi 192.168.43.113 255.255.255.0 192.168.43.42"
# alias wifi="m wifi status | rg --passthru --ignore-case --regexp='.*rate:.*'"
alias display="m display status | rg --passthru --ignore-case --regexp='.* Built-In .*'"

alias o="open ."
# function o() {
# 	test $# -eq 0 && open . || open $@
# }; compdef o=open

# alias sw_vers="echo 10.14.6"
# alias sw_vers="echo 10.14.6; &>/dev/null"

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"

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

alias st="subl"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stcdp="cd '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias stcdu="cd '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
alias stst="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Sublime Text.sublime-project'"
alias stgs='(stcd && gs)'
alias stpush='(stcd && gitpush)'
function stbak() {
	(
		cd "$HOME/Library/Application Support"
		tar --create --gzip --preserve-permissions --verbose --file "$HOME/Downloads/Sublime Text ($(date --iso-8601)).tar.gz" "Sublime Text" | lscolors
		echo && l "$HOME/Downloads/Sublime Text ($(date --iso-8601)).tar.gz"
	)
}

alias sm="smerge"
alias smcd="cd '$HOME/Library/Application Support/Sublime Merge'"
alias smcdu="cd '$HOME/Library/Application Support/Sublime Merge/Packages/User'"
alias smgs='(smcd && gs)'
alias smpush='(smcd && gitpush)'

unalias dotsrc &>/dev/null
alias dot="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Dotfiles.sublime-project'"
alias dotgs='(dotcd && gs)'
alias dotpush='(dotcd && gitpush) && zcomp'

# echo "🌕 $PLATFORM after -> '$(bc <<< "$(date +%s%3N) - $DOTBENCH")'"
# unset DOTBENCH
