export DPKG_PAGER="cat"
export SYSTEMD_PAGER="cat"
# alias systemctl="systemctl --no-pager"

function binstall() {
    local base="$(basename "$1")"
    [[ ! -f "$base" ]] && echo "🔴 !file -> '$base'" && return 1
    local target="$(readlink -f "${2:-"/usr/local/bin"}")"
    [[ ! -d "$target" ]] && echo "🔴 !directory -> '$target'" && return 1
    sudo cp -f -t "$target" "$base"
    sudo chown root:root "$target/$base"
    sudo chmod 755 "$target/$base"
}

unalias sc-status &>/dev/null
alias sc-status="systemctl --full status"
# unalias sc-list-units &>/dev/null
# alias sc-list-units="systemctl --all list-units"
# unalias sc-list-unit-files &>/dev/null
# alias sc-list-unit-files="systemctl --all list-unit-files"

alias nftls="sudo nft --handle list ruleset | bat --file-name='nft list ruleset' -l nft"
alias sshdtest="sudo sshd -T -f /etc/ssh/sshd_config | sortt"
alias .h2o="sudo subl /etc/h2o/h2o.conf"

alias cdp="cd $HOME/.playground"
alias cdd="cd $HOME/downloads"

function upg() {
    bhr && echo "🟡 brew" && bhr
    bupd; bupg; bclr
    bhr && echo "🟡 tldr" && bhr
    tldr --update
    bhr && echo "🟡 cargo" && bhr
    cgout; cgupg
    bhr && echo "🟡 npm" && bhr
    npmo -g
}

function ubuntu-bak() {
    local outzip=ubuntu.$(dateiso).zip
    aptls > aptls.log
    bls > bls.log
    sudo zip -r $outzip \
        /etc /usr/local/etc \
        /var/lib/emby/root/default /var/lib/emby/config \
        ~/.config ~/.local \
        ~/.bashrc ~/.profile ~/.zshenv ~/.zshrc \
        ~/.megarc ~/.megaCmd \
        ~/.z ~/.zsh_history \
        aptls.log bls.log \
        -x '*/.config/emby-server/*'
    sudo chown ubuntu:ubuntu $outzip
    rm aptls.log bls.log
    bhr
    l $outzip
}

# if [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
# 	alias brew="$HOME/.linuxbrew/bin/brew"
# 	source "$DOTFILES/modules/homebrew.sh"
# fi

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
