export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

if [[ -x "$(which -p rmate)" ]]; then
	export EDITOR="rmate"
	export VEDITOR="rmate"
elif [[ -x "$(which -p nano)" ]]; then
	export EDITOR="nano"
	export VEDITOR="nano"
fi

if [[ -d "/home/linuxbrew/.linuxbrew/opt/openssl" ]]; then
	export OPENSSL_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
	export OPENSSL_ROOT_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
fi

[[ -d "/home/linuxbrew/.linuxbrew/share/zsh/functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/functions:$FPATH"
[[ -d "/home/linuxbrew/.linuxbrew/share/zsh/site-functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"

# export FZF_BASE="$HOME/.fzf"
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
