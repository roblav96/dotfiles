# export PATH="/usr/local/opt/go/bin:$PATH"
if test -d "$HOME/.go"; then
	export GOPATH="$HOME/.go"
	export GOBIN="$HOME/.go/bin"
	# export PATH="$HOME/.go/bin:$PATH"
fi
# export PATH="/usr/local/opt/glide/bin:$PATH"
# export GLIDE_HOME="/usr/local/opt/glide"

alias goin="go get -u"
alias gocd="cd $GOBIN"
alias golnbin="ln -sf $GOBIN/* /usr/local/bin"
alias gols="ls -1 $GOBIN"
