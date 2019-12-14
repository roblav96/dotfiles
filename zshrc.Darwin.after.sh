source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/deving.sh"
source "$DOTFILES/modules/homebrew.sh"
source "$DOTFILES/modules/sublime-text.sh"

alias pst="pstree -w"

# alias dstore="find . -name .DS_Store -type f && find . -name .DS_Store -type f -delete"
alias dstore="fd --hidden --no-ignore --fixed-strings .DS_Store --exec rm -fv {}"
alias quarantine="sudo xattr -rd com.apple.quarantine"
alias hosts="sudo subl /etc/hosts"
alias hosts-flush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias rmtrash="sudo rm -rfv $HOME/.Trash/* && exit"
alias prettierrc="subl $DOTFILES/configs/.prettierrc"

alias pfc="sudo subl /etc/pf.conf"
alias pfs="sudo pfctl -q -s info | head -n 1; sudo pfctl -q -s states"
alias pfsa="sudo pfctl -q -s all"
alias pfd="sudo pfctl -q -d -F all; pfs"
alias pfu="sudo pfctl -q -d -F all || true; sudo pfctl -q -F all -e -f /etc/pf.conf; pfs"

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

unalias src
alias dot="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Dotfiles.sublime-project'"
function dotgh() {
	github "$DOTFILES"
}
function dotstatus() {
	cd "$DOTFILES"
	git status --short --branch
	cd "$OLDPWD"
}
function dotdiff() {
	cd "$DOTFILES"
	git diff
	cd "$OLDPWD"
}
function dotpush() {
	cd "$DOTFILES"
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd "$OLDPWD"
}

if [[ -x "$(which -p m)" ]]; then
	alias wifi="m wifi status | rg --passthru --smart-case --regexp='.*rate:.*'"
fi

if test -d "/Applications/Firefox Developer Edition.app"; then
	alias firefox="'/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox'"
	alias firefox-bin="'/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox-bin'"
fi

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"
