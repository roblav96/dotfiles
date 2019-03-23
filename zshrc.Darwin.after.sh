
unalias st
unalias src

source "$DOTFILES/bashrc.sh"

alias dot="cd $DOTFILES && st $DOTFILES"

function adbsu() { adb shell su -c ${@:2} }

source "$DOTFILES/modules/brew.sh"
source "$DOTFILES/modules/deving.sh"
