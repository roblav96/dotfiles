
unalias st
unalias src

source "$DOTFILES/bashrc.sh"
# source "$HOME/.tnsrc"

alias dot="st $DOTFILES"
function dotpush() {
	cd $DOTFILES
	local GS="`git status -z`"
	git add -A
	git commit -a -m "$GS"
	git push origin master
	cd $OLDPWD
}

function adbsu() {
	adb shell su -c ${@:2}
}

source "$DOTFILES/modules/brew.sh"
source "$DOTFILES/modules/deving.sh"
