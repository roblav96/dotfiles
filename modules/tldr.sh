alias tl="tldr"
alias tlupd="tldr --update"
alias tlls="tldr --list"
alias tls="tldr --list | sed --unbuffered --regexp-extended 's/, /\n/g' | grep"

function ch() {
	local lang="sh"
	if [[ $# -gt 1 ]]; then
		lang="$1"
	fi
	curl "https://cht.sh/$*?T" | bat -l $lang
}
function cha() {
	curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$1" | bat -l sh
}
# function cha() { test -f ~/.config/cheat/community/$@ && bat ~/.config/cheat/community/$@ -l sh || echo "Not Found!" }
alias ch-bash="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/languages/bash.sh | bat -l sh"
alias ch-git="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/tools/git.sh | bat -l sh"

