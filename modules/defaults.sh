alias dfd="defaults delete"
alias dff="defaults find"
# alias dfr="defaults read"
alias dfrt="defaults read-type"
alias dfw="defaults write"

alias dfdomains="defaults domains | sed 's#, #\n#g' | sortt"

function dfr() {
	defaults read "$*" | bat --plain -l pl
}
function dfs() {
	defaults find "$*" | rg --smart-case --fixed-strings --passthru "$*" | bat --plain -l pl
}
