export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

export EDITOR="nano"
export VEDITOR="nano"
export VISUAL="nano"
# if [[ -x "$(which -p rmate)" ]]; then
# 	export EDITOR="rmate"
# 	export VEDITOR="rmate"
# 	export VISUAL="rmate"
# elif [[ -x "$(which -p nano)" ]]; then
# 	export EDITOR="nano"
# 	export VEDITOR="nano"
# 	export VISUAL="nano"
# fi

if [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
	alias brew="$HOME/.linuxbrew/bin/brew"
fi

# if [[ -d "/home/linuxbrew/.linuxbrew/opt/openssl" ]]; then
# 	export OPENSSL_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
# 	export OPENSSL_ROOT_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
# fi

# [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/functions:$FPATH"
# [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/site-functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"

# export FZF_BASE="$HOME/.fzf"
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
