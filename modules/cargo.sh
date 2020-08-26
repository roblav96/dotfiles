# test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

# alias cg="cargo --verbose"
alias cgcd="cd $HOME/.cargo/bin"
alias cgin="cargo install --force"
alias cgls="lch $HOME/.cargo/bin"
alias cgout="cargo install-update --list"
alias cgrm="cargo uninstall"

alias cglnls="lch /usr/local/bin | g cargo/bin"
alias cglnbin="ln -sf $HOME/.cargo/bin/* /usr/local/bin"

# alias cgi="PAGER=cat cargo info"
# function cgi() {
# 	PAGER=cat cargo info "$*" | bat --plain -l yml
# }

# function cgrm() {
# 	if [[ -x "$(which -p $@)" ]]; then
# 		rm -fv "$(which -p $@)"
# 	fi
# 	cargo uninstall $@
# }
