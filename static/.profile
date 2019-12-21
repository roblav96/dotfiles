#!/usr/bin/env bash

test -e "$DOTFILES/.env" && source "$DOTFILES/.env"

# set completion-ignore-case on
# set completion-query-items 256
# set expand-tilde off
# set history-preserve-point on
# set mark-symlinked-directories on
# set match-hidden-files off
# set page-completions off
# set show-all-if-ambiguous on
# set skip-completed-text on
# set visible-stats on

# unalias l
# unalias ll
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls="ls --color=always"
alias l="ls -laph"
alias lm="l -laph --sort=time"
alias lb="l -laph --sort=size"
alias lr="tree -F -l -a -A -C -L 1"
alias lra="tree -F -l -a -A -C"
alias pwd="pwd && pwd -P"
alias bat="cat"
alias grep="grep --color=always --ignore-case --extended-regexp"
alias htop="htop --delay=10"
# function idk() { man -k $@ | grep "$@|$" }
alias idk="man --apropos"
# alias s="subl -f"
alias p="ps aux | grep --invert-match grep | grep"
alias k="killall -KILL"
alias pathls="echo \$PATH | sed 's/:\//\n\//g'"

export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --ascii-output --color-output --sort-keys --tab --indent 4"

if [[ -x "$(which tsudo)" ]]; then
	alias sudo="tsudo "
elif [[ -x "$(which sudo)" ]]; then
	alias sudo="sudo "
fi

# alias dot="subl /opt/etc/profile"
# alias src="source /opt/etc/profile"
# alias type="f() { type $@ && ls -laph --color=always $(which $@); unset -f f; }; f"

function f() {
	find . -iname "*$@*" -not -path "./acct/*" -not -path "./dev/*" -not -path "./proc/*" -not -path "./sys/*"
}
function r() {
	grep --no-messages --ignore-case --fixed-strings $@ --recursive .
}

function show() {
	type -a $@
	local which="$(which $@)"
	if [[ -e "$which" ]]; then
		ls -laph --color=always "$which"
		if [[ "$which" != "$(readlink -f $which)" ]]; then
			ls -laph --color=always "$(readlink -f $which)"
		fi
	fi
}
function rl() {
	if [[ -x "$(which $@)" ]]; then
		ls -laph --color=always "$(readlink -f $(which $@))"
	else
		ls -laph --color=always "$(readlink -f $@)"
	fi
}

alias tl="ch"
function ch() {
	curl "https://cht.sh/$*"
}
function cha() {
	curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$@"
}

if echo $PATH | grep -q "/system/bin.*/system/xbin"; then
	export PATH="${PATH/system\/xbin/system\/bin}"
	export PATH="${PATH/system\/bin/system\/xbin}"
elif echo $PATH | grep -q "termux"; then
	test -d "/sbin" && export PATH="$PATH:/sbin"
	test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
	test -d "/system/bin" && export PATH="$PATH:/system/bin"
	test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
fi

# test -d "$HOME/.bin" && export PATH="$HOME/.bin:$PATH"
# test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
# test -d "/system/bin" && export PATH="$PATH:/system/bin"
# test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
# test -d "/sbin" && export PATH="$PATH:/sbin"

test -x "$(which whoami)" && export USER="$(whoami)"
export PS1_USER="\[\033[1;32m\]$USER\[\033[0m\]"
export PS1_BANG="\[\033[1;35m\]➤\[\033[0m\]"
if [[ "$USER" == "root" ]]; then
	export PS1_USER="\[\033[1;31m\]$USER\[\033[0m\]"
	export PS1_BANG="\[\033[1;31m\]➤\[\033[0m\]"
	unset HISTFILE
fi
export PS1="$PS1_USER \[\033[1;34m\]\w\[\033[0m\] $PS1_BANG "

export CLICOLOR="1"
export LSCOLORS="exfxcxdxbxegedabagacad"
export TERM="xterm-256color"

export HISTFILESIZE="5000000"
export HISTSIZE="5000000"
export SAVEHIST="1000000"

if [[ -x "$(which opkg)" ]] && [[ ! -x "$(which pkg)" ]]; then
	alias pkg="opkg"
	alias pkgfs="opkg files"
	function pkgs() {
		opkg find "*$@*"
	}
	function pkgi() {
		opkg info "*$@*"
	}
	function pkgf() {
		opkg search "*$@*"
	}
fi

test -x "$(which wget)" && alias wget="wget --connect-timeout=3"
test -x "$(which curl)" && alias curl="curl --silent --show-error --connect-timeout 3"

test -x "$(which ip)" && source "$DOTFILES/modules/ip.sh"
test -x "$(which subl)" && source "$DOTFILES/modules/sublime-text.sh"
test -x "$(which tc)" && source "$DOTFILES/modules/tc.sh"
test -x "$(which wget)" && source "$DOTFILES/modules/speed-test.sh"

# alias ipinfo="echo; curl -s https://icanhazip.com; echo; curl -s https://ipinfo.io; echo"



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

# export PATH="/opt/bin/go/bin:$PATH"
# export GOROOT="/opt/bin/go"
# export GOBIN="$GOROOT/bin"
# export GOPATH="$GOROOT"

# pkg install autoconf automake bison bzip2 clang cmake coreutils diffutils flex gawk git grep gzip libtool make patch perl sed silversearcher-ag tar wget pkg-config
