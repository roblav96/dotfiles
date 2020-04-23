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
fi

# if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
# 	export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/functions:$FPATH"
# 	export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"
# fi

# export FZF_BASE="$HOME/.fzf"
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
