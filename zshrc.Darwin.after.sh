# source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/dotwatch.sh"

alias dstore="find . -name .DS_Store -type f -print -delete"
# alias dstore="fd --hidden --no-ignore --fixed-strings --type=file .DS_Store --exec-batch rm -fv"

alias pbcopy="pbcopy -Prefer txt"
alias rmxattr="xattr -c"
alias rmfxattr="xattr -c -r"
alias unquarantine="xattr -d -r com.apple.quarantine"

alias hostsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias .hosts="sudo micro /etc/hosts && read -q '?hostsflush...?' && return 1; hostsflush; echo '✅ hostsflush'"
alias .paths="sudo micro /etc/paths"
alias .profile="sudo micro /etc/.profile"

alias .z="subl --new-window $HOME/.z:999999"
alias .zsh_history="subl --new-window $HOME/.zsh_history:999999; exit"
alias .prettierrc="subl --new-window $DOTFILES/configs/.prettierrc"
alias .alacritty="subl --new-window $DOTFILES/configs/alacritty.yml"
alias .starship="subl --new-window $DOTFILES/configs/starship.toml"
alias .ssh_config="subl --new-window $HOME/.ssh/config"
alias .known_hosts="subl --new-window $HOME/.ssh/known_hosts"

alias .pfc="sudo micro /etc/pf.conf"
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

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

alias voxel="echo; echo nj3nxCEBUX7BDDei; echo; telnet 192.168.1.1"
alias denon="curl --insecure 'https://192.168.2.54:10443/ajax/general/get_config?type=12' | pb xml"
# alias denon="curl --insecure 'https://192.168.50.136:10443/ajax/general/get_config?type=12' | xq -x '. | { Audio: .Information.Audio, HDMISignalInfo: .Information.Video.HDMISignalInfo }' | prettier --parser xml | bat --style=grid -l html"

alias wifi="m wifi status | rg --passthru --ignore-case --regexp='.*rate:.*'"
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
	if [[ -f "$tarpath" ]]; then
		rm -iv "$tarpath"
		if [[ -f "$tarpath" ]]; then
			echo "🔴 Aborted, existing backup exists"
			return 1
		fi
	fi
	cd "$appdir"
	dstore
	tar --create --gzip --verbose --preserve-permissions --file "$tarpath" --exclude='.git' '.'
	cd "$OLDPWD"
	echo; echo "✅ Backup complete"
	echo; exa --oneline "$tarpath"
}

alias st="subl"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stcdp="cd '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias stcdu="cd '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
alias stst="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Sublime Text.sublime-project'"
alias stgs='(stcd && gs)'
alias stpush='(stcd && gpush)'

alias sm="smerge --new-window"
alias smcd="cd '$HOME/Library/Application Support/Sublime Merge'"
alias smcdu="cd '$HOME/Library/Application Support/Sublime Merge/Packages/User'"
alias smgs='(smcd && gs)'
alias smpush='(smcd && gpush)'

unalias dotsrc &>/dev/null
alias dot="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Dotfiles.sublime-project'"
alias dotgs='(dotcd && gs)'
alias dotpush='(dotcd && gpush) && zcomp'

# echo "🌕 $PLATFORM after -> '$(bc <<< "$(date +%s%3N) - $DOTBENCH")'"
# unset DOTBENCH
