local FD_FLAGS="--color=always --hidden --exclude=.git"
[[ "$PLATFORM" == "Darwin" ]] && FD_FLAGS="$FD_FLAGS --exclude=.DS_Store"
alias f="fd $FD_FLAGS --exclude=node_modules --fixed-strings"
alias fgl="fd $FD_FLAGS --exclude=node_modules --glob"

local FD_FLAGS_ALL="$FD_FLAGS --no-ignore --full-path"
alias fa="fd $FD_FLAGS_ALL --fixed-strings"
alias faa="fd $FD_FLAGS_ALL --fixed-strings --follow"
alias fagl="fd $FD_FLAGS_ALL --glob"
alias faagl="fd $FD_FLAGS_ALL --glob --follow"

alias ffpath="fd $FD_FLAGS_ALL --fixed-strings --absolute-path --base-directory=/ \$(printf \"--search-path %q \" \"\${fpath[@]}\")"

local fr="fd $FD_FLAGS_ALL --fixed-strings --absolute-path --base-directory=/ \
--exclude=$HOME/.cargo \
--exclude=$HOME/.node-gyp \
--exclude=$HOME/.npm \
--exclude=$HOME/.playground \
--exclude=$HOME/.pnpm-store \
--exclude=$HOME/.rustup \
"
[[ "$PLATFORM" == "Linux" ]] && fr="$fr\
--exclude=$HOME/emby \
--exclude=/dev \
--exclude=/proc \
--exclude=/sys \
--exclude=/var/lib/emby/cache \
--exclude=/var/lib/emby/metadata \
--exclude=/var/www \
"
[[ "$PLATFORM" == "Darwin" ]] && fr="$fr\
--exclude=$HOME/Library/Containers \
--exclude=/Applications \
--exclude=/private \
--exclude=/System \
"
alias fr="$(echo "${fr}" | sed 's/ *$//g')"
unset fr

# [[ "$PLATFORM" == "Linux" ]] && alias fr="$fr\
# --exclude=$HOME/emby \
# --exclude=/dev \
# --exclude=/proc \
# --exclude=/sys \
# --exclude=/var/lib/emby/cache \
# --exclude=/var/lib/emby/metadata \
# --exclude=/var/www \
# "
# [[ "$PLATFORM" == "Darwin" ]] && alias fr="$fr\
# --exclude=$HOME/Library/Containers \
# --exclude=/Applications \
# --exclude=/private \
# --exclude=/System \
# "

alias fcount="fd --color=never --hidden --no-ignore | wc -l"
alias fcounta="fd --color=never --hidden --no-ignore --follow | wc -l"

unset FD_FLAGS FD_FLAGS_ALL FD_COMMON_EXCLUDE



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
