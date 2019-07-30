# ████  sublime-text  ████

export STFILES="$HOME/Library/Application Support/Sublime Text 3"

alias stcd="cd '$STFILES'"
alias stprojects="cd '$STFILES'/Packages/User/Projects"
alias stsnippets="st '$STFILES'/Packages/User/Snippets"

function stpush() {
	cd $STFILES
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd $OLDPWD
}
