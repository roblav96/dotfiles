alias aptsg="apt search 2>/dev/null | grep"
alias aptlsg="apt list 2>/dev/null | grep"
alias aptlsgi="apt list --installed 2>/dev/null | grep"

function apts() { apt search $@ 2>/dev/null | grep "'$@'" }
