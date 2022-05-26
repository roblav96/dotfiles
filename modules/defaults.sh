alias dfrm="defaults delete"
alias dff="defaults find"
alias dfr="defaults read"
alias dfrt="defaults read-type"
alias dfw="defaults write"

alias dfls="defaults domains | sed 's/, /\n/g' | sortt"

function dfi() {
	defaults read "$*" | bl perl
}
function dfs() {
	defaults find "$*" | bl perl
}
