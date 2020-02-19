alias st="subl"
alias sm="smerge"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stst="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Sublime Text.sublime-project'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stcdp="cd '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias stcdu="cd '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
# alias stbak="rm -fv \"\$HOME/Downloads/st3-backup.\$(date --iso-8601).zip\"; zip -r \"\$HOME/Downloads/st3-backup.\$(date --iso-8601).zip\" \"\$HOME/Library/Application Support/Sublime Text 3\""
# alias smbak="rm -fv \"\$HOME/Downloads/sm-backup.\$(date --iso-8601).zip\"; zip -r \"\$HOME/Downloads/sm-backup.\$(date --iso-8601).zip\" \"\$HOME/Library/Application Support/Sublime Merge\""

function stpush() {
	cd "$HOME/Library/Application Support/Sublime Text 3"
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd $OLDPWD
}
