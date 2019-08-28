export SHELL="$(which zsh)"

export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

export FZF_BASE="/data/data/com.termux/files/usr/share/fzf"

test -x "$(which whoami)" && export USER="$(whoami)"
if [[ "$USER" == "root" ]]; then
	unset HISTFILE
fi
