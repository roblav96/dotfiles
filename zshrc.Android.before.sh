# export SHELL="$(which zsh)"

export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

if [[ -d "/data/data/com.termux/files/usr/share/fzf" ]]; then
	export FZF_BASE="/data/data/com.termux/files/usr/share/fzf"
fi

# if [[ -z "$USER" && -x "$(which -p whoami)" ]]; then
# 	export USER="$(whoami)"
# fi
