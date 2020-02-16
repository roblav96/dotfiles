alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptls="apt list"
alias aptlsi="apt list --installed"

# alias apts="apt search"
function apts() {
	apt search $@ 2>/dev/null | rgp $@
}
