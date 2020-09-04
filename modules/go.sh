# export PATH="/usr/local/opt/go/bin:$PATH"
export GO111MODULE="auto"
if [[ -d "$HOME/.go" ]]; then
	export GOPATH="$HOME/.go"
	export GOBIN="$HOME/.go/bin"
	# export PATH="$HOME/.go/bin:$PATH"
fi
# export PATH="/usr/local/opt/glide/bin:$PATH"
# export GLIDE_HOME="/usr/local/opt/glide"

alias gocd="cd $GOBIN"
alias gols="lch $GOBIN"
alias goin="env GO111MODULE=on go get -v"
# alias golnbin="ln -sf $GOBIN/* /usr/local/bin"
