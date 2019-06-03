# 1 char emoji
# ⌚ ⌛ ⌨ ⏏ ⏩ ⏪ ⏫ ⏬ ⏭ ⏮ ⏯ ⏰ ⏱ ⏲ ⏳ ⏸ ⏹ ⏺ ◽ ◾ ☂ ☃ ☄ ☔ ☕ ☘ ☠ ☢ ☣ ☦ ☪ ☮ ☯ ☸ ☹ ♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ♓ ♿ ⚒ ⚓ ⚔ ⚖ ⚗ ⚙ ⚛ ⚜ ⚡ ⚪ ⚫ ⚰ ⚱ ⚽ ⚾ ⛄ ⛅ ⛈ ⛎ ⛏ ⛑ ⛓ ⛔ ⛩ ⛪ ⛰ ⛱ ⛲ ⛳ ⛴ ⛵ ⛷ ⛸ ⛹ ⛺ ⛽ ✅ ✊ ✋ ✍ ✝ ✡ ✨ ❌ ❎ ❓ ❔ ❕ ❗ ❣ ➕ ➖ ➗ ➰ ➿ ⬛ ⬜ ⭐ ⭕
# 1 char
# ❌ ⛔ ⦁ ⬤ ● ⧭ ◉ ➤ ► ∎ ✚ ☗ █ ▶ ➜ ➔ → ■ ◆ ✜ ✦ ⌗ ⌦
# 2 char
# 🛑 🔴 🚫 ⚠️ ⚫︎ ◼︎ 𝓓 ♦︎ ☁︎ ●︎ ✖︎ ⎮︎

# export RPROMPT="%F{000}%* %F{001}%* %F{002}%* %F{003}%* %F{004}%* %F{005}%* %F{006}%* %F{007}%* %F{008}%* %F{009}%*"
# export RPROMPT="%F{008}%*"
export RPROMPT="%F{008}%*"
export PURE_PROMPT_SYMBOL="➤"
export PURE_CMD_MAX_EXEC_TIME="1"
export KEYTIMEOUT="1"
# export PROMPT_EOL_MARK="➜"
# source "$DOTFILES/modules/geometry.sh"

export PAGER="less -R"
export MANPAGER=$PAGER
export BAT_PAGER=$PAGER

export DEBUG_COLORS="yes"
export DISABLE_OPENCOLLECTIVE="true"
export FORCE_COLOR="1"
export SUPPRESS_SUPPORT="1"

export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# zle_highlight+=(paste:bold)

# 

source <(antibody init)
# PLUGINS="$(cat $DOTFILES/plugins.oh-my-zsh.sh)"
# PLUGINS="$PLUGINS\n$(cat $DOTFILES/plugins.$(uname -s).sh)"
# PLUGINS="$PLUGINS\n$(cat $DOTFILES/plugins.sh)"
# echo "PLUGINS -> $PLUGINS"
antibody bundle < "$DOTFILES/plugins.oh-my-zsh.sh" < "$DOTFILES/plugins.$(uname -s).sh" < "$DOTFILES/plugins.sh"

unalias ls
unalias grep

# 

eval $(dircolors -b "$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-trapd00r-SLASH-LS_COLORS/LS_COLORS")
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# setopt rm_star_silent
# export FAST_HIGHLIGHT[use_async]="0"
# export PROMPT="%(?.%F{magenta}△.%F{red}▲)%f "
# unsetopt prompt_cr prompt_sp

# 

# alias fo="forever "
alias rr="npm run "
alias sudo="sudo "
alias idk="man -k"
# alias idk="apropos"
alias k="killall -KILL"
alias rmf="rm -rf"
alias ll="ls -laph --color=always"
alias grep="grep -iE --color=always"
alias htop="htop -d 10"
alias ipc="ipcalc -b"
alias http="echo; http --verbose --pretty=all --style=monokai"
alias curlt="curl -w '\n\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n\n'"
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"

