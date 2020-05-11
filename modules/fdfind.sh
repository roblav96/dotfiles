local FD_FLAGS="--color=always --hidden --exclude=.git --exclude=.DS_Store"
local FD_FLAGS_ALL="$FD_FLAGS --no-ignore --full-path --follow"

alias f="fd $FD_FLAGS --exclude=node_modules --fixed-strings"
alias fgl="fd $FD_FLAGS --exclude=node_modules --glob"

alias fa="fd $FD_FLAGS_ALL --fixed-strings"
alias fagl="fd $FD_FLAGS_ALL --glob"

alias ffpath="fd $FD_FLAGS_ALL --fixed-strings --absolute-path --base-directory=/ \$(printf \"--search-path %q \" \"\${fpath[@]}\")"

if [[ "$PLATFORM" == "Linux" ]]; then
	alias fr="fd $FD_FLAGS_ALL --fixed-strings --absolute-path --base-directory=/ --exclude=/home --exclude=/proc --exclude=/sys --exclude=/var/www --exclude=/var/lib/emby/cache --exclude=/var/lib/emby/metadata"
fi
if [[ "$PLATFORM" == "Darwin" ]]; then
	alias fr="fd $FD_FLAGS_ALL --fixed-strings --absolute-path --base-directory=/ --exclude=/Applications --exclude=/private --exclude=/System --exclude=$HOME/Library/Containers"
fi

unset FD_FLAGS FD_FLAGS_ALL

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
