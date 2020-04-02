# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

alias cg="cargo --color=always --verbose"
alias cgcd="cd $HOME/.cargo/bin"
alias cgin="cargo install --force"
alias cgls="cargo install-update --list"
alias cgout="cargo install-update --list"
alias cgupg="cargo install-update"

# alias cgls="lm $HOME/.cargo/bin"
# alias cgs="cargo ssearch"
# alias cglnls="l /usr/local/bin | grep cargo/bin"
# alias cglnbin="ln -sf $HOME/.cargo/bin/* /usr/local/bin"

function cgi() {
	cargo info $@ | prettier --parser sh | bat -p -l make
}
function cgrm() {
	if [[ -x "$(which -p $@)" ]]; then
		rm -fv "$(which -p $@)"
	fi
	cargo uninstall $@
}
