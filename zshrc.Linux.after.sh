export SYSTEMD_PAGER=""
unalias sc-status &>/dev/null
alias systemctl="systemctl --no-pager"
alias sc-status="systemctl --full status"

if [[ -d "/home/linuxbrew/.linuxbrew/opt/openssl" ]]; then
	export OPENSSL_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
	export OPENSSL_ROOT_DIR="/home/linuxbrew/.linuxbrew/opt/openssl"
fi

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
