unalias st
unalias src

alias pst="pstree -w"

source "$DOTFILES/bashrc.sh"

alias dot="st $DOTFILES"
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

source "$DOTFILES/modules/homebrew.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/deving.sh"
