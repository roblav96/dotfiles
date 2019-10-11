# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

alias cargo="cargo --color always"
alias csr="cargo install --force"
alias cin="cargo install --force"
alias cls="cargo install-update -al"
alias cout="cargo install-update -al"
alias cupd="cargo install-update -a"
alias ccat="bat $DOTFILES/modules/cargo.sh"
alias ccd="cd $HOME/.cargo/bin"
alias cln="ln -sf $HOME/.cargo/bin/* /usr/local/bin"

test -x "$(which procs)" && alias procs="sudo procs"
