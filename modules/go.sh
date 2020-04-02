# export PATH="/usr/local/opt/go/bin:$PATH"
if [[ -d "$HOME/.go" ]]; then
	export GOPATH="$HOME/.go"
	export GOBIN="$HOME/.go/bin"
	# export PATH="$HOME/.go/bin:$PATH"
fi
# export PATH="/usr/local/opt/glide/bin:$PATH"
# export GLIDE_HOME="/usr/local/opt/glide"

alias gocd="cd $GOPATH"
alias gols="lm $GOBIN"
alias goin="go get -u"
# alias golnbin="ln -sf $GOBIN/* /usr/local/bin"
