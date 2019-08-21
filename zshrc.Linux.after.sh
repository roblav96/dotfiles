export PURE_PROMPT_SYMBOL="SERVER ➤"

if test -d "$HOME/.go"; then
	export GOPATH="$HOME/.go"
	export GOBIN="$GOPATH/bin"
	export PATH="$GOBIN:$PATH"
fi

test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"
test -d "$HOME/.local/bin" && export PATH="$HOME/.local/bin:$PATH"
test -d "$HOME/.bin" && export PATH="$HOME/.bin:$PATH"

alias pst="pstree -achls"

# if [[ -x "$(which pm2)" ]]; then
# 	source <(pm2 completion)
# fi
