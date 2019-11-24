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
unalias grep

# alias fo="forever "
alias rr="npm run "
alias sudo="sudo "
alias idk="man -k"
alias rma="rm -rf"
alias rmd="rm -rf"
alias rmf="rm -rf"
# alias cp="cp -v"
# alias mv="mv -v"
# alias rm="rm -v"
alias e='nano'
alias n='npm'
alias o='open .'
alias gc='git clone --recurse-submodules'
alias gf='git fetch'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gh='github'
alias k="killall -KILL"
alias ls="ls --color=always"
alias ll="ls -laph"
alias grep="grep --color=always --ignore-case --extended-regexp"
# alias grep="grep --color=always --ignore-case --fixed-strings --extended-regexp"
alias g='grep'
alias pwd="pwd && pwd -P"
alias rc='rclone'
alias htop="sudo htop -d 10"
alias ipc="ipcalc -b"
alias http="echo; http --pretty=all --style=monokai --timeout=3 --print=b"
alias httpa="http --print=HBhb --all --verbose"
alias dims='echo "$COLUMNS x $LINES"'
alias dateiso='date -u +"%Y-%m-%d"'
alias gs='git status -sb'
alias gst='git standup'
alias sedbat='sed -u -r "s/\"|\x27|\#|\`//g" | bat -l rb'
alias zbak="sudo cp $HOME/.zsh_history $HOME/..zsh_history; sudo cp $HOME/.z $HOME/..z"
alias curl="curl --silent --connect-timeout 3"
alias curlt="curl -w '\n\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n\n'"
alias yarn='npx yarn'
alias ember='npx ember'
alias redis-cli='redis-cli --no-auth-warning'
alias gradlew='./gradlew'
alias h="history | tail -n $(expr $(tput lines) - 10) | bat -l sh"
alias aliasls="alias -L | sed 's/^/\n/g' | bat -l sh"
alias dotcd="cd $DOTFILES"
alias dotmodules="batt $DOTFILES/modules/* -l sh"
alias vinspect="FORCE_COLOR=0 vue inspect"
alias clear="clear && printf '\e[3J'"
# alias sedbat='sd "\"|\x27|\`" "" | bat -l rb'
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"

export EXA_COLORS="uu=2;37:gu=2;3;37:da=32:un=31:gn=2;3;31"
alias l="exa --all --long --header --classify --group --modified --color-scale --ignore-glob='.git|.DS_Store'"
alias la="exa --all --long --header --classify --group --modified --color-scale --extended --ignore-glob='.git|.DS_Store'"
alias lr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=2 --ignore-glob='.git|.DS_Store|node_modules'"
alias lrr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=3 --ignore-glob='.git|.DS_Store|node_modules'"
alias lrrr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=4 --ignore-glob='.git|.DS_Store|node_modules'"
alias lrrrr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=5 --ignore-glob='.git|.DS_Store|node_modules'"
alias lra="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|.DS_Store|node_modules'"
alias lraa="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|.DS_Store' --extended"
alias lm="exa --all --long --header --classify --group --modified --color-scale --sort=modified --ignore-glob='.git|.DS_Store'"
alias lmr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=2 --ignore-glob='.git|.DS_Store|node_modules' --sort=modified"
alias lmra="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|.DS_Store|node_modules' --sort=modified"
alias lmraa="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|.DS_Store' --sort=modified --extended"
alias lb="exa --all --long --header --classify --group --modified --color-scale --sort=size --ignore-glob='.git|.DS_Store'"
alias lbr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=2 --ignore-glob='.git|.DS_Store|node_modules' --sort=size"
alias lbra="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|.DS_Store|node_modules' --sort=size"
alias lbraa="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|.DS_Store' --sort=size --extended"

