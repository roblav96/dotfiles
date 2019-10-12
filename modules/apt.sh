alias apts="apt search"
alias aptlsg="apt list 2>/dev/null | grep"
alias aptlsgi="apt list --installed 2>/dev/null | grep"

function aptsg() { apt search $@ 2>/dev/null | grep "$@" }
