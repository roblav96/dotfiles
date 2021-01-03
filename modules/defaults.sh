alias dfrm="defaults delete"
alias dff="defaults find"
alias dfr="defaults read"
alias dfrt="defaults read-type"
alias dfw="defaults write"

alias dfdomains="defaults domains | sed 's/, /\n/g' | sortt"

function dfi() {
	defaults read "$*" | bl ini
}
function dfs() {
	defaults find "$*" | bl ini
}