alias f="fd --color=always --hidden --no-ignore --fixed-strings --exclude='.git' --exclude='.DS_Store' --exclude='node_modules'"
alias fa="fd --color=always --hidden --no-ignore --fixed-strings --exclude='.git' --exclude='.DS_Store'"
alias faa="fd --color=always --hidden --no-ignore --fixed-strings --exclude='.git' --exclude='.DS_Store' --follow"
alias fg="fd --color=always --hidden --no-ignore --glob --exclude='.git' --exclude='.DS_Store' --exclude='node_modules'"
alias fga="fd --color=always --hidden --no-ignore --glob --exclude='.git' --exclude='.DS_Store' --full-path"
alias fgaa="fd --color=always --hidden --no-ignore --glob --exclude='.git' --exclude='.DS_Store' --follow"
# function f() { fd "$1" ${@:2} --color=always }
# | grep "$1" --ignore-case --color=always }
# function fa() { fd "$1" ${@:2} --color=always --hidden --no-ignore --show-errors }
# function fa() { fd "$1" ${@:2} --hidden --no-ignore --show-errors --color=always | grep "$1" --ignore-case --color=always }
# function f() { find . -iname "*$1*" ${@:2} }

# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
# alias r="rg --color=always --smart-case"
alias r="rg --color=always --heading --line-number --smart-case --max-columns=256 --max-columns-preview --no-messages --fixed-strings --hidden --glob='!.git' --glob='!.DS_Store' --glob='!node_modules'"
alias ra="rg --color=always --heading --line-number --smart-case --max-columns=256 --max-columns-preview --no-messages --fixed-strings --hidden --glob='!.git' --glob='!.DS_Store' --stats --search-zip -uu"
alias raa="rg --color=always --heading --line-number --smart-case --max-columns=256 --max-columns-preview --no-messages --fixed-strings --hidden --glob='!.git' --glob='!.DS_Store' --stats --search-zip -uu --follow"
alias raaa="rg --color=always --heading --line-number --smart-case --max-columns=256 --max-columns-preview --no-messages --fixed-strings --hidden --glob='!.git' --glob='!.DS_Store' --stats --search-zip -uuu --follow"
# function r() { rg "$1" ${@:2} --smart-case }
# function ra() { rg -uu "$1" ${@:2} --smart-case }
# function r() { grep "$1" ${@:2} -R . }

export FZF_DEFAULT_OPTS="
	--no-multi
	--tabstop=4
	--prompt='$PURE_PROMPT_SYMBOL '
	--color=dark
	--color=fg:-1,bg:-1,hl:5,fg+:231,bg+:-1,hl+:5
	--color=gutter:-1,info:2,prompt:4,pointer:1,marker:6,spinner:1,header:6
"
# --color=fg:231,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
# --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef

# export BAT_CONFIG_PATH="$DOTFILES/static"
alias bat="bat --color=always --italic-text=always --decorations=always --tabs=4 --paging=never --wrap=never --style='header,grid' --theme='Monokai Extended Origin'"
alias batl="bat --style='header,grid,numbers'"
alias b='bat'

# export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;30:2;30'
export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --indent 4 --sort-keys --color-output"
alias j='json'

alias ddu='du -ah -d 1 | sort -h | sed s/\\t\.\\//\\t/g | tail'
test -x "$(which dust)" && alias dust="dust --apparent-size --reverse --depth 1"
test -x "$(which dfc)" && alias dfc="dfc -d -T -f -c always -q type"
# alias .du="du -ah * -d 0 | sort -h"
# alias .du="du -d 1 -h"
alias ddf="df -h"
# alias .ping="ping google.com"

alias proxychains="proxychains4 -f /usr/local/etc/proxychains.conf"

# function ipcalc() { npx -q ipcalc-cli $@ | grep Net --color=never | tail -n 4 }

alias p="ps auxww | grep --invert-match grep | grep"
# function p() {
# 	ps auxww | grep -v grep | grep "$@"
# }

# test -x "$(which watchexec)" && alias watch="watchexec"
test -x "$(which prettier)" && alias prettier="prettier --with-node-modules --no-editorconfig --config $HOME/.prettierrc"
function pat() { prettier --parser $1 | bat -l $1 }

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

# alias ffprobe="ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams"
function fprobe() {
	ffprobe -pretty -loglevel quiet -print_format json -probesize 1000000 -analyzeduration 1000000 -show_format -show_streams "$@" | json
}

function batplist() {
	plistutil -i $@ | bat -l xml
}; compdef batplist=cat

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
