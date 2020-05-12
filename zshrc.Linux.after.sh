export SYSTEMD_PAGER="cat"
# alias systemctl="systemctl --no-pager"

unalias sc-status &>/dev/null
alias sc-status="systemctl --full status"
# unalias sc-list-units &>/dev/null
# alias sc-list-units="systemctl --all list-units"
# unalias sc-list-unit-files &>/dev/null
# alias sc-list-unit-files="systemctl --all list-unit-files"

alias pst="pstree -achls"

alias nftl="sudo nft list ruleset --handle | bat -l nft"

alias .z="rmate --new --line 999999 $HOME/.z"
alias .zsh_history="rmate --new --line 999999 $HOME/.zsh_history"

if [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
	alias brew="$HOME/.linuxbrew/bin/brew"
	source "$DOTFILES/modules/homebrew.sh"
fi

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
