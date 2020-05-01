local FD_FLAGS="--color=always --hidden --exclude='.git' --exclude='.DS_Store'"

alias f="fd $FD_FLAGS --fixed-strings --exclude='node_modules'"
alias fa="fd $FD_FLAGS --fixed-strings --no-ignore --full-path --follow"

alias fgl="fd $FD_FLAGS --glob --exclude='node_modules'"
alias fagl="fd $FD_FLAGS --glob --no-ignore --full-path --follow"

unset FD_FLAGS

# # alias snakecase='fd --fixed-strings --exec mv "{}"'
# function snakecase() {
# 	for file in "$@"; do
# 		if [[ -f "$file" ]]; then
# 			# echo "🌕 file -> '$file'"
# 			local base="$(basename "$file")"
# 			echo "🌕 base -> '$base'"
# 		fi
# 	done
# 	unset file
# }

# function fbat() {
# 	f --type=file $@ --exec-batch zsh -ic 'bat "$@"'
# }; [[ "$PLATFORM" == "Darwin" ]] && compdef fbat=fd
# function fprettier() {
# 	f --type=file $@ --exec-batch zsh -ic 'prettier --write "$@"'
# }; [[ "$PLATFORM" == "Darwin" ]] && compdef fprettier=fd

# function frm() {
# 	f $@ --exec-batch zsh -ic 'rm -rfv "$@"'
# }

# function f() { fd "$1" ${@:2} --color=always }
# | grep "$1" --ignore-case --color=always }
# function fa() { fd "$1" ${@:2} --color=always --hidden --no-ignore --show-errors }
# function fa() { fd "$1" ${@:2} --hidden --no-ignore --show-errors --color=always | grep "$1" --ignore-case --color=always }
# function f() { find . -iname "*$1*" ${@:2} }
