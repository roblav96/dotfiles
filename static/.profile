
# unalias l
# unalias ll
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l="ls -lAph --color=always"
alias lr="tree -u -g -p -h -a -A -C -L 1"
alias lra="tree -u -g -p -h -a -A -C"
alias idk="apropos"
alias json="jq --indent 4 --sort-keys"
alias grep="grep --color=always"
alias htop="htop -d 10"
alias st="st -f"
# alias dot="st /opt/etc/profile"
# alias src="source /opt/etc/profile"

f() {
	find . -iname "*$@*"
}
r() {
	grep -s -i "$@" -R .
}

export PS1="\[\033[1;34m\]\w\[\033[0m\] \[\033[1;31m\]$\[\033[0m\] "
export CLICOLOR="true"
export LSCOLORS="exfxcxdxbxegedabagacad"



# export SHELL=$(echo $0)
# export SHELL=/opt/bin/zsh
# export TERM=xterm-256color

# export PATH=/opt/bin/go/bin:$PATH
# export GOROOT=/opt/bin/go
# export GOBIN=$GOROOT/bin
# export GOPATH=$GOROOT

