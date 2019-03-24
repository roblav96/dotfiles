
unalias st
unalias src

source "$DOTFILES/bashrc.sh"

alias dot="cd $DOTFILES && st $DOTFILES"
# alias dotpush="git commit -a -m `date` && git push origin master"
# alias dotpush="git commit -a --amend --no-edit && git push --force origin master"

function adbsu() { adb shell su -c ${@:2} }

source "$DOTFILES/modules/brew.sh"
source "$DOTFILES/modules/deving.sh"
