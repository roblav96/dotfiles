export PURE_PROMPT_SYMBOL="SERVER ➤"

export SYSTEMD_PAGER=""
unalias sc-status &>/dev/null
alias systemctl="systemctl --no-pager"
alias sc-status="systemctl --full status"

alias pst="pstree -achls"

if which -w cglnbin | grep -q "alias$"; then
	unalias cglnbin &>/dev/null
	alias cglnbin="sudo ln -sf $HOME/.cargo/bin/* /usr/local/bin"
fi

if which -w golnbin | grep -q "alias$"; then
	unalias golnbin &>/dev/null
	alias golnbin="sudo ln -sf $GOBIN/* /usr/local/bin"
fi

# if [[ -x "$(which pm2)" ]]; then
# 	source <(pm2 completion)
# fi
