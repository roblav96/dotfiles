alias dfd="defaults delete"
alias dff="defaults find"
alias dfr="defaults read"
alias dfrt="defaults read-type"
alias dfw="defaults write"

function dfls() {
	echo && echo "🟡 User Domains"
	defaults domains | sed 's/, /\n/g' | sortt
	echo && echo "🟡 System Domains"
	sudo defaults domains | sed 's/, /\n/g' | sortt
}

function dfb() {
	defaults read "$*" | bl perl
}
function dfs() {
	defaults find "$*" | bl perl
}
