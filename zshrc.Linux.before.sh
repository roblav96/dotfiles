# if [[ -d "/home/linuxbrew/.linuxbrew/opt/openssl" ]]; then
# 	export OPENSSL_ROOT_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
# fi

if [[ -d "/usr/lib/ccache" ]]; then
	export PATH="/usr/lib/ccache:$PATH"
fi

# [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/functions:$FPATH"
# [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/site-functions" ]] && export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"
if [[ -d "/home/linuxbrew/.linuxbrew/share/zsh/site-functions" && ":$FPATH:" != *":/home/linuxbrew/.linuxbrew/share/zsh/site-functions:"* ]]; then
	export FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH"
fi

# export FZF_BASE="$HOME/.fzf"
# [ -e $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
