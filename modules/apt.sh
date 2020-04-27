alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias apti="apt show"
alias aptfs="apt-file list"

export DPKG_PAGER="cat"
alias dpkg="dpkg --no-pager"
alias dpkg-query="dpkg-query --no-pager"

alias dpkgi="dpkg-query --status"
alias dpkgls="dpkg-query --show | column -t"
alias dpkgfs="dpkg-query --listfiles"
alias dpkgowns="dpkg --search"
alias dpkgdump="dpkg --contents"

# alias apts="apt search"
function apts() {
	apt search $@ 2>/dev/null | rgp $@
}
function aptls() {
	apt list --installed 2>/dev/null
}
function aptlsa() {
	apt list 2>/dev/null
}
