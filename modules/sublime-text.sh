alias st="subl"
alias sm="smerge"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stcdp="cd '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias stcdu="cd '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
alias stbak="rm -fv \"\$HOME/Downloads/st3-backup.\$(date --iso-8601).zip\"; zip -r \"\$HOME/Downloads/st3-backup.\$(date --iso-8601).zip\" \"\$HOME/Library/Application Support/Sublime Text 3\""

function stgh() {
	github "$HOME/Library/Application Support/Sublime Text 3"
}
function stgs() {
	cd "$HOME/Library/Application Support/Sublime Text 3"
	git status --short --branch
	cd "$OLDPWD"
}
function stgd() {
	cd "$HOME/Library/Application Support/Sublime Text 3"
	git diff
	cd "$OLDPWD"
}
function stpush() {
	cd "$HOME/Library/Application Support/Sublime Text 3"
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd $OLDPWD
}
