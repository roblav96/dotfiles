if [[ -d "$HOME/.cargo" ]]; then
	[[ -z "$CARGO_INCREMENTAL" ]] && export CARGO_INCREMENTAL="1"
	[[ -z "$CARGO_HOME" ]] && export CARGO_HOME="$HOME/.cargo"
fi
# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

alias cgf="cargo fetch"
alias cgc="cgf && cargo check --no-default-features --workspace"

# alias cg="cargo"
alias cgcd="cd $CARGO_HOME/bin"
alias cgin="cargo install --force"
alias cgls="lch $CARGO_HOME/bin"
alias cgout="cargo install-update --all --list"
# alias cgupg="cargo install-update --force"
alias cgrm="cargo uninstall"

alias cglnls="lch /usr/local/bin | g cargo/bin"
alias cglnbin="ln -sf $CARGO_HOME/bin/* /usr/local/bin"

alias cgs='cargo ssearch --recent --limit=$(expr $(tput lines) / 4)'
function cgi() {
	PAGER=cat cargo info -a -v "$@" | bat --plain -l yml
	PAGER=cat cargo info -V "$@" | bat --plain -l erl
}
# alias cgi="env PAGER=cat cargo info"

# function cgrm() {
# 	if [[ -x "$(which -p $@)" ]]; then
# 		rm -fv "$(which -p $@)"
# 	fi
# 	cargo uninstall $@
# }
