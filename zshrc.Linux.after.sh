export PURE_PROMPT_SYMBOL="SERVER ➤"

alias pst="pstree -achls"

if which -w cln | grep -q "alias$"; then
	unalias cln
	alias cln="sudo ln -sf $HOME/.cargo/bin/* /usr/local/bin"
fi

if which -w goln | grep -q "alias$"; then
	unalias goln
	alias goln="sudo ln -sf $GOBIN/* /usr/local/bin"
fi

# if [[ -x "$(which pm2)" ]]; then
# 	source <(pm2 completion)
# fi
