export FD_FLAGS="--color=always --hidden --exclude='.git' --exclude='.DS_Store'"

alias f="fd $FD_FLAGS --exclude='node_modules' --fixed-strings"
alias fa="fd $FD_FLAGS --no-ignore --fixed-strings"
alias faf="fd $FD_FLAGS --no-ignore --fixed-strings --follow"
alias fgl="fd $FD_FLAGS --exclude='node_modules' --glob"
alias fagl="fd $FD_FLAGS --no-ignore --glob"

# function f() { fd "$1" ${@:2} --color=always }
# | grep "$1" --ignore-case --color=always }
# function fa() { fd "$1" ${@:2} --color=always --hidden --no-ignore --show-errors }
# function fa() { fd "$1" ${@:2} --hidden --no-ignore --show-errors --color=always | grep "$1" --ignore-case --color=always }
# function f() { find . -iname "*$1*" ${@:2} }
