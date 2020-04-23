alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias apti="apt show"
alias aptfs="apt-file list"

alias dpkgi="dpkg-query --status"
alias dpkgfs="dpkg-query --listfiles"

# alias apts="apt search"
function apts() {
	apt search $@ 2>/dev/null | rgp $@
}
function aptls() {
	apt list 2>/dev/null
}
function aptlsi() {
	apt list --installed 2>/dev/null
}
