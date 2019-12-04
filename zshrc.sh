#!/usr/bin/env zsh

export ADBLOCK="1"
export DEBUG_COLORS="1"
export DISABLE_OPENCOLLECTIVE="1"
export FORCE_COLOR="1"
export SUPPRESS_SUPPORT="1"

# export RPROMPT="%F{000}%* %F{001}%* %F{002}%* %F{003}%* %F{004}%* %F{005}%* %F{006}%* %F{007}%* %F{008}%* %F{009}%*"
# export RPROMPT="%F{008}%*"
export RPROMPT="%F{008}%*"
export PURE_PROMPT_SYMBOL="➤"
export PURE_CMD_MAX_EXEC_TIME="1"
export KEYTIMEOUT="25"
# export PROMPT_EOL_MARK="➜"
# source "$DOTFILES/modules/geometry.sh"

# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold,underline"

export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
export LESS="-Rgisj.5"
export LESSCHARSET="utf-8"
# export LESSCHARDEF="utf-8"
# export PAGER="less"
# export MANPAGER="$PAGER"
# export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | command bat -p -l man --pager \"less $LESS\"'"
export MANOPT="--encoding=ascii"
# export MAN_KEEP_FORMATTING="1"
# export MANOPT="--no-hyphenation"

export DISABLE_AUTO_UPDATE="true"
# export CASE_SENSITIVE="true"

# if [ $ITERM_SESSION_ID ]; then
# 	export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'
# fi

export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# zle_highlight+=(paste:bold)

PLATFORM="$(uname -o)"
source <(antibody init)
# PLUGINS="$(cat $DOTFILES/plugins.oh-my-zsh.sh)"
# PLUGINS="$PLUGINS\n$(cat $DOTFILES/plugins.${PLATFORM##*/}.sh)"
# PLUGINS="$PLUGINS\n$(cat $DOTFILES/plugins.sh)"
# echo "PLUGINS -> $PLUGINS"
antibody bundle < "$DOTFILES/plugins.oh-my-zsh.sh" < "$DOTFILES/plugins.${PLATFORM##*/}.sh" < "$DOTFILES/plugins.sh"
# eval $(starship init zsh)

# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
# setopt bash_auto_list
# setopt list_ambiguous
setopt rm_star_silent

export HISTSIZE="5000000"
export SAVEHIST="1000000"
setopt hist_ignore_all_dups

eval $(dircolors -b "$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-trapd00r-SLASH-LS_COLORS/LS_COLORS")
# LS_COLORS+="di=38;5;30"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# export FAST_HIGHLIGHT[use_async]="0"
# export PROMPT="%(?.%F{magenta}△.%F{red}▲)%f "
# unsetopt prompt_cr prompt_sp

alias bindkey-debug="echo press key to observe key codes:; cat -v"
# bindkey '^E' sk --ansi -i -c 'rg --color=always --line-number "{}"'
# bindkey '^F' fzf-history-widget
# bindkey '^F' fzf-history-widget
bindkey '^[r' fzf-history-widget
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

unalias ls
unalias la
unalias rd
unalias grep

# alias fo="forever "
alias sudo="sudo "
alias rr="npm run"
# alias rd="rm -rf"
# alias rma="rm -rf"
alias rmd="rm -rf"
# alias rmf="rm -rf"
# alias cp="cp -v"
# alias mv="mv -v"
# alias rm="rm -v"
alias e="nano"
alias n="npm"
alias o="open ."
alias gc="git clone --recurse-submodules"
alias gf="git fetch"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gd="git --no-pager diff"
alias gs="git status --short --branch"
alias gst="git standup"
alias gh="github"
alias k="killall -KILL"
alias ls="ls --color=always"
alias ll="ls -laph"
alias grep="grep --color=always --ignore-case --extended-regexp"
alias g="grep"
function idk() { man -k $@ | grep "$@|$" }; compdef idk=man
alias pwd="pwd && pwd -P"
alias rc="rclone"
alias htop="htop --delay=10"
alias procs="procs --color=always --sortd=Start"
alias ipc="ipcalc -b"
alias http="echo; http --ignore-stdin --pretty=all --style=monokai --timeout=5 --print=b"
alias httpa="http --all --print=HbBh"
alias dims="echo $COLUMNS x $LINES"
alias dateiso="date -u +'%Y-%m-%d'"
alias sedbat="sed -u -r 's/\"|\x27|\#|\`//g' | bat -l rb"
alias zbak="sudo cp $HOME/.zsh_history $HOME/..zsh_history; sudo cp $HOME/.z $HOME/..z"
alias curl="curl --silent --connect-timeout 3"
alias curlt="curl --output /dev/null --write-out '\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n'"
alias redis-cli="redis-cli --no-auth-warning"
alias gradlew="./gradlew"
alias hist="history | tail -n $(expr $(tput lines) - 10) | bat -l sh"
alias aliasls="alias -L | sed 's/^/\n/g' | bat -l sh"
alias dotcd="cd $DOTFILES"
alias dotmodules="batl $DOTFILES/modules/* -l sh"
alias vinspect="FORCE_COLOR=0 vue inspect"
alias clear="clear && printf '\e[3J'"
# alias sedbat='sd "\"|\x27|\`" "" | bat -l rb'
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"

