export RG_FLAGS="--color=always --heading --line-number --trim --no-messages --max-columns=$(expr $(tput cols) - 5) --max-columns-preview --smart-case --hidden --fixed-strings --glob='!.git' --glob='!.DS_Store'"
# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

alias r="rg $RG_FLAGS --glob='!node_modules'"
alias ra="rg $RG_FLAGS --no-ignore --stats"
alias raa="rg $RG_FLAGS --no-ignore --stats --text --search-zip -uuu"
# alias raf="rg $RG_FLAGS --no-ignore --fixed-strings --stats --follow"
# alias r="rg --color=always --smart-case"

# function r() { rg "$1" ${@:2} --smart-case }
# function ra() { rg -uu "$1" ${@:2} --smart-case }
# function r() { grep "$1" ${@:2} -R . }
