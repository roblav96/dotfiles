unalias st
unalias src

source "$DOTFILES/bashrc.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/deving.sh"
source "$DOTFILES/modules/homebrew.sh"
source "$DOTFILES/modules/sublime-text.sh"

alias pst="pstree -w"

alias dot="st $DOTFILES; st $DOTFILES/zshrc.sh"
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
