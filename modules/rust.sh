# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

alias ru="rustup --verbose"
alias rucd="cd $HOME/.rustup"
alias ruout="rustup check"
alias ruupg="rustup update stable"
alias rucls="rustup component list --installed"
alias rucin="rustup component add"

alias cg="cargo --verbose"
alias cgcd="cd $HOME/.cargo/bin"
alias cgin="cargo install --force"
alias cgls="cargo install-update --list"
alias cgout="cargo install-update --list"
alias cgupg="cargo install-update"
alias cgrm="cargo uninstall"
alias cgi="PAGER=cat cargo info"

# function cgi() {
# 	PAGER=cat cargo info "$*" | bat --plain -l yml
# }

# alias cgls="lm $HOME/.cargo/bin"
# alias cglnls="l /usr/local/bin | grep cargo/bin"
# alias cglnbin="ln -sf $HOME/.cargo/bin/* /usr/local/bin"

# function cgrm() {
# 	if [[ -x "$(which -p $@)" ]]; then
# 		rm -fv "$(which -p $@)"
# 	fi
# 	cargo uninstall $@
# }
