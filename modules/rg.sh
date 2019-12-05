export RG_OPTS="--color=always --heading --line-number --no-messages --max-columns=$(expr $(tput cols) - 5) --max-columns-preview --smart-case --hidden --glob='!.git' --glob='!.DS_Store'"
# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

alias r="rg $RG_OPTS --glob='!node_modules' --fixed-strings"
alias ra="rg $RG_OPTS --no-ignore --fixed-strings --stats"
alias raa="rg $RG_OPTS --no-ignore --fixed-strings --stats -uuu"
alias raf="rg $RG_OPTS --no-ignore --fixed-strings --stats --follow"
# alias r="rg --color=always --smart-case"

# function r() { rg "$1" ${@:2} --smart-case }
# function ra() { rg -uu "$1" ${@:2} --smart-case }
# function r() { grep "$1" ${@:2} -R . }