if test -x "$(which exa)"; then
	# export EXA_STRICT="1"
	export EXA_COLORS="uu=2;37:gu=2;3;37:da=32:un=31:gn=2;3;31"
	export EXA_OPTS="--color=always --color-scale --long --header --classify --all --ignore-glob='.git|.DS_Store'"
	alias l="exa $EXA_OPTS"
	alias la="exa $EXA_OPTS --group"
	alias lb="exa $EXA_OPTS --sort=size"
	alias lm="exa $EXA_OPTS --time=modified --sort=modified"
	alias lch="exa $EXA_OPTS --time=changed --sort=changed"
	alias lac="exa $EXA_OPTS --time=accessed --sort=accessed"
	alias lcr="exa $EXA_OPTS --time=created --sort=created"
	alias lr="exa $EXA_OPTS --git-ignore --ignore-glob='.git|.DS_Store|node_modules' --tree --recurse --level=2"
	alias lra="exa $EXA_OPTS --git-ignore --ignore-glob='.git|.DS_Store|node_modules' --tree --recurse"
	alias lar="exa $EXA_OPTS --group --tree --recurse --level=2"
	alias lara="exa $EXA_OPTS --group --tree --recurse"
fi

if test -x "$(which fd)"; then
	export FD_OPTS="--color=always --hidden --exclude='.git' --exclude='.DS_Store'"
	alias f="fd $FD_OPTS --exclude='node_modules' --fixed-strings"
	alias fa="fd $FD_OPTS --no-ignore --fixed-strings"
	alias faf="fd $FD_OPTS --no-ignore --fixed-strings --follow"
	alias fgl="fd $FD_OPTS --exclude='node_modules' --glob"
	alias fagl="fd $FD_OPTS --no-ignore --glob"
	# function f() { fd "$1" ${@:2} --color=always }
	# | grep "$1" --ignore-case --color=always }
	# function fa() { fd "$1" ${@:2} --color=always --hidden --no-ignore --show-errors }
	# function fa() { fd "$1" ${@:2} --hidden --no-ignore --show-errors --color=always | grep "$1" --ignore-case --color=always }
	# function f() { find . -iname "*$1*" ${@:2} }
fi

if test -x "$(which rg)"; then
	# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
	# alias r="rg --color=always --smart-case"
	export RG_OPTS="--color=always --heading --line-number --no-messages --max-columns=$(expr $(tput cols) - 5) --max-columns-preview --smart-case --hidden --glob='!.git' --glob='!.DS_Store'"
	alias r="rg $RG_OPTS --glob='!node_modules' --fixed-strings"
	alias ra="rg $RG_OPTS --no-ignore --fixed-strings --stats"
	alias raa="rg $RG_OPTS --no-ignore --fixed-strings --stats -uuu"
	alias raf="rg $RG_OPTS --no-ignore --fixed-strings --stats --follow"
	# function r() { rg "$1" ${@:2} --smart-case }
	# function ra() { rg -uu "$1" ${@:2} --smart-case }
	# function r() { grep "$1" ${@:2} -R . }
fi

if test -x "$(which fzf)"; then
	export FZF_DEFAULT_OPTS="
		--no-multi
		--tabstop=4
		--height=$(expr $(tput lines) - 5)
		--prompt='$PURE_PROMPT_SYMBOL '
		--color=dark
		--color=fg:-1,bg:-1,hl:5,fg+:231,bg+:-1,hl+:5
		--color=gutter:-1,info:2,prompt:4,pointer:1,marker:6,spinner:1,header:6
	"
	# --color=fg:231,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
	# --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
fi

# export BAT_CONFIG_PATH="$DOTFILES/static"
alias bat="bat --color=always --italic-text=always --decorations=always --tabs=4 --paging=never --wrap=never --theme='Monokai Extended Origin' --style='header,grid'"
alias batl="bat --style='header,grid,numbers'"
alias b='bat'
function batplist() { plistutil -i $@ | bat -l xml }; compdef batplist=cat

