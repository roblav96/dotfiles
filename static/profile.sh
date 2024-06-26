#!/usr/bin/env bash

alias sudo="sudo "
alias xargs="xargs "

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
	which st &>/dev/null || alias st="rmate -f"
	which subl &>/dev/null || alias subl="rmate -f"
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
alias g="grep --fixed-strings"

# unalias l
# unalias ll
alias -- -='cd "$OLDPWD"'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdp="cd ~/.playground"
alias ls="ls --color=auto"
alias ll="ls -lAFhN"
if [[ -x "$(which lsd)" ]]; then
	alias lsd="lsd --color=auto --icon=never --date=relative --size=short --header"
	alias l="lsd -lAF"
	alias lr="l --tree --depth=2"
	alias lra="l --tree"
	alias lb="l --sizesort --reverse"
	alias {lm,lch}="l --timesort --reverse"
else
	alias l="ls -lAFhN"
	alias lr="tree -N -F -l -a -A -C -L 2"
	alias lra="tree -N -F -l -a -A -C"
	alias lb="l --sort=size --reverse"
	alias {lm,lch}="l --sort=time --reverse"
fi
alias rp="realpath"
alias pwda="pwd && pwd -P && realpath ."
alias bat="cat" && alias b="bat"
alias htop="htop --delay=1 --highlight-changes=10"
alias bhr="echo"
alias tf="tail -f -n 100"
alias sedlog="sed -u -e 's/^$(date +%Y)/\n$(date +%Y)/' -e 's/^\[$(date +%Y)/\n\[$(date +%Y)/' -e 's/^$(date +%H):/\n$(date +%H):/' -e 's/^$(date -u +%H):/\n$(date -u +%H):/' -e 's/\"//g' -e 's/\x27//g' -e 's/\#//g' -e 's/\`//g' -e 's/*\/*/*/g'"
# function idk() { man -k $@ | grep "$@|$" }
# alias s="subl -f"
alias psa="ps auxww --sort start"
alias p="psa | grep --invert-match ' grep ' | grep --invert-match '/bin/rmate ' | grep"
alias pst="pstree --arguments --compact-not --highlight-all --long --show-parents"
alias killall="killall -v"
alias k="killall -KILL"
alias lsof="lsof -P"
alias dfc="dfc -q name -d -f -T -m -l"
alias duu="du -ah -d1 | sort --human-numeric-sort"
alias pathls="echo \$PATH | sed 's/:\//\n\//g'"

function binstall() {
	local base="$(basename "$1")"
	[[ ! -f "$base" ]] && echo "🔴 !file -> '$base'" && return 1
	local target="$(readlink -f "${2:-"/opt/bin"}")"
	[[ ! -d "$target" ]] && echo "🔴 !directory -> '$target'" && return 1
	cp -v -f -t "$target" "$base"
	chown -v admin:root "$target/$base"
	chmod -v 755 "$target/$base"
}

if [[ -x "$(which gcc_env.sh)" ]]; then
	alias gcc_env='gcc_env.sh && export CPPFLAGS="$CFLAGS -I/opt/include" CXXFLAGS="$CFLAGS $LDFLAGS" CC=gcc CXX=g++ ACLOCAL_PATH=/opt/share/aclocal'
fi

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
	find . -iname "*$**" \
		-not -path "./WD_GRAPHITE/*" -not -path "./.git/*" -not -path "./acct/*" \
		-not -path "./dev/*" -not -path "./proc/*" -not -path "./sys/*"
}
alias r="grep --recursive . --dereference-recursive --no-messages --fixed-strings --context=2 --regexp"
# alias r="grep -R -s -F -C2 -r . -e"
# function r() {
# 	grep --recursive . --dereference-recursive --no-messages --fixed-strings --context=2 --regexp "$*"
# }

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
		opkg find --nocase "*$**" | sed 's/^/\n/'
	}

	# export LD_LIBRARY_PATH="/lib:/usr/lib:/lib/aarch64"

fi

test -x "$(which rsync)" && alias rsync="rsync --verbose --human-readable --progress --recursive --archive --compress"
test -x "$(which wget)" && alias wget="wget --quiet --content-disposition --no-use-server-timestamps --no-iri --show-progress --restrict-file-names=unix"
test -x "$(which curl)" && alias curl="curl --silent --show-error --fail-early --location"
test -x "$(which axel)" && alias axel="axel --ipv4 --no-clobber --alternate"
test -x "$(which aria2c)" && alias aria2dl="aria2c --disable-ipv6 --split=4 --max-concurrent-downloads=4 --max-connection-per-server=4 --min-split-size=1M --file-allocation=none --download-result=full --summary-interval=0"

# test -x "$(which bat)" && source "$DOTFILES/modules/bat.sh"
# test -x "$(which fd)" && source "$DOTFILES/modules/fdfind.sh"
# test -x "$(which rg)" && source "$DOTFILES/modules/ripgrep.sh"

test -x "$(which curl)" && source "$DOTFILES/modules/ipinfo.sh"
# test -x "$(which curl)" && source "$DOTFILES/modules/tldr.sh"
# test -x "$(which htop)" && source "$DOTFILES/modules/processes.sh"
# test -x "$(which ip)" && [[ "$PLATFORM" != "Darwin" ]] && source "$DOTFILES/modules/iproute2.sh"
# test -x "$(which subl)" && source "$DOTFILES/modules/sublimetext.sh"
test -x "$(which wget)" && source "$DOTFILES/modules/speedtest.sh"

# alias ipinfo="echo; curl -s https://icanhazip.com; echo; curl -s https://ipinfo.io; echo"

[[ -d "/mnt/WD_GRAPHITE/mkvs" ]] && alias mkvs="cd /mnt/WD_GRAPHITE/mkvs"
[[ -d "/mnt/WD_GRAPHITE/Google_Play_Music/Takeout/Google Play Music/Tracks" ]] && alias Google_Play_Music="cd '/mnt/WD_GRAPHITE/Google_Play_Music/Takeout/Google Play Music/Tracks'"

test -x "$(which ffmpeg)" && source "$DOTFILES/modules/ffmpeg.sh"
test -x "$(which rclone)" && source "$DOTFILES/modules/rclone.sh"

alias esh="/usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM TERMINFO=$TERMINFO SHELL=/bin/sh /bin/sh"
alias ebash="/usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM TERMINFO=$TERMINFO SHELL=$(which bash) $(which bash)"

if [[ -x "$(which daemonize)" ]]; then
	function init.daemonize() {
		daemonize -v -c "$PWD" /usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM TERMINFO=$TERMINFO SHELL=$(which bash) $(which bash) -l -c "$*"
	}
	function init.daemonize.log() {
		local cmd="$(basename "$1")"
		daemonize -v -c "$PWD" -e "$HOME/.daemonize/$cmd.log" -o "$HOME/.daemonize/$cmd.log" /usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM TERMINFO=$TERMINFO SHELL=$(which bash) $(which bash) -l -c "$*"
	}
fi

if [[ -n "$PS1" && -f "/opt/etc/profile.d/bash_completion.sh" ]]; then
	. "/opt/etc/profile.d/bash_completion.sh"
fi

if [[ -x "/opt/bin/go/bin/go" ]]; then
	export GOROOT="/opt/bin/go"
	export PATH="$HOME/go/bin:/opt/bin/go/bin:$PATH"
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
