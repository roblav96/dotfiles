# export PATH="/usr/local/opt/go/bin:$PATH"
[[ -z "$GO111MODULE" ]] && export GO111MODULE="auto"
if [[ -d "$HOME/.go" ]]; then
	[[ -z "$GOPATH" ]] && export GOPATH="$HOME/.go"
	[[ -z "$GOBIN" ]] && export GOBIN="$HOME/.go/bin"
	# export PATH="$HOME/.go/bin:$PATH"
fi
# export PATH="/usr/local/opt/glide/bin:$PATH"
# export GLIDE_HOME="/usr/local/opt/glide"

alias gof="go mod download -x all"
alias goc="gof && go mod verify"
alias gocd="cd $GOBIN"
alias gols="lch $GOBIN"
alias goin="go get -v"
# alias golnbin="ln -sf $GOBIN/* /usr/local/bin"
