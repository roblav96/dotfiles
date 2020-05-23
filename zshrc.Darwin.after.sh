source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/dotwatch.sh"

alias pst="pstree -w"

alias rmtrash="fd --hidden --no-ignore --exact-depth=1 --base-directory=$HOME/.Trash --exec-batch rm -rfv"
alias dstore="fd --hidden --no-ignore --fixed-strings --type=file .DS_Store --exec-batch rm -fv"
# alias dstore="find . -name .DS_Store -type f && find . -name .DS_Store -type f -delete"

alias pbcopy="pbcopy -Prefer txt"
# alias pbcopy="xargs echo -n | pbcopy -Prefer txt"
alias rmxattr="sudo xattr -rc"
alias unquarantine="sudo xattr -rd com.apple.quarantine"

alias hosts="sudo subl --new-window /etc/hosts"
alias hostsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias paths="sudo subl --new-window /etc/paths"
alias profile="sudo subl --new-window /etc/zprofile /etc/profile"

alias .z="subl --new-window $HOME/.z:999999"
alias .zsh_history="subl --new-window $HOME/.zsh_history:999999"
alias .prettierrc="subl --new-window $DOTFILES/configs/.prettierrc"
alias .starship.toml="subl --new-window $DOTFILES/configs/starship.toml"
alias .ssh_config="subl --new-window $HOME/.ssh/config"

alias pfc="sudo subl --new-window /etc/pf.conf"
alias pfcat="bat /etc/pf.conf -l sh"
alias pfs="sudo pfctl -q -s info | head -n 1; sudo pfctl -q -s states"
alias pfsr="sudo pfctl -q -s rules"
alias pfsa="sudo pfctl -q -s all"
alias pfd="sudo pfctl -q -d -F all; pfs"
alias pfu="sudo pfctl -q -d -F all || true; sudo pfctl -q -F all -e -f /etc/pf.conf; pfs"

alias wg-up="sudo launchctl load -w /Library/LaunchDaemons/com.wireguard.ivpn-nj.plist; sleep 1; echo; sudo wg; echo; pfs"
alias wg-down="sudo launchctl unload -w /Library/LaunchDaemons/com.wireguard.ivpn-nj.plist; sleep 1; echo; sudo wg; echo; pfd"

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

alias voxel="echo; echo nj3nxCEBUX7BDDei; echo; telnet 192.168.1.1"
alias denon="curl --insecure 'https://192.168.50.136:10443/ajax/general/get_config?type=12' | xq -x '. | { Audio: .Information.Audio, HDMISignalInfo: .Information.Video.HDMISignalInfo }' | prettier --parser xml | bat -l html"

alias wifi="m wifi status | rg --passthru --ignore-case --regexp='.*rate:.*'"
alias gpu="m display status | rg --passthru --ignore-case --regexp='.* Built-In .*'"
alias firefox="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox"
alias firefox-bin="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox-bin"

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
alias sm="smerge --new-window"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stcdp="cd '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias stcdu="cd '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
alias stst="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Sublime Text.sublime-project'"
alias stgs='(stcd && gsa)'
alias stpush='(stcd && echo && gs && echo && git add -A && git commit -a -m "[$(uname -o)] $(git status -z)" && git push origin master)'

unalias dotsrc &>/dev/null
alias dot="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Dotfiles.sublime-project'"
alias dotgs='(dotcd && gsa)'
alias dotpush='(dotcd && echo && gs && echo && git add -A && git commit -a -m "[$(uname -o)] $(git status -z)" && git push origin master) && src'
# function dotpush() {
# 	cd "$DOTFILES"
# 	local gs="$(git status -z)"
# 	git add -A
# 	git commit -a -m "[$(uname -o)] $(git status -z)"
# 	git push origin master
# 	cd "$OLDPWD"
# 	src
# }

# echo "🌕 $PLATFORM after -> '$(bc <<< "$(date +%s%3N) - $DOTBENCH")'"
# unset DOTBENCH
