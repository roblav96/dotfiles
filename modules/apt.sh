alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptls="apt list"
alias aptlsi="apt list --installed"

alias dpkgi="dpkg-query --status"
alias dpkgfs="dpkg-query --listfiles"

# alias apts="apt search"
function apts() {
	apt search $@ 2>/dev/null | rgp $@
}
