[[ -z "$COCOAPODS_DISABLE_STATS" ]] && export COCOAPODS_DISABLE_STATS="true"
[[ -z "$RUBYOPT" ]] && export RUBYOPT="-W0"

alias gemenv="gem env"
alias gemfs="gem which"
alias gemi="gem info"
alias gemin="gem install"
alias gemls="gem list"
alias gemout="gem outdated"
alias gemrm="gem uninstall --all --executables"
alias gems="gem search"
alias gemupg="gem update"
alias gemupgsys="gem update --system"
alias gemcd='cd $(gem environment gemdir)/bin'

# function gemln() {
# 	ln -sf "/usr/local/lib/ruby/gems/2.7.0/bin/$1" "/usr/local/bin/$1"
# }
