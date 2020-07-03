export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

# if [[ -d "/home/linuxbrew/.linuxbrew/opt/openssl" ]]; then
# 	export OPENSSL_ROOT_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
# fi

# [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/functions:$FPATH"
# [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/site-functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"
if [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/site-functions" && ":$FPATH:" != *":/home/linuxbrew/.linuxbrew/share/zsh/site-functions:"* ]]; then
	export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"
fi

# export FZF_BASE="$HOME/.fzf"
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
