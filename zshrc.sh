
# ▶ ➤ ➜ █ ⬤

export RPROMPT="%F{white}%*"
export PURE_PROMPT_SYMBOL="▶"
export PURE_CMD_MAX_EXEC_TIME="1"
export KEYTIMEOUT="1"
# export PROMPT_EOL_MARK="➜"

export PAGER="less -R"
export MANPAGER=$PAGER
export NIX_PAGER=$PAGER
export BAT_PAGER=$PAGER

export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# zle_highlight+=(paste:bold)

# 

source <(antibody init)
antibody bundle < "$DOTFILES/plugins.sh"

unalias ls
unalias grep

alias fz="_fz"

# 

eval `dircolors -b "$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-trapd00r-SLASH-LS_COLORS/LS_COLORS"`
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# setopt rm_star_silent
# export FAST_HIGHLIGHT[use_async]="0"
# export PROMPT="%(?.%F{magenta}△.%F{red}▲)%f "
# unsetopt prompt_cr prompt_sp

# 

alias idk="apropos"
alias rmf="rm -rf"
alias ll="ls -lAph --color=always"
alias grep="grep -i --color=always"
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"

alias l="exa --all --long --header --classify"
alias la="exa --all --long --header --classify --extended"
alias lr="exa --all --long --header --classify --ignore-glob='.git|node_modules|.DS_Store' --recurse --tree --level=2"
alias lrr="exa --all --long --header --classify --ignore-glob='.git|node_modules|.DS_Store' --recurse --tree"
alias lra="exa --all --long --header --classify --ignore-glob='.git|.DS_Store' --recurse --tree"
# alias lr="exa --all --long --header --classify --ignore-glob='.git|node_modules' --recurse"

alias f="fd --follow --absolute-path --color=always --hidden --no-ignore --fixed-strings --exclude='.git' --exclude='node_modules' --exclude='.DS_Store'"
alias fa="fd --follow --absolute-path --color=always --hidden --no-ignore --fixed-strings --show-errors"
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

export BAT_CONFIG_PATH="$DOTFILES/static/bat.conf"
# alias bat="bat --theme='Monokai Extended Light' --tabs=4 --paging=never"

# export JQ_COLORS="0;31:0;34:0;34:0;35:0;32:1;37:1;37"
alias json="jq --indent 4 --sort-keys"

# alias .du="du -ah --max-depth=1 | sort -h"
alias .du="du -ah * --max-depth=0 | sort -h"
# alias .du="du -d 1 -h"
alias .df="df -h"
# alias .ping="ping google.com"

function ipcalc() { npx -q ipcalc-cli $@ | grep Net --color=never | tail -n 4 }

compdef show=which
function show() {
	type -a $@
	WHICH=`which $@`
	[ ! -f $WHICH ] && return 0
	ls -lAph --color=always $WHICH
	readlink -v -f $WHICH
}



# autoload -U promptinit; promptinit
# autoload -U compinit && compinit
# source $ZSH/oh-my-zsh.sh
# antibody bundle robbyrussell/oh-my-zsh
# source <(npm completion)
# source <(pm2 completion)
# source <(tns completion)


