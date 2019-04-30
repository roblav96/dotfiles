set completion-ignore-case on
set completion-query-items 256
set expand-tilde off
set history-preserve-point on
set mark-symlinked-directories on
set match-hidden-files off
set page-completions off
set show-all-if-ambiguous on
set skip-completed-text on
set visible-stats on

# unalias l
# unalias ll
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l="ls -laph --color=always"
alias lr="tree -F -l -a -A -C -L 2"
alias lra="tree -F -l -a -A -C"
alias pwd="pwd && pwd -P"
alias json="jq --indent 4 --sort-keys --ascii-output --color-output"
alias grep="grep -iE --color=always"
alias htop="htop -d 10"
alias idk="man -k"
alias st="st -f"
# alias dot="st /opt/etc/profile"
# alias src="source /opt/etc/profile"
# alias type="f() { type $@ && ls -laph --color=always $(which $@); unset -f f; }; f"

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
	ls -laph --color=always $WHICH
	readlink -f $WHICH
}

if echo $PATH | grep -q '/system/bin.*/system/xbin'; then
	export PATH="${PATH/system\/xbin/system\/bin}"
	export PATH="${PATH/system\/bin/system\/xbin}"
# elif echo $PATH | grep -q 'termux'; then
	# test -d "/system/bin" && export PATH="/system/bin:$PATH"
	# test -d "/system/xbin" && export PATH="/system/xbin:$PATH"
fi
test -d "$HOME/.bin" && export PATH="$HOME/.bin:$PATH"

test -x "`which whoami`" && export USER="`whoami`"
export PS1_BANG="$"
test $USER == 'root' && PS1_BANG="#"
export PS1_COLOR="\[\033[1;32m\]$USER\[\033[0m\]"
test $USER == 'root' && PS1_COLOR="\[\033[1;31m\]$USER\[\033[0m\]"
export PS1="$PS1_COLOR \[\033[1;34m\]\w\[\033[0m\] \[\033[1;35m\]$PS1_BANG\[\033[0m\] "
export CLICOLOR="1"
export LSCOLORS="exfxcxdxbxegedabagacad"

function osearch() {
	opkg find "*$@*"
}



# if test -d "/data/data/com.termux/files"; then
# 	export ANDROID_DATA="/data"
# 	export ANDROID_ROOT="/system"
# 	export EXTERNAL_STORAGE="/sdcard"
# 	export LD_LIBRARY_PATH="/data/data/com.termux/files/usr/lib"
# 	export LD_PRELOAD="/data/data/com.termux/files/usr/lib/libtermux-exec.so"
# 	export PREFIX="/data/data/com.termux/files/usr"
# 	export SHELL="/system/xbin/bash"
# 	export TERM="xterm-256color"
# fi

# export SHELL="`echo $0`"
# export SHELL="/opt/bin/zsh"
# export TERM="xterm-256color"

# export PATH="/opt/bin/go/bin:$PATH"
# export GOROOT="/opt/bin/go"
# export GOBIN="$GOROOT/bin"
# export GOPATH="$GOROOT"

# pkg install autoconf automake bison bzip2 clang cmake coreutils diffutils flex gawk git grep gzip libtool make patch perl sed silversearcher-ag tar wget pkg-config
