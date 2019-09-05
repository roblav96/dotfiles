source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/deving.sh"
source "$DOTFILES/modules/homebrew.sh"
source "$DOTFILES/modules/sublime-text.sh"

alias pst="pstree -w"
alias dns-flush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

alias pf='sudo st /etc/pf.conf'
alias pfs='sudo echo; sudo pfctl -q -s info | head -n 1; echo; sudo pfctl -q -s states'
alias cargobin='ln -sf ~/.cargo/bin/* /usr/local/bin'

unalias src
alias dot='st "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Dotfiles.sublime-workspace"'
function dotpush() {
	cd $DOTFILES
	local GS="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $GS"
	git push origin master
	cd $OLDPWD
}

function adbsu() {
	adb shell su -c ${@:2}
}

# test -x "$(which awless)" && source <(awless completion zsh)
# test -x "$(which awless)" && source "$DOTFILES/completions/awless.completion.zsh"
