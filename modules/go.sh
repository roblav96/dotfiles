# export PATH="/usr/local/opt/go/bin:$PATH"
if test -d "$HOME/.go"; then
	export GOPATH="$HOME/.go"
	export GOBIN="$GOPATH/bin"
	# export PATH="$GOBIN:$PATH"
fi
# export PATH="/usr/local/opt/glide/bin:$PATH"
# export GLIDE_HOME="/usr/local/opt/glide"

alias goget="go get -u"
alias goln="ln -sf $GOBIN/* /usr/local/bin"
alias gols="ls -1 $GOBIN"
