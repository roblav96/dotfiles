export SHELL="$(which zsh)"
export TERM="xterm-256color"

export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

export FZF_BASE="/data/data/com.termux/files/usr/share"
# export FZF_BASE="$HOME/.fzf"

test -x "`which whoami`" && export USER="`whoami`"
if [[ "$USER" == "root" ]]; then
	unset HISTFILE
fi
