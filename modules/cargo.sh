# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

# alias cargo="cargo --color always"
alias cs="cargo ssearch"
alias cin="cargo install --force"
alias cls="ls -1 $HOME/.cargo/bin"
alias cout="cargo install-update -al"
alias cupd="cargo install-update -a"
alias ccat="bat $DOTFILES/modules/cargo.sh"
alias ccd="cd $HOME/.cargo/bin"
alias cln="ln -s -f $HOME/.cargo/bin/* /usr/local/bin"

function ci() { cargo info $1 | bat -l make }