alias l="exa --all --long --header --classify"
alias la="exa --all --long --header --classify --extended"
alias lr="exa --all --long --header --classify --recurse --tree --level=2 --ignore-glob='.git|.DS_Store'"
alias lra="exa --all --long --header --classify --recurse --tree --ignore-glob='.git|.DS_Store'"
alias lraa="exa --all --long --header --classify --recurse --tree --ignore-glob='.git|.DS_Store'"
alias lm="exa --all --long --header --classify --sort=modified"
alias lmr="exa --all --long --header --classify --recurse --tree --level=2 --ignore-glob='.git|.DS_Store' --sort=modified"
alias lma="exa --all --long --header --classify --recurse --tree --ignore-glob='.git|.DS_Store' --sort=modified"
alias lmaa="exa --all --long --header --classify --recurse --tree --ignore-glob='.git|.DS_Store' --sort=modified"
# alias lr="exa --all --long --header --classify --ignore-glob='.git|node_modules' --recurse"

alias f="fd --color=always --hidden --no-ignore --fixed-strings --show-errors --exclude='.git' --exclude='node_modules' --exclude='.DS_Store'"
alias ff="fd --color=always --hidden --no-ignore --fixed-strings --show-errors --follow --exclude='.git' --exclude='node_modules' --exclude='.DS_Store'"
alias fa="fd --color=always --hidden --no-ignore --fixed-strings --show-errors"
# function f() { fd "$1" ${@:2} --color=always }
# | grep "$1" --ignore-case --color=always }
# function fa() { fd "$1" ${@:2} --color=always --hidden --no-ignore --show-errors }
# function fa() { fd "$1" ${@:2} --hidden --no-ignore --show-errors --color=always | grep "$1" --ignore-case --color=always }
# function f() { find . -iname "*$1*" ${@:2} }

# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
# alias r="rg --smart-case --stats"
alias r="rg --smart-case --pretty --max-columns=256 --stats --glob='!.map' --glob='!.git' --glob='!node_modules'"
alias ra="rg --smart-case --pretty --max-columns=256 --stats -u"
alias raa="rg --smart-case --pretty --max-columns=256 --stats -uu"
alias raaa="rg --smart-case --pretty --max-columns=256 --stats -uuu"
# alias ra="rg -uu --smart-case --stats "
# alias raa="rg -uuu --smart-case --stats "
# function r() { rg "$1" ${@:2} --smart-case --stats }
# function ra() { rg -uu "$1" ${@:2} --smart-case --stats }
# function r() { grep "$1" ${@:2} -R . }

export FZF_DEFAULT_OPTS="--ansi --color=16 --tabstop=4 --prompt='➤ '"

# export BAT_CONFIG_PATH="$DOTFILES/static"
alias bat="bat --color=always --paging=never --style='header,grid' --tabs=4 --theme='Monokai Extended Origin' --wrap=never"

# export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;30:2;30'
export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;37:2;37'
alias json="jq --indent 4 --sort-keys --ascii-output --color-output"

alias .du="du -ah -d 1 | sort -h"
# alias .du="du -ah * -d 0 | sort -h"
# alias .du="du -d 1 -h"
alias .df="df -h"
# alias .ping="ping google.com"

# function ipcalc() { npx -q ipcalc-cli $@ | grep Net --color=never | tail -n 4 }

function p() {
	ps -A | grep -v grep | grep "$@"
}

function show() {
	type -a $@
	WHICH=$(which $@)
	[ -z $WHICH ] || [ ! -f $WHICH ] && return 0
	ls -lAph --color=always $WHICH
	readlink -f $WHICH
}
compdef show=which

function npmi() {
	npm i $@; npm i -D @types/$@
}
compdef npmi=npm

function rename() {
	fd "$1" --no-ignore -x mv {} $2{}
}

# alias ffprobe="ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams"
function fprobe() {
	ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams "$1" | json
}

# autoload -U promptinit; promptinit
# autoload -U compinit && compinit
# source $ZSH/oh-my-zsh.sh
# antibody bundle robbyrussell/oh-my-zsh
# source <(npm completion)
# source <(pm2 completion)
# source <(tns completion)
