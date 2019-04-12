
# unalias l
# unalias ll
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l="ls -lAph --color=always"
alias lr="tree -F -l -a -A -C -L 2"
alias lra="tree -F -l -a -A -C"
alias pwd="pwd && pwd -P"
alias json="jq --indent 4 --sort-keys --ascii-output --color-output"
alias grep="grep -i --color=always"
alias htop="htop -d 10"
alias st="st -f"
# alias idk="apropos"
# alias dot="st /opt/etc/profile"
# alias src="source /opt/etc/profile"
# alias type="f() { type $@ && ls -lAph --color=always $(which $@); unset -f f; }; f"

function f() {
	find . -iname "*$@*" -not -path "./sys/*" -not -path "./proc/*"
}
function r() {
	grep -s -i "$@" -R .
}
function p() {
	ps -w | grep -v grep | grep "$@"
}
function show() {
	type -a $@
	WHICH=`which $@`
	[ -z $WHICH ] || [ ! -f $WHICH ] && return 0
	ls -lAph --color=always $WHICH
	readlink -v -f $WHICH
}

test -d "$HOME/.bin" && export PATH="$HOME/.bin:$PATH"

# export USER="$USER"
export PS1="\[\033[1;34m\]$USER\[\033[0m\] \[\033[1;31m\]$\[\033[0m\] "
export CLICOLOR="1"
export LSCOLORS="exfxcxdxbxegedabagacad"

function osearch() {
	opkg find "*$@*"
}



# export SHELL=$(echo $0)
# export SHELL=/opt/bin/zsh
# export TERM=xterm-256color

# export PATH=/opt/bin/go/bin:$PATH
# export GOROOT=/opt/bin/go
# export GOBIN=$GOROOT/bin
# export GOPATH=$GOROOT

# pkg install autoconf automake bison bzip2 clang cmake coreutils diffutils flex gawk git grep gzip libtool make patch perl sed silversearcher-ag tar wget pkg-config
