alias ru="rustup --verbose"
alias rucd="cd $HOME/.rustup"
alias ruout="rustup check"
alias ruupg='rustup update stable && rustup completions zsh rustup > $GENCOMPL_FPATH/_rustup && rustup completions zsh cargo > $GENCOMPL_FPATH/_cargo && zcomp'
alias rucls="rustup component list --installed"
alias rucin="rustup component add"

alias rustfmt="rustfmt --config hard_tabs=true"
