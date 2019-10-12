export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

if test -x "$(which nano)"; then
	export EDITOR="nano"
	export VEDITOR="nano"
fi

# export FZF_BASE="$HOME/.fzf"
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
