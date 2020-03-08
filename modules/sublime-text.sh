alias st="subl"
alias sm="smerge"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stcdp="cd '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias stcdu="cd '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
alias stst="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Sublime Text.sublime-project'"

alias stgs="cd '$HOME/Library/Application Support/Sublime Text 3' && git status --short --branch && cd \"\$OLDPWD\""
alias stgd="cd '$HOME/Library/Application Support/Sublime Text 3' && git diff && cd \"\$OLDPWD\""
function stpush() {
	cd "$HOME/Library/Application Support/Sublime Text 3"
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd $OLDPWD
}
