source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/deving.sh"
source "$DOTFILES/modules/homebrew.sh"

alias pst="pstree -w"

alias dstore="find . -name '*.DS_Store*' -type f -delete"
alias quarantine="sudo xattr -rd com.apple.quarantine"
alias hosts="sudo subl /etc/hosts"
alias hosts-flush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias rmtrash="exa -a -h -l -F -g -m $HOME/.Trash; echo; sudo rm -rf $HOME/.Trash/*"
alias prettierrc="subl $HOME/.prettierrc"

alias pfc="sudo subl /etc/pf.conf"
alias pfs="sudo pfctl -q -s info | head -n 1; sudo pfctl -q -s states"
alias pfsa="sudo pfctl -q -s all"
alias pfd="sudo pfctl -q -d -F all; pfs"
alias pfu="sudo pfctl -q -d -F all || true; sudo pfctl -q -F all -e -f /etc/pf.conf; pfs"

alias razer-up="open -a RzDeviceEngine && open -a RzUpdater"
alias razer-down="killit RzDeviceEngine && killit RzUpdater"

unalias src
alias dot="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Dotfiles.sublime-project'"
function dotpush() {
	cd "$DOTFILES"
	local GS="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $GS"
	git push origin master
	cd "$OLDPWD"
}

function adbsu() {
	adb shell su -c ${@:2}
}

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"
