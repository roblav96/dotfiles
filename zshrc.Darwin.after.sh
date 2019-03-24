
unalias st
unalias src

source "$DOTFILES/bashrc.sh"

alias dot="cd $DOTFILES && st $DOTFILES"
function dotpush() {
	GS="`git status -z`"
	echo "GS -> $GS"
	DATE="`date '+%x %r'`"
	echo "DATE -> $DATE"
	MESSAGE="$GS - $DATE"
	echo "MESSAGE -> $MESSAGE"
	git add -A
	git commit -a -m "$MESSAGE"
	git push origin master
}

function adbsu() {
	adb shell su -c ${@:2}
}

source "$DOTFILES/modules/brew.sh"
source "$DOTFILES/modules/deving.sh"
