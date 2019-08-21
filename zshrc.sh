#!/usr/bin/env zsh

# 1 char emoji
# ⌚ ⌛ ⌨ ⏏ ⏩ ⏪ ⏫ ⏬ ⏭ ⏮ ⏯ ⏰ ⏱ ⏲ ⏳ ⏸ ⏹ ⏺ ◽ ◾ ☂ ☃ ☄ ☔ ☕ ☘ ☠ ☢ ☣ ☦ ☪ ☮ ☯ ☸ ☹ ♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ♓ ♿ ⚒ ⚓ ⚔ ⚖ ⚗ ⚙ ⚛ ⚜ ⚡ ⚪ ⚫ ⚰ ⚱ ⚽ ⚾ ⛄ ⛅ ⛈ ⛎ ⛏ ⛑ ⛓ ⛔ ⛩ ⛪ ⛰ ⛱ ⛲ ⛳ ⛴ ⛵ ⛷ ⛸ ⛹ ⛺ ⛽ ✅ ✊ ✋ ✍ ✝ ✡ ✨ ❌ ❎ ❓ ❔ ❕ ❗ ❣ ➕ ➖ ➗ ➰ ➿ ⬛ ⬜ ⭐ ⭕
# 1 char
# ❌ ⛔ ⦁ ⬤ ● ⧭ ◉ ➤ ► ∎ ✚ ☗ █ ▶ ➜ ➔ → ✘ ■ ◆ ✜ ✦ ⌗ ⌦
# 2 char
# 🛑 🔴 🚫 ⚠️ ⚫︎ ◼︎ 𝓓 ♦︎ ☁︎ ●︎ ✖︎ ⎮︎

# export RPROMPT="%F{000}%* %F{001}%* %F{002}%* %F{003}%* %F{004}%* %F{005}%* %F{006}%* %F{007}%* %F{008}%* %F{009}%*"
# export RPROMPT="%F{008}%*"
export RPROMPT="%F{008}%*"
export PURE_PROMPT_SYMBOL="➤"
export PURE_CMD_MAX_EXEC_TIME="1"
export KEYTIMEOUT="25"
# export PROMPT_EOL_MARK="➜"
# source "$DOTFILES/modules/geometry.sh"

export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
export LESS="-Rgisj.5"
# export LESSCHARSET="utf-8"
# export LESSCHARDEF="utf-8"
# export PAGER="less"
# export MANPAGER="$PAGER"
export MANOPT="--encoding=ascii"
# export MAN_KEEP_FORMATTING="1"
# export MANOPT="--no-hyphenation"

export ADBLOCK="1"
export DEBUG_COLORS="1"
export DISABLE_OPENCOLLECTIVE="1"
export FORCE_COLOR="1"
export SUPPRESS_SUPPORT="1"

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

# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
# setopt bash_auto_list
# setopt list_ambiguous
setopt rm_star_silent

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
# alias cp="cp -v"
# alias mv="mv -v"
# alias rm="rm -v"
alias n='npm'
alias tl='tldr'
alias gh='github'
alias k="killall -KILL"
alias ll="ls -laph --color=always"
alias grep="grep -iE --color=always"
alias htop="htop -d 10"
alias ipc="ipcalc -b"
alias http="echo; http --pretty=all --style=monokai --verbose"
alias curlt="curl -w '\n\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n\n'"
alias dims='echo "$COLUMNS x $LINES"'
alias dateiso='date -u +"%Y-%m-%d"'
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"
alias sedbat='sed -u -r "s/\"|\x27|\`//g" | bat -l rb'

export EXA_COLORS="uu=2;37:gu=2;3;37:da=32:un=31:gn=2;3;31"
alias l="exa --all --long --header --classify --group --modified --color-scale"
alias la="exa --all --long --header --classify --group --modified --color-scale --extended"
alias lr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=2 --ignore-glob='.git|node_modules'"
alias lra="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|node_modules'"
alias lraa="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git' --extended"
alias lm="exa --all --long --header --classify --group --modified --color-scale --sort=modified"
alias lmr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=2 --ignore-glob='.git|node_modules' --sort=modified"
alias lmra="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|node_modules' --sort=modified"
alias lmraa="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git' --sort=modified --extended"
alias lb="exa --all --long --header --classify --group --modified --color-scale --sort=size"
alias lbr="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --level=2 --ignore-glob='.git|node_modules' --sort=size"
alias lbra="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git|node_modules' --sort=size"
alias lbraa="exa --all --long --header --classify --group --modified --color-scale --recurse --tree --ignore-glob='.git' --sort=size --extended"

