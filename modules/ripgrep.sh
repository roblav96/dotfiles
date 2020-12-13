declare rg_flags="--heading --line-number --no-messages --smart-case --hidden --fixed-strings --glob='!.git' --glob='!.DS_Store'"
# --colors=match:bg:16 --colors=path:bg:16
# --colors=path:fg:green --colors=path:style:bold
declare rg_max_columns_flags="--max-columns-preview --max-columns=\$(expr \$(tput cols) - 25)"
# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

alias r="rg $rg_flags $rg_max_columns_flags --glob='!node_modules'"
alias rl="rg $rg_flags --glob='!node_modules'"
alias ra="rg $rg_flags $rg_max_columns_flags --no-ignore"
alias ral="rg $rg_flags --no-ignore --stats"
alias raa="rg $rg_flags $rg_max_columns_flags --no-ignore --stats --follow -uuu"
alias raal="rg $rg_flags --no-ignore --stats --follow -uuu"

alias rfs="rg -uu --smart-case --fixed-strings --files-with-matches"

unalias g &>/dev/null
alias g="rg --smart-case --fixed-strings"
alias g1="rg --smart-case --fixed-strings --context=1"
alias gf="rg --smart-case --fixed-strings --color=never"
alias gp="rg --smart-case --fixed-strings --passthru"
alias gw="rg --smart-case --fixed-strings --word-regexp"
alias gx="rg --smart-case --regexp"

alias rgls="rg --type-list"

unset rg_flags rg_max_columns_flags



# alias raf="rg $rg_flags --no-ignore --fixed-strings --stats --follow"
# alias r="rg --smart-case"

# function r() { rg "$1" ${@:2} --smart-case }
# function ra() { rg -uu "$1" ${@:2} --smart-case }
# function r() { grep "$1" ${@:2} -R . }
