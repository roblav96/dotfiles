#!/usr/bin/env bash

# if [[ -n "$BASH_VERSION" ]]; then
# 	if [[ -e "$HOME/.bashrc" ]]; then
# 		source "$HOME/.bashrc"
# 	fi
# fi

[[ -e "$DOTFILES/configs/.env" ]] && source "$DOTFILES/configs/.env"
[[ -z "$HOME" ]] && export HOME="$(dirname $DOTFILES)"
[[ -x "$(which tabs)" ]] && tabs -4
[[ -x "$(which git)" ]] && export GIT_PAGER="cat"

# if [[ -x "$(which rmate)" ]]; then
# 	export EDITOR="rmate"
# 	export VEDITOR="rmate"
if [[ -x "$(which micro)" ]]; then
	export EDITOR="micro"
	export VEDITOR="micro"
	export VISUAL="micro"
elif [[ -x "$(which nano)" ]]; then
	export EDITOR="nano"
	export VEDITOR="nano"
	export VISUAL="nano"
fi
[[ -n "$EDITOR" ]] && alias e="$EDITOR"

if [[ -x "$(which rmate)" ]]; then
	which st &>/dev/null || alias st="rmate"
	which subl &>/dev/null || alias subl="rmate"
fi

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
alias grep="grep --color=auto"
alias g="grep --fixed-strings --ignore-case"

# unalias l
# unalias ll
alias sudo="sudo "
alias xargs="xargs "
alias -- -='cd "$OLDPWD"'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls="ls --color=auto"
alias l="ls -laph"
alias lm="l --sort=time --reverse"
alias lb="l --sort=size --reverse"
alias lr="tree -N -F -l -a -A -C -L 2"
alias lra="tree -N -F -l -a -A -C"
alias rp="realpath"
alias pwda="pwd && pwd -P"
alias bat="cat" && alias b="bat"
alias htop="htop --delay=1 --highlight-changes=10"
alias bhr="echo"
alias tf="tail -f -n 100"
# function idk() { man -k $@ | grep "$@|$" }
# alias s="subl -f"
alias psa="ps auxww"
alias p="ps auxww | grep --invert-match ' grep ' | grep --invert-match '/rmate ' | grep"
alias pst="pstree --arguments --compact-not --highlight-all --long --show-parents"
alias k="killall -KILL"
alias lsof="lsof -P"
alias pathls='echo $PATH | sed "s/:\//\n\//g"'

function binstall() {
	local v && for v in "$@"; do
		[[ ! -f "$v" ]] && continue
		local base="$(basename "$v")"
		cp -v -t /opt/bin "$v"
		chown -v admin:root "/opt/bin/$base"
		chmod -v 755 "/opt/bin/$base"
	done
}

[[ -x "$(which starship)" ]] && eval "$(starship init bash)"

export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --sort-keys --tab" && alias j="json"

# if [[ -x "$(which tsudo)" ]]; then
# 	alias sudo="tsudo "
# elif [[ -x "$(which sudo)" ]]; then
# 	alias sudo="sudo "
# fi

# alias dot="subl /opt/etc/profile"
# alias src="source /opt/etc/profile"
# alias type="f() { type $@ && l $(which $@); unset -f f; }; f"

function f() {
	find . -iname "*$**" -not -path "./.git/*" -not -path "./acct/*" -not -path "./dev/*" -not -path "./proc/*" -not -path "./sys/*" -not -path "./WD_GRAPHITE/*"
}
function r() {
	grep --recursive . --no-messages --ignore-case --fixed-strings --context=2 -e "$*"
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

# test -x "$(which whoami)" && export USER="$(whoami)"
# export PS1_USER="\[\033[1;32m\]$USER\[\033[0m\]"
# export PS1_BANG="\[\033[1;35m\]➤\[\033[0m\]"
# if [[ "$USER" == "root" ]]; then
# 	export PS1_USER="\[\033[1;31m\]$USER\[\033[0m\]"
# 	export PS1_BANG="\[\033[1;31m\]➤\[\033[0m\]"
# 	unset HISTFILE
# fi
# export PS1="$PS1_USER \[\033[1;34m\]\w\[\033[0m\] $PS1_BANG "

# export CLICOLOR="1"
# export LSCOLORS="Gxfxcxdxbxegedabagacad"
# if [[ "$TERM" == "xterm" ]]; then
# 	export TERM="xterm-256color"
# fi

if [[ -n "$HISTFILE" ]]; then
	export HISTFILESIZE="999999999"
	export HISTSIZE="999999999"
	export SAVEHIST="999999999"
fi

if [[ -x "$(which opkg)" ]] && [[ ! -x "$(which pkg)" ]]; then
	alias pkg="opkg"
	alias pkgi="opkg info"
	alias pkgin="opkg install"
	# alias pkgfs="opkg files"
	alias pkgrm="opkg remove"
	alias pkgowns="opkg search"
	alias pkgupd="opkg update"
	alias pkgupg="opkg upgrade"
	# alias pkgout="opkg list-upgradable"
	alias pkgls="opkg list-installed"
	function pkgfs() {
		opkg files "$*" | tail -n+2 | sort
	}
	function pkgs() {
		opkg info --nocase "*$**"
	}
	function pkgsa() {
		opkg find --nocase "*$**"
	}

	# export LD_LIBRARY_PATH="/lib:/usr/lib:/lib/aarch64"

fi

test -x "$(which wget)" && alias wget="wget --quiet --content-disposition --no-use-server-timestamps --no-iri --show-progress --connect-timeout=5 --restrict-file-names=unix"
test -x "$(which curl)" && alias curl="curl --silent --show-error --fail-early --location --connect-timeout 5"
test -x "$(which axel)" && alias axel="axel --ipv4 --no-clobber --alternate --timeout=5"

test -x "$(which curl)" && source "$DOTFILES/modules/ipinfo.sh"
# test -x "$(which curl)" && source "$DOTFILES/modules/tldr.sh"
# test -x "$(which htop)" && source "$DOTFILES/modules/processes.sh"
# test -x "$(which ip)" && [[ "$PLATFORM" != "Darwin" ]] && source "$DOTFILES/modules/iproute2.sh"
# test -x "$(which subl)" && source "$DOTFILES/modules/sublimetext.sh"
test -x "$(which wget)" && source "$DOTFILES/modules/speedtest.sh"

# alias ipinfo="echo; curl -s https://icanhazip.com; echo; curl -s https://ipinfo.io; echo"

# [[ -d "/mnt/WD_GRAPHITE/idk_SMBv2" ]] && alias cdidk="cd /mnt/WD_GRAPHITE/idk_SMBv2"

test -x "$(which ffmpeg)" && source "$DOTFILES/modules/ffmpeg.sh"
test -x "$(which rclone)" && source "$DOTFILES/modules/rclone.sh"

test -x "$(which daemonize)" && alias init.daemonize="daemonize -u nobody -c $HOME -- /usr/bin/env -i HOME=$HOME $(which bash) -l -c"

if [[ -n "$PS1" && -f "/opt/etc/profile.d/bash_completion.sh" ]]; then
	. "/opt/etc/profile.d/bash_completion.sh"
fi

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