alias f="fd --color=always --hidden --no-ignore --fixed-strings --exclude='.git' --exclude='.DS_Store' --exclude='node_modules'"
alias fa="fd --color=always --hidden --no-ignore --fixed-strings --exclude='.git' --exclude='.DS_Store'"
alias faa="fd --color=always --hidden --no-ignore --fixed-strings --exclude='.git' --exclude='.DS_Store' --follow"
# alias ffa="fd --color=always --hidden --no-ignore --fixed-strings --show-errors --exclude='.git' --exclude='.DS_Store' --follow"
# function f() { fd "$1" ${@:2} --color=always }
# | grep "$1" --ignore-case --color=always }
# function fa() { fd "$1" ${@:2} --color=always --hidden --no-ignore --show-errors }
# function fa() { fd "$1" ${@:2} --hidden --no-ignore --show-errors --color=always | grep "$1" --ignore-case --color=always }
# function f() { find . -iname "*$1*" ${@:2} }

# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
# alias r="rg --smart-case --stats"
alias r="rg --smart-case --pretty --max-columns=256 --stats --glob='!.git' --glob='!.DS_Store' --glob='!node_modules'"
alias ra="rg --smart-case --pretty --max-columns=256 --stats --glob='!.git' --glob='!.DS_Store' -uu"
alias raa="rg --smart-case --pretty --max-columns=256 --stats --glob='!.git' --glob='!.DS_Store' -uu --follow"
alias raaa="rg --smart-case --pretty --max-columns=256 --stats --glob='!.git' --glob='!.DS_Store' -uuu --follow"
# alias ra="rg -uu --smart-case --stats "
# alias raa="rg -uuu --smart-case --stats "
# function r() { rg "$1" ${@:2} --smart-case --stats }
# function ra() { rg -uu "$1" ${@:2} --smart-case --stats }
# function r() { grep "$1" ${@:2} -R . }

export HISTSIZE="500000"
export SAVEHIST="100000"

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
alias bat="bat --color=always --italic-text=always --paging=never --style='header,grid' --tabs=4 --theme='Monokai Extended Origin' --wrap=never"

# export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;30:2;30'
export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;37:2;37'
alias json="jq --indent 4 --sort-keys --color-output"
alias j='json'

alias ipinfo="curl -s https://ipinfo.io | json '. |= del(.readme)'"
alias cachefly="wget -O /dev/null https://cachefly.cachefly.net/100mb.test"
alias ie8vbox="wget -O /dev/null https://az792536.vo.msecnd.net/vms/VMBuild_20150916/VirtualBox/IE8/IE8.Win7.VirtualBox.zip"
alias linode="wget -O /dev/null http://speedtest.newark.linode.com/100MB-newark.bin"
alias iperf="iperf3 -c 192.34.85.234 -p 15201 --verbose"

alias ddu="du -ah -d 1 | sort -h"
test -x "$(which dust)" && alias ddu="dust -s"
# alias .du="du -ah * -d 0 | sort -h"
# alias .du="du -d 1 -h"
alias ddf="df -h"
# alias .ping="ping google.com"

alias proxychains="proxychains4 -f /usr/local/etc/proxychains.conf"

# function ipcalc() { npx -q ipcalc-cli $@ | grep Net --color=never | tail -n 4 }

alias p="ps auxww | grep -v grep | grep"
# function p() {
# 	ps auxww | grep -v grep | grep "$@"
# }
alias pf='sudo micro /etc/pf.conf'

function show() {
	type -a $@
	if type -w $@ | grep -q -E function$; then
		type -f $@ | bat -l sh
		return 0
	fi
	WHICH=$(which $@)
	[ -z $WHICH ] || [ ! -f $WHICH ] && return 0
	ls -lAph --color=always $WHICH
	ls -lAph --color=always $(readlink -f $WHICH)
}; compdef show=which

# rl() { echo -n "$(test -x "$(which $@)" && readlink -f $(which $@) || readlink -f $@)" | pbcopy; pbpaste | cat; echo }
rl() { test -x "$(which $@)" && ls -lAph --color=always $(readlink -f $(which $@)) || ls -lAph --color=always $(readlink -f $@) }
ch() { echo; curl -s "https://cheat.sh/$@" }

function npmi() {
	npm i $@; npm i -D @types/$@
}
function npmv() {
	npm info $@ -j | j '.time'
}

function rename() {
	fd "$1" --no-ignore -x mv {} $2{}
}

# alias ffprobe="ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams"
function fprobe() {
	ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams "$1" | json
}

function batpl() {
	plistutil -i $@ | bat -l xml
}; compdef batpl=cat

test -x "$(which tar)" && source "$DOTFILES/modules/tar.sh"
test -x "$(which ffsend)" && source "$DOTFILES/modules/ffsend.zsh"

# autoload -U promptinit; promptinit
# autoload -U compinit && compinit
# source $ZSH/oh-my-zsh.sh
# antibody bundle robbyrussell/oh-my-zsh
# source <(npm completion)
# source <(pm2 completion)
# source <(tns completion)

# zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
# zstyle ':completion:*' insert-tab pending
