unalias st
unalias src

source "$DOTFILES/bashrc.sh"
# source "$HOME/.tnsrc"

alias dot="st $DOTFILES"

function adbsu() {
	adb shell su -c ${@:2}
}

source "$DOTFILES/modules/brew.sh"
source "$DOTFILES/modules/color.sh"
source "$DOTFILES/modules/deving.sh"
