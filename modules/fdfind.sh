local FD_FLAGS="--color=always --hidden --exclude=.git --exclude=.DS_Store"

alias f="fd $FD_FLAGS --exclude=node_modules --fixed-strings"
alias fgl="fd $FD_FLAGS --exclude=node_modules --glob"

local FD_FLAGS_ALL="$FD_FLAGS --no-ignore"

alias fa="fd $FD_FLAGS_ALL --fixed-strings"
alias faa="fd $FD_FLAGS_ALL --fixed-strings --follow --full-path --absolute-path"
alias fagl="fd $FD_FLAGS_ALL --glob"
alias faagl="fd $FD_FLAGS_ALL --glob --follow --full-path --absolute-path"

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
--exclude=$HOME/emby \
--exclude=/dev \
--exclude=/home/linuxbrew/.linuxbrew \
--exclude=/proc \
--exclude=/sys \
--exclude=/var/lib/emby/cache \
--exclude=/var/lib/emby/metadata \
--exclude=/var/www \
"
[[ "$PLATFORM" == "Darwin" ]] && fr="$fr\
--exclude=$HOME/.config/emby-server/cache \
--exclude=$HOME/.config/emby-server/media \
--exclude=$HOME/.config/emby-server/metadata \
--exclude=$HOME/Desktop \
--exclude=$HOME/Downloads \
--exclude=$HOME/Library/Containers \
--exclude=$HOME/Projects \
--exclude=$HOME/Sandbox \
--exclude=/System/Library/Templates/Data \
--exclude=/System/Volumes/Data \
--exclude=/usr/local/var/.DS_Store \
--exclude=/usr/local/var/dmgs \
"
alias fr="$(echo "${fr}" | sed 's/ *$//g')"; unset fr
alias frls="type fr | sd ' --' '\n--' | sortt | bat --style=grid -l ini"

unset FD_FLAGS FD_FLAGS_ALL

alias fwc="fd --color=never --type=file --hidden --no-ignore --follow | wc --lines"
alias fwcm="fd --color=never --type=file --hidden --no-ignore | wc --lines"

alias fpath-f="fd --fixed-strings --max-depth=1 --absolute-path --base-directory=/ \$(printf \"--search-path %q \" \"\${fpath[@]}\")"

# function f() { find . -name "*$1*" ${@:2} }
