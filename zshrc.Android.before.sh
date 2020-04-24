# export SHELL="$(which zsh)"

export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

# if [[ -x "$(which rmate)" ]]; then
# 	export EDITOR="rmate"
# 	export VEDITOR="rmate"
# elif [[ -x "$(which micro)" ]]; then
# 	export EDITOR="micro"
# 	export VEDITOR="micro"
# el
if [[ -x "$(which nano)" ]]; then
	export EDITOR="nano"
	export VEDITOR="nano"
	export VISUAL="nano"
fi

# test -d "/data/data/com.termux/files/usr/share/fzf" && export FZF_BASE="/data/data/com.termux/files/usr/share/fzf"

test -x "$(which whoami)" && export USER="$(whoami)"
if [[ "$USER" == "root" ]]; then
	unset HISTFILE
fi
