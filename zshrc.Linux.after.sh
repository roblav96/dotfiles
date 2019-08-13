export PURE_PROMPT_SYMBOL="SERVER ➤"

if test -d "$HOME/.go"; then
	export GOPATH="$HOME/.go"
	export GOBIN="$GOPATH/bin"
	export PATH="$GOBIN:$PATH"
fi

test -d "$HOME/.bin" && export PATH="$HOME/.bin:$PATH"

alias pst="pstree -achls"

# if [[ -x "$(which pm2)" ]]; then
# 	source <(pm2 completion)
# fi
