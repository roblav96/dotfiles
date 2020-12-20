#!/usr/bin/env bash

# if [[ -n "$BASH_VERSION" ]]; then
# 	if [[ -e "$HOME/.bashrc" ]]; then
# 		source "$HOME/.bashrc"
# 	fi
# fi

[[ -e "$DOTFILES/.env" ]] && source "$DOTFILES/.env"
[[ -z "$HOME" ]] && export HOME="$(dirname $DOTFILES)"
[[ -x "$(which tabs)" ]] && tabs -4

# if [[ -x "$(which rmate)" ]]; then
# 	export EDITOR="rmate"
# 	export VEDITOR="rmate"
# elif [[ -x "$(which micro)" ]]; then
# 	export EDITOR="micro"
# 	export VEDITOR="micro"
# el
if [[ -x "$(which nano)" ]]; then
	export EDITOR="nano"
	export VEDITOR="nano"
	export VISUAL="nano"
fi
[[ -n "$EDITOR" ]] && alias e="$EDITOR"

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

export GREP_COLOR="01;31"
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
alias grep="grep --color=auto" # --ignore-case --extended-regexp"
alias g="grep --fixed-strings"

# unalias l
# unalias ll
alias sudo="sudo "
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls="ls --color=always"
alias l="ls -laph"
alias lm="l -laph --sort=time"
alias lb="l -laph --sort=size"
alias lr="tree -N -F -l -a -A -C -L 1"
alias lra="tree -N -F -l -a -A -C"
alias rp="realpath"
alias pwda="pwd && pwd -P"
alias bat="cat" && alias b="bat"
alias htop="htop --delay=1"
# function idk() { man -k $@ | grep "$@|$" }
alias idk="man --apropos"
# alias s="subl -f"
alias p="ps w | grep --invert-match grep | grep"
alias k="killall -KILL"
alias pathls='echo $PATH | sed "s/:\//\n\//g"'

[[ -x "$(which starship)" ]] && eval "$(starship init bash)"

export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --sort-keys --tab"

# if [[ -x "$(which tsudo)" ]]; then
# 	alias sudo="tsudo "
# elif [[ -x "$(which sudo)" ]]; then
# 	alias sudo="sudo "
# fi

# alias dot="subl /opt/etc/profile"
# alias src="source /opt/etc/profile"
# alias type="f() { type $@ && l $(which $@); unset -f f; }; f"

function f() {
	find . -iname "*$**" -not -path "./acct/*" -not -path "./dev/*" -not -path "./proc/*" -not -path "./sys/*"
}
function r() {
	grep --no-messages --ignore-case --fixed-strings "$*" --recursive .
}

function show() {
	type -a $@
	local which="$(which $@)"
	if [[ -e "$which" ]]; then
		l "$which"
		if [[ "$which" != "$(realpath $which)" ]]; then
			l "$(realpath $which)"
		fi
	fi
}
which s &>/dev/null || alias s="show"

function realpatha() {
	if [[ -x "$(which $@)" ]]; then
		l "$(realpath $(which $@))"
	else
		l "$(realpath $@)"
	fi
}

alias tl="ch"
function ch() {
	curl "http://cht.sh/$*"
}
function cha() {
	curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$@"
}

# if echo $PATH | grep -q "/system/bin.*/system/xbin"; then
# 	export PATH="${PATH/system\/xbin/system\/bin}"
# 	export PATH="${PATH/system\/bin/system\/xbin}"
# elif echo $PATH | grep -q "termux"; then
# 	test -d "/sbin" && export PATH="$PATH:/sbin"
# 	test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
# 	test -d "/system/bin" && export PATH="$PATH:/system/bin"
# 	test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
# fi

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

# export CLICOLOR="1"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
# export TERM="xterm-256color"

if [[ -n "$HISTFILE" ]]; then
	export HISTFILESIZE="999999999"
	export HISTSIZE="999999999"
	export SAVEHIST="999999999"
fi

if [[ -x "$(which opkg)" ]] && [[ ! -x "$(which pkg)" ]]; then
	alias pkg="opkg"
	alias pkgi="opkg info"
	alias pkgin="opkg install"
	alias pkgfs="opkg files"
	alias pkgupd="opkg update"
	alias pkgupg="opkg upgrade"
	alias pkgout="opkg list-upgradable"
	function pkgs() {
		opkg info "*$**"
	}
	function pkgsa() {
		opkg find "*$**"
	}
fi

test -x "$(which wget)" && alias wget="wget --quiet --show-progress --connect-timeout=5"
test -x "$(which curl)" && alias curl="curl --silent --show-error --fail-early --location --connect-timeout 5"

test -x "$(which curl)" && source "$DOTFILES/modules/ipinfo.sh"
# test -x "$(which curl)" && source "$DOTFILES/modules/tldr.sh"
# test -x "$(which htop)" && source "$DOTFILES/modules/processes.sh"
test -x "$(which ip)" && [[ "$PLATFORM" != "Darwin" ]] && source "$DOTFILES/modules/iproute2.sh"
# test -x "$(which subl)" && source "$DOTFILES/modules/sublimetext.sh"
test -x "$(which wget)" && source "$DOTFILES/modules/speedtest.sh"

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