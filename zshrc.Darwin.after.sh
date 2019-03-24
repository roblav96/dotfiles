
unalias st
unalias src

source "$DOTFILES/bashrc.sh"

alias dot="cd $DOTFILES && st $DOTFILES"
function dotpush() {
	local GS=`git status -z`
	git add -A
	git commit -a -m "$GS `date '+%x %r'`"
	git push origin master
}

function adbsu() {
	adb shell su -c ${@:2}
}

source "$DOTFILES/modules/brew.sh"
source "$DOTFILES/modules/deving.sh"
