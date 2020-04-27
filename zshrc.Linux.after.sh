export SYSTEMD_PAGER=""
alias systemctl="systemctl --no-pager"

unalias sc-status &>/dev/null
alias sc-status="systemctl --full status"

alias pst="pstree -achls"

# alias nixcp="sudo cp -f $HOME/.nix-profile/bin/* /usr/local/bin"
# alias nixln="sudo ln -sfv $HOME/.nix-profile/bin/* /usr/local/bin"

# if which -w cglnbin | grep -q "alias$"; then
# 	unalias cglnbin &>/dev/null
# 	alias cglnbin="sudo ln -sf $HOME/.cargo/bin/* /usr/local/bin"
# fi

# if which -w golnbin | grep -q "alias$"; then
# 	unalias golnbin &>/dev/null
# 	alias golnbin="sudo ln -sf $GOBIN/* /usr/local/bin"
# fi

# if [[ -x "$(which pm2)" ]]; then
# 	source <(pm2 completion)
# fi
