export PASTEL_COLOR_MODE="8bit"
export SDKROOT="macosx10.14"

source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/deving.sh"
source "$DOTFILES/modules/homebrew.sh"
source "$DOTFILES/modules/sublime-text.sh"

alias pst="pstree -w"

# alias dstore="find . -name .DS_Store -type f && find . -name .DS_Store -type f -delete"
alias dstore="fd --hidden --no-ignore --fixed-strings .DS_Store --exec rm -fv {}"
alias unquarantine="sudo xattr -rd com.apple.quarantine"
alias hosts="sudo subl /etc/hosts"
alias hosts-flush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias rmtrash="sudo rm -rfv $HOME/.Trash/.* $HOME/.Trash/* && exit"
alias .prettierrc="subl $DOTFILES/configs/.prettierrc"

alias pfc="sudo subl /etc/pf.conf"
alias pfs="sudo pfctl -q -s info | head -n 1; sudo pfctl -q -s states"
alias pfsa="sudo pfctl -q -s all"
alias pfd="sudo pfctl -q -d -F all; pfs"
alias pfu="sudo pfctl -q -d -F all || true; sudo pfctl -q -F all -e -f /etc/pf.conf; pfs"

alias wgu="sudo launchctl load -w /Library/LaunchDaemons/com.wireguard.ivpn-nj.plist; sleep 1; pfs; ipinfo"
alias wgd="sudo launchctl unload -w /Library/LaunchDaemons/com.wireguard.ivpn-nj.plist; sleep 1; pfd; pfs; ipinfo"

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

alias denon="curl --insecure 'https://192.168.50.136:10443/ajax/general/get_config?type=12' | xq -x '. | { Audio: .Information.Audio, HDMISignalInfo: .Information.Video.HDMISignalInfo }' | prettier --parser xml | bat -l html"

if [[ -x "$(which -p m)" ]]; then
	alias wifi="m wifi status | rg --passthru --ignore-case --regexp='.*rate:.*'"
fi

if test -d "/Applications/Firefox Developer Edition.app"; then
	alias firefox="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox"
	alias firefox-bin="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox-bin"
fi

alias o="open ."
# function o() {
# 	test $# -eq 0 && open . || open $@
# }; compdef o=open

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"

function app-bak() {
	[[ -z "$1" ]] && echo "🔴 Application name required" && return 1
	# echo "🌕 # -> $#"
	local date="$(date --iso-8601)"
	# local date="${$(date --rfc-3339=seconds):0:-6}"
	# local date="${$(date --rfc-3339=date):0:-6}"
	# local date="${$(date --rfc-email):0:-6}"
	# echo "🌕 date -> $date"
	local name="$1 - Backup ($date)"
	local targz="$HOME/Downloads/$name.tar.gz"
	# echo "🌕 targz -> $targz"
	local appdir="$HOME/Library/Application Support/$1"
	[[ ! -d "$appdir" ]] && echo "🔴 No such file or directory -> '$appdir'" && return 1
	# echo "🌕 appdir -> $appdir"
	[[ -f "$targz" ]] && rm -iv "$targz" && [[ -f "$targz" ]] && return 1
	cd "$appdir"
	tar --create --gzip --verbose --file "$targz" --exclude=".git" "."
	cd "$OLDPWD"
	echo; echo "✅ Backup complete -> '$1'"
}

unalias src
alias dot="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Dotfiles.sublime-project'"
alias dotcd="cd $DOTFILES"

function dotpush() {
	cd "$DOTFILES"
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd "$OLDPWD"
}
