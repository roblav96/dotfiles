alias aptls="apt list"
alias aptlsg="apt list 2>/dev/null | grep"
alias aptlsi="apt list --installed"
alias aptlsig="apt list --installed 2>/dev/null | grep"

# alias apts="apt search"
function apts() {
	apt search $@ 2>/dev/null | grep "$@|$"
}
