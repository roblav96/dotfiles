export SHELL="$(which zsh)"
export TERM="xterm-256color"

export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

export FZF_BASE="$HOME/.fzf"

test -x "$(which whoami)" && export USER="$(whoami)"
test $USER == "root" && unset HISTFILE
