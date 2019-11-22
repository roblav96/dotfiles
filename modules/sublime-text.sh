alias st="subl -f"
alias stp="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stuser="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
alias stprojects="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects'"
alias stsnippets="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Snippets'"
alias stpackages="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Sublime Text 3 Packages.sublime-project'"

function stpush() {
	cd $HOME'/Library/Application Support/Sublime Text 3'
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd $OLDPWD
}
