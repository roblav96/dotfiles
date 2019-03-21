
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
# alias type="f() { type $@ && ls -lAph --color=always $(which $@); unset -f f; }; f"
alias json="jq --indent 4 --sort-keys"
alias grep="grep --color=always"
alias htop="htop -d 10"
alias st="st -f"
# alias idk="apropos"
# alias dot="st /opt/etc/profile"
# alias src="source /opt/etc/profile"

f() {
	find . -iname "*$@*" -follow
}
r() {
	grep -s -i "$@" -R .
}
show() {
	type $@
	[ -z "$@" ] && return 0
	WHICH=$(which $@)
	if [[ -f "$WHICH" ]]; then
		ls -lAph --color=always $WHICH
		readlink -v -f $WHICH
	fi
}

export PATH="$HOME/.bin:$PATH"

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

# pkg install autoconf automake bison bzip2 clang cmake coreutils diffutils flex gawk git grep gzip libtool make patch perl sed silversearcher-ag tar wget pkg-config
