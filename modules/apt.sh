alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptfs="apt-file list"
# alias apti="apt show"
# alias apts="apt search"

function apti() {
	apt show "$1" 2>/dev/null | bat -l yaml
}; compdef apti=apt
function apts() {
	apt search "$1" 2>/dev/null | rgp "$1"
}
function aptls() {
	apt list --installed 2>/dev/null | rgf --invert-match automatic
}
function aptlsa() {
	apt list --installed 2>/dev/null
}

export DPKG_PAGER="cat"
alias dpkg="dpkg --no-pager"
alias dpkg-query="dpkg-query --no-pager"

alias dpkgi="dpkg-query --status"
alias dpkgls="dpkg-query --show | column -t"
alias dpkgfs="dpkg-query --listfiles"
alias dpkgowns="dpkg --search"
alias dpkgdump="dpkg --contents"
