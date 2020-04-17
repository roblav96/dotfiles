export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

if [[ -x "$(which rmate)" ]]; then
	export EDITOR="rmate"
	export VEDITOR="rmate"
elif [[ -x "$(which nano)" ]]; then
	export EDITOR="micro"
	export VEDITOR="micro"
elif [[ -x "$(which nano)" ]]; then
	export EDITOR="nano"
	export VEDITOR="nano"
fi

# export FZF_BASE="$HOME/.fzf"
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
