local FD_FLAGS="--color=always --hidden --exclude=.git --exclude=.DS_Store"

alias f="fd $FD_FLAGS --exclude=node_modules --fixed-strings"
alias fgl="fd $FD_FLAGS --exclude=node_modules --glob"

local FD_FLAGS_ALL="$FD_FLAGS --no-ignore"

alias fa="fd $FD_FLAGS_ALL --fixed-strings"
alias faa="fd $FD_FLAGS_ALL --fixed-strings --follow --full-path --absolute-path"
alias fagl="fd $FD_FLAGS_ALL --glob"
alias faagl="fd $FD_FLAGS_ALL --glob --follow --full-path --absolute-path"

alias fpathf="fd $FD_FLAGS_ALL --fixed-strings --exact-depth=1 --absolute-path --base-directory=/ \$(printf \"--search-path %q \" \"\${fpath[@]}\")"

local fr="fd $FD_FLAGS_ALL --fixed-strings --full-path --absolute-path --base-directory=/ \
--exclude=$HOME/.cargo \
--exclude=$HOME/.go \
--exclude=$HOME/.gradle \
--exclude=$HOME/.node-gyp \
--exclude=$HOME/.npm \
--exclude=$HOME/.playground \
--exclude=$HOME/.pnpm-store \
--exclude=$HOME/.rustup \
--exclude=$HOME/.Trash \
--exclude=/usr/local/lib/node_modules \
"
[[ "$PLATFORM" == "Linux" ]] && fr="$fr\
--exclude=$HOME/.linuxbrew \
--exclude=$HOME/emby \
--exclude=/dev \
--exclude=/proc \
--exclude=/sys \
--exclude=/var/lib/emby/cache \
--exclude=/var/lib/emby/metadata \
--exclude=/var/www \
"
[[ "$PLATFORM" == "Darwin" ]] && fr="$fr\
--exclude=$HOME/Desktop \
--exclude=$HOME/Downloads \
--exclude=$HOME/Library/Containers \
--exclude=$HOME/Projects \
--exclude=/Applications \
--exclude=/System/Volumes/Data \
"
alias fr="$(echo "${fr}" | sed 's/ *$//g')"; unset fr
alias frls="type fr | sd ' --' '\n--' | sortt | b"

alias fcount="fd --color=never --type=file --follow --hidden --no-ignore | wc -l"
alias fcounta="fd --color=never --type=file --follow --hidden --no-ignore --follow | wc -l"

unset FD_FLAGS FD_FLAGS_ALL

# function f() { find . -name "*$1*" ${@:2} }
