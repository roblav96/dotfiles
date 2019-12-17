export RG_FLAGS="--pretty --trim --no-messages --smart-case --hidden --fixed-strings --max-columns-preview --max-columns=\$(tput cols) --glob='!.git' --glob='!.DS_Store'"
# export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

alias r="rg $RG_FLAGS --glob='!node_modules'"
alias ra="rg $RG_FLAGS --no-ignore --stats --follow"
alias raa="rg $RG_FLAGS --no-ignore --stats --follow --text --search-zip -uuu"
alias rgp="rg --passthru --ignore-case --fixed-strings"
# alias raf="rg $RG_FLAGS --no-ignore --fixed-strings --stats --follow"
# alias r="rg --color=always --smart-case"

# function r() { rg "$1" ${@:2} --smart-case }
# function ra() { rg -uu "$1" ${@:2} --smart-case }
# function r() { grep "$1" ${@:2} -R . }
