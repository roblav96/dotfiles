export PURE_PROMPT_SYMBOL="SERVER ➤"

alias pst="pstree -achls"

if type -w "cln" | grep -q -E alias$; then
	unalias cln
	alias cln="sudo ln -sf $HOME/.cargo/bin/* /usr/local/bin"
fi

# if [[ -x "$(which pm2)" ]]; then
# 	source <(pm2 completion)
# fi
