if [[ -d "$HOME/.cargo" ]]; then
	[[ -z "$CARGO_INCREMENTAL" ]] && export CARGO_INCREMENTAL="1"
	[[ -z "$CARGO_HOME" ]] && export CARGO_HOME="$HOME/.cargo"
	# if [[ "$PATH" != *"$CARGO_HOME/bin"* ]]; then
	# 	export PATH="$PATH:$CARGO_HOME/bin"
	# fi
fi
# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

alias cgf="cargo fetch"
alias cgc="cgf && cargo check --no-default-features --workspace"

# alias cg="cargo"
alias cgcd="cd $CARGO_HOME/bin"
alias cgin="cargo install --force"
alias cgls="lch $CARGO_HOME/bin"
alias cgout="cargo install-update --all --list"
alias cgupg="cgout | grep Yes$ | awk '{ print \$1 }' | while read i; do (echo && echo \"🟡 Upgrading crate -> '\$i'\" && cgin \$i); done"
# alias cgupg="cargo install-update --force"
alias cgrm="cargo uninstall"

alias cglnls="lch $HOMEBREW_PREFIX/bin | g cargo/bin"
alias cglnbin="ln -sf $CARGO_HOME/bin/* $HOMEBREW_PREFIX/bin"

alias cgs='cargo ssearch --recent --limit=$(expr $(tput lines) / 4)'
function cgi() {
	PAGER=cat cargo info -v "$@" | bat --plain -l yml
	PAGER=cat cargo info -V "$@" | bat --plain -l erl
}
# alias cgi="env PAGER=cat cargo info"

# function cgrm() {
# 	if [[ -x "$(which -p $@)" ]]; then
# 		rm -fv "$(which -p $@)"
# 	fi
# 	cargo uninstall $@
# }
