# ████  sublime-text  ████

alias s="st --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd $HOME'/Library/Application Support/Sublime Text 3/Packages'"
alias stst="st $HOME'/Library/Application Support/Sublime Text 3/Packages'"
alias stpackages="st $HOME'/Library/Application Support/Sublime Text 3/Packages'"
alias stuser="st $HOME'/Library/Application Support/Sublime Text 3/Packages/User'"
alias stprojects="st $HOME'/Library/Application Support/Sublime Text 3/Packages/User/Projects'"
alias stsnippets="st $HOME'/Library/Application Support/Sublime Text 3/Packages/User/Snippets'"

function stpush() {
	cd $HOME'/Library/Application Support/Sublime Text 3'
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd $OLDPWD
}