# export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;30:2;30'
export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --color-output --sort-keys --tab --indent 4"
alias j="json"

alias duu='du -ah -d 1 | sort -h | sed s/\\t\.\\//\\t/g | tail'
if test -x "$(which dust)"; then
	export DUST_OPTS="--apparent-size --reverse"
	alias dust="command dust $DUST_OPTS --depth=1"
	alias dustr="command dust $DUST_OPTS --number-of-lines=$(expr $(tput lines) - 10)"
fi
# alias .du="du -ah * -d 0 | sort -h"
# alias .du="du -d 1 -h"
alias dff="df -h"
test -x "$(which dfc)" && alias dfc="dfc -d -T -f -c always -q type"
# alias .ping="ping google.com"

alias proxychains="proxychains4 -f /usr/local/etc/proxychains.conf"

# function ipcalc() { npx -q ipcalc-cli $@ | grep Net --color=never | tail -n 4 }

alias p="ps auxww | grep --invert-match grep | grep"
# function p() {
# 	ps auxww | grep -v grep | grep "$@"
# }

# test -x "$(which watchexec)" && alias watch="watchexec"
# test -x "$(which procs)" && alias procs="sudo procs"
if test -x "$(which prettier)"; then
	alias prettier="prettier --no-editorconfig --config $HOME/.prettierrc --config-precedence cli-override"
	function pat() { prettier --parser $1 | bat -l $1 }
fi

function show() {
	type -a $@
	if type -w $@ | grep -q "function"; then
		type -f $@ | bat -l sh
		return 0
	fi
	WHICH="$(which $@)"
	[ -z "$WHICH" ] || [ ! -f "$WHICH" ] && return 0
	if test -x "$(which exa)"; then
		exa -a -l -F -g -m "$WHICH"
		exa -a -l -F -g -m "$(readlink -f $WHICH)"
	else
		ls -lAph --color=always "$WHICH"
		ls -lAph --color=always "$(readlink -f $WHICH)"
	fi
}; compdef show=which

# function rl() { echo -n "$(test -x "$(which $@)" && readlink -f $(which $@) || readlink -f $@)" | pbcopy; pbpaste | cat; echo }
function rl() { test -x "$(which $@)" && exa -a -l -F -g -m "$(readlink -f $(which $@))" || exa -a -l -F -g -m "$(readlink -f $@)" }

alias tl="tldr"
function ch() { curl "https://cheat.sh/$@?T" | bat -l sh }
function cha() { curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$@" | bat -l sh }
# function cha() { test -f ~/.config/cheat/community/$@ && bat ~/.config/cheat/community/$@ -l sh || echo "Not Found!" }

# function rename() {
# 	fd "$1" --no-ignore -x mv {} $2{}
# }

alias rdvpn="echo; curl https://real-debrid.com/vpn | prettier --parser html --use-tabs false --tab-width 0 | grep 'VPN Information' --color=never --after-context=15 | grep 'blocked|$'"
# alias ffprobe="ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams"
if test -x "$(which ffprobe)"; then
	function fprobe() {
		ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams "$@" | json
	}
	if [[ "$PLATFORM" == "Darwin" ]]; then
		compdef fprobe=ffprobe
	fi
fi

test -x "$(which apt)" && source "$DOTFILES/modules/apt.sh"
test -x "$(which cargo)" && source "$DOTFILES/modules/cargo.sh"
test -x "$(which dotnet)" && source "$DOTFILES/modules/dotnet.sh"
test -x "$(which ffsend)" && source "$DOTFILES/modules/ffsend.sh"
test -x "$(which go)" && source "$DOTFILES/modules/go.sh"
test -x "$(which ip)" && source "$DOTFILES/modules/ip.sh"
test -x "$(which launchctl)" && source "$DOTFILES/modules/launchctl.sh"
test -x "$(which npm)" && source "$DOTFILES/modules/npm.sh"
test -x "$(which subl)" && source "$DOTFILES/modules/sublime-text.sh"
test -x "$(which tar)" && source "$DOTFILES/modules/tar.sh"
test -x "$(which tc)" && source "$DOTFILES/modules/tc.sh"
test -x "$(which wget)" && source "$DOTFILES/modules/speed-test.sh"

# autoload -U promptinit; promptinit
# autoload -U compinit && compinit
# source $ZSH/oh-my-zsh.sh
# antibody bundle robbyrussell/oh-my-zsh
# source <(npm completion)
# source <(pm2 completion)
# source <(tns completion)

# zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
# zstyle ':completion:*' insert-tab pending
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
