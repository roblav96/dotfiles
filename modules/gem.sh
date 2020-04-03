export GEMS_VERSION="2.7.0"

alias gemenv="gem env"
alias gemfs="gem which"
alias gemi="gem info"
alias gemin="gem install"
alias gemls="gem list"
alias gemout="gem outdated"
alias gemrm="gem uninstall"
alias gems="gem search"
alias gemupg="gem update"
alias gemcd="cd /usr/local/lib/ruby/gems/$GEMS_VERSION/bin"

function gemln() {
	ln -sf "/usr/local/lib/ruby/gems/$GEMS_VERSION/bin/$1" "/usr/local/bin/$1"
}; compdef gemln=ln
