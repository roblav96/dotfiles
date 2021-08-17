if [[ -d "$HOME/.rustup" ]]; then
    [[ -z "$RUSTUP_HOME" ]] && export RUSTUP_HOME="$HOME/.rustup"
fi

# alias ru="rustup"
alias rucd="cd $RUSTUP_HOME/.rustup"

alias ruout="rustup check"
alias ruupg='rustup update stable && rustup completions zsh rustup > $GENCOMPL_FPATH/_rustup && rustup completions zsh cargo > $GENCOMPL_FPATH/_cargo && zcomp'

alias rucls="rustup component list --installed"
alias rutls="rustup target list --installed"

alias rustfmt="rustfmt --config hard_tabs=true"
