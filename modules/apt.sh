alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
# alias aptfs="apt-file list"
# alias apti="apt show"
# alias apts="apt search"

function apti() {
	apt show "$*" 2>/dev/null | bat --plain -l yml
	apt policy "$*" 2>/dev/null | bat --plain -l yml
}
function aptfs() {
	apt-file list "$*" | sed 's#^.*: ##' | sortt | lscolors
}
function apts() {
	apt search --names-only "$*" 2>/dev/null | rg --smart-case --fixed-strings --passthru "$*"
}
function aptsw() {
	apt search --names-only "$*" 2>/dev/null | rg --smart-case --fixed-strings --passthru --word-regexp "$*"
}
function aptsa() {
	apt search "$*" 2>/dev/null | rg --smart-case --fixed-strings --passthru "$*"
}
function aptls() {
	apt list --installed 2>/dev/null | rg --smart-case --fixed-strings --color=never --invert-match automatic
}
function aptlsa() {
	apt list --installed 2>/dev/null
}

function manapt() {
	[[ $# -eq 1 ]] && debman -p "$1" "$1"
	[[ $# -eq 2 ]] && debman -p "$1" "$2"
}

export DPKG_PAGER="cat"
# alias dpkg="dpkg --no-pager"
# alias dpkg-query="dpkg-query --no-pager"

function dpkgi() {
	dpkg-query --status "$*" | bat --plain -l yml
}
function dpkgfs() {
	dpkg-query --listfiles "$*" | sortt | lscolors
}
function dpkgowns() {
	dpkg --search "$*" | bat --plain -l yml
}
function dpkgdump() {
	dpkg --contents "$*" | lscolors
}
