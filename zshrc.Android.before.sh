export SHELL="$(which zsh)"

export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

test -x "$(which nano)" && export EDITOR="nano"
test -x "$(which subl)" && export EDITOR="subl"

test -d "/data/data/com.termux/files/usr/share/fzf" && export FZF_BASE="/data/data/com.termux/files/usr/share/fzf"

test -x "$(which whoami)" && export USER="$(whoami)"
if [[ "$USER" == "root" ]]; then
	unset HISTFILE
fi
