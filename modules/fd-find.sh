export FD_FLAGS="--color=always --hidden --exclude='.git' --exclude='.DS_Store'"

alias f="fd $FD_FLAGS --exclude='node_modules' --fixed-strings"
alias fa="fd $FD_FLAGS --no-ignore --full-path --follow --fixed-strings"
alias fgl="fd $FD_FLAGS --exclude='node_modules' --glob"
alias fagl="fd $FD_FLAGS --no-ignore --full-path --follow --glob"

# function frm() {
# 	f $@ --exec-batch zsh -ic 'rm -rfv "$@"'
# }
function fbat() {
	f --type=file $@ --exec-batch zsh -ic 'bat "$@"'
}
function fprettier() {
	f --type=file $@ --exec-batch zsh -ic 'prettier --write "$@"'
}
if [[ "$PLATFORM" == "Darwin" ]]; then
	compdef fbat=fd
	compdef fprettier=fd
fi

# function f() { fd "$1" ${@:2} --color=always }
# | grep "$1" --ignore-case --color=always }
# function fa() { fd "$1" ${@:2} --color=always --hidden --no-ignore --show-errors }
# function fa() { fd "$1" ${@:2} --hidden --no-ignore --show-errors --color=always | grep "$1" --ignore-case --color=always }
# function f() { find . -iname "*$1*" ${@:2} }
