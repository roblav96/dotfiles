export PURE_PROMPT_SYMBOL="SERVER ➤"

alias pst="pstree -achls"

if which -w cglnbin | grep -q "alias$"; then
	unalias cglnbin
	alias cglnbin="sudo ln -sf $HOME/.cargo/bin/* /usr/local/bin"
fi

if which -w golnbin | grep -q "alias$"; then
	unalias golnbin
	alias golnbin="sudo ln -sf $GOBIN/* /usr/local/bin"
fi

# if [[ -x "$(which pm2)" ]]; then
# 	source <(pm2 completion)
# fi
