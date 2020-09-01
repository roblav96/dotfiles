# export SHELL="$(which zsh)"

export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

[[ -d "/data/data/com.termux/files/usr/share/fzf" ]] && export FZF_BASE="/data/data/com.termux/files/usr/share/fzf"

# if [[ -z "$USER" && -x "$(which -p whoami)" ]]; then
# 	export USER="$(whoami)"
# fi
