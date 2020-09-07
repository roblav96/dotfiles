local fd_flags="--hidden --exclude=.git --exclude=.DS_Store"
local fd_flags_all="$fd_flags --no-ignore"

alias f="fd $fd_flags --exclude=node_modules"
alias fa="fd $fd_flags_all"
alias faa="fd $fd_flags_all --follow --full-path --absolute-path"

alias fwc="fd -uu --type=file | wc --lines"

alias fpathf='fd -uu --max-depth=1 --absolute-path --base-directory=/ $(printf "--search-path %q " "${fpath[@]}")'

# function f() { find . -name "*$1*" ${@:2} }



local fr="fd -uu --absolute-path --base-directory=/"

fr="$fr \
--exclude=$HOME/.npm \
--exclude=$HOME/.pnpm-store \
--exclude=$HOME/.Trash \
--exclude=.DS_Store \
--exclude=.git \
--exclude=node_modules \
"
[[ "$PLATFORM" == "Linux" ]] && fr="$fr\
--exclude='$HOME/mega*' \
--exclude=/dev \
--exclude=/proc \
--exclude=/sys \
--exclude=/var/www \
"
[[ "$PLATFORM" == "Darwin" ]] && fr="$fr\
--exclude=$HOME/Desktop \
--exclude=$HOME/Library/Containers \
--exclude=/System/Library/Templates/Data \
--exclude=/System/Volumes/Data \
--exclude=/usr/local/var/.DS_Store \
--exclude=/usr/local/var/dmgs \
--exclude=/usr/local/var/mega-webdav \
"
alias fra="$(echo "${fr}" | sed 's/ *$//g')"
alias frals="command -V fra | sed 's# --#\n--#g' | sortt | bat --style=grid -l ini"

fr="$fr\
--exclude=$(antibody home) \
--exclude=$HOME/.cargo \
--exclude=$HOME/.cocoapods \
--exclude=$HOME/.dartServer \
--exclude=$HOME/.gem \
--exclude=$HOME/.go \
--exclude=$HOME/.gradle \
--exclude=$HOME/.m2 \
--exclude=$HOME/.node-gyp \
--exclude=$HOME/.nuget \
--exclude=$HOME/.playground \
--exclude=$HOME/.pub-cache \
--exclude=$HOME/.rustup \
--exclude=$HOME/.vscode-oss \
"
[[ "$PLATFORM" == "Linux" ]] && fr="$fr\
--exclude=$HOME/downloads \
--exclude=$HOME/emby \
--exclude=/home/linuxbrew/.linuxbrew \
--exclude=/var/lib/emby/cache \
--exclude=/var/lib/emby/metadata \
"
[[ "$PLATFORM" == "Darwin" ]] && fr="$fr\
--exclude=$HOME/.config/emby-server \
--exclude=$HOME/Downloads \
--exclude=$HOME/Projects \
--exclude=$HOME/Sandbox \
"
alias fr="$(echo "${fr}" | sed 's/ *$//g')"
alias frls="command -V fr | sed 's# --#\n--#g' | sortt | bat --style=grid -l ini"

unset fd_flags fd_flags_all fr
