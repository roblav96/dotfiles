export RG_FLAGS="--color=always --heading --line-number --trim --no-messages --smart-case --hidden --fixed-strings --glob='!.git' --glob='!.DS_Store'"
# --colors=path:fg:green --colors=path:style:bold
export RG_MAX_COLUMNS_FLAGS="--max-columns-preview --max-columns=\$(expr \$(tput cols) - 25)"
# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

alias r="rg $RG_FLAGS $RG_MAX_COLUMNS_FLAGS --glob='!node_modules'"
alias ra="rg $RG_FLAGS $RG_MAX_COLUMNS_FLAGS --no-ignore --stats --follow"
alias ral="rg $RG_FLAGS --no-ignore --stats --follow"
alias raa="rg $RG_FLAGS $RG_MAX_COLUMNS_FLAGS --no-ignore --stats --follow --text --search-zip -uuu"
alias raal="rg $RG_FLAGS --no-ignore --stats --follow --text --search-zip -uuu"
alias rgg="rg --color=never --ignore-case --fixed-strings"
alias rgp="rg --color=always --ignore-case --fixed-strings --passthru"
# alias raf="rg $RG_FLAGS --no-ignore --fixed-strings --stats --follow"
# alias r="rg --color=always --smart-case"

alias rgls="rg --type-list"

# function r() { rg "$1" ${@:2} --smart-case }
# function ra() { rg -uu "$1" ${@:2} --smart-case }
# function r() { grep "$1" ${@:2} -R . }
