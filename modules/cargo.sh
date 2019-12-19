# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

alias cg="cargo --verbose --color=always"
alias cgcd="cd $HOME/.cargo/bin"
alias cgls="lm $HOME/.cargo/bin"
alias cgin="cargo install --force"
alias cgout="cargo install-update --all --list"
alias cgupd="cargo install-update --all"
alias cgs="cargo ssearch"
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
