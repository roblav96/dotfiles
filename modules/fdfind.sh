alias f="fd --hidden --exclude=.git --exclude=node_modules"
alias fa="fd --hidden --no-ignore --exclude=.git"
alias faa="fd --hidden --no-ignore --exclude=.git --follow --full-path --absolute-path"

function fwc() {
	fd -uu --type=file --exclude=.git $([[ $# -ne 0 ]] && printf "--search-path %q " "$@") | wc --lines
}
# alias fwc="fd -uu --type=file | wc --lines"

function pathf() {
	fd -uu --exact-depth=1 $(printf '--search-path %s ' $path) "$@"
} && compdef pathf=command
function fpathf() {
	fd -uu --exact-depth=1 $(printf '--search-path %s ' $fpath) "$@"
} && compdef fpathf=command
function fpathfb() {
	fpathf "$@" | while read i; do bat -l sh "$i"; done
} && compdef fpathfb=command

# function f() { find . -name "*$1*" ${@:2} }

alias fr~="fd -uu --search-path ~ \
--exclude=.cargo \
--exclude=.cocoapods \
--exclude=.dartServer \
--exclude=.gem \
--exclude=.git \
--exclude=.go \
--exclude=.gradle \
--exclude=.m2 \
--exclude=.npm \
--exclude=.nuget \
--exclude=.playground \
--exclude=.rustup \
--exclude=.Trash \
--exclude=.vscode-oss \
--exclude=Desktop \
--exclude=Documents \
--exclude=Downloads \
--exclude=Library/Containers \
--exclude=mega-webdav \
--exclude=node_modules \
--exclude=Projects \
--exclude=Sandbox"

local fr="fd -uu --absolute-path --base-directory=/"

fr="$fr \
--exclude=$HOME/.cocoapods \
--exclude=$HOME/.gradle \
--exclude=$HOME/.npm \
--exclude=$HOME/.nuget \
--exclude=$HOME/.Trash \
--exclude=.git \
--exclude=/dev \
--exclude=mega-webdav \
--exclude=node_modules \
"
[[ "$PLATFORM" == "Linux" ]] && fr="$fr\
--exclude=/proc \
--exclude=/sys \
--exclude=/var/www \
"
[[ "$PLATFORM" == "Darwin" ]] && fr="$fr\
--exclude=$HOME/Desktop \
--exclude=$HOME/Documents \
--exclude=$HOME/Library/Containers \
--exclude=/System/Library/Templates/Data \
--exclude=/System/Volumes/Data \
--exclude=$HOMEBREW_PREFIX/var/.DS_Store \
--exclude=$HOMEBREW_PREFIX/var/.TemporaryItems \
--exclude=$HOMEBREW_PREFIX/var/dmgs \
--exclude=/Volumes \
"
alias fra="$(echo "${fr}" | sed 's/ *$//g')"
alias frals="command -V fra | sed 's# --#\n--#g' | sortt | bat --style=grid -l ini"

fr="$fr\
--exclude=$HOME/.cargo \
--exclude=$HOME/.dartServer \
--exclude=$HOME/.gem \
--exclude=$HOME/.go \
--exclude=$HOME/.m2 \
--exclude=$HOME/.playground \
--exclude=$HOME/.rustup \
"
[[ "$PLATFORM" == "Linux" ]] && fr="$fr\
--exclude=$HOME/downloads \
--exclude=$HOME/emby \
--exclude=/var/lib/emby/cache \
--exclude=/var/lib/emby/metadata \
"
[[ "$PLATFORM" == "Darwin" ]] && fr="$fr\
--exclude=$HOME/.config/emby-server \
--exclude=$HOME/.vscode-oss \
--exclude=$HOME/Downloads \
--exclude=$HOME/Projects \
--exclude=$HOME/Sandbox \
--exclude=$HOMEBREW_PREFIX/share/flutter/.pub-cache \
"
alias fr="$(echo "${fr}" | sed 's/ *$//g')"
alias frls="command -V fr | sed 's# --#\n--#g' | sortt | bat --style=grid -l ini"

unset fr
