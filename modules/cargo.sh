# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

alias cargo='cargo --color always'
alias ci='cargo install --force'
alias cls='cargo install-update -al'
alias cout='cargo install-update -al'
alias cupg='cargo install-update -a'
alias cbin='ln -sf ~/.cargo/bin/* /usr/local/bin'

test -x "$(which procs)" && alias procs='sudo procs'
