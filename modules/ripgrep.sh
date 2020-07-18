local RG_FLAGS="--color=always --heading --line-number --no-messages --smart-case --hidden --fixed-strings --glob='!.git' --glob='!.DS_Store'"
# --colors=match:bg:16 --colors=path:bg:16
# --colors=path:fg:green --colors=path:style:bold
local RG_MAX_COLUMNS_FLAGS="--trim --max-columns-preview --max-columns=\$(expr \$(tput cols) - 25)"
# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

alias r="rg $RG_FLAGS $RG_MAX_COLUMNS_FLAGS --glob='!node_modules'"
alias rl="rg $RG_FLAGS --glob='!node_modules'"
alias ra="rg $RG_FLAGS $RG_MAX_COLUMNS_FLAGS --no-ignore --stats"
alias ral="rg $RG_FLAGS --no-ignore --stats"
alias raa="rg $RG_FLAGS $RG_MAX_COLUMNS_FLAGS --no-ignore --stats --follow -uuu"
alias raal="rg $RG_FLAGS --no-ignore --stats --follow -uuu"

alias rgp="rg --color=always --smart-case --fixed-strings --passthru"
alias rgpw="rg --color=always --smart-case --fixed-strings --passthru --word-regexp"

alias rgf="rg --color=never --smart-case --fixed-strings"
alias rgg="rg --color=always --smart-case --fixed-strings"
alias rgw="rg --color=always --smart-case --fixed-strings --word-regexp"
alias rgx="rg --color=always --smart-case --regexp"

unalias g &>/dev/null
alias g="rg --color=always --smart-case --fixed-strings"
alias rgls="rg --type-list"

unset RG_FLAGS RG_MAX_COLUMNS_FLAGS



# alias raf="rg $RG_FLAGS --no-ignore --fixed-strings --stats --follow"
# alias r="rg --color=always --smart-case"

# function r() { rg "$1" ${@:2} --smart-case }
# function ra() { rg -uu "$1" ${@:2} --smart-case }
# function r() { grep "$1" ${@:2} -R . }
