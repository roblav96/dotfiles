alias st="subl"
alias sm="smerge"
alias sto="subl --new-window --command 'project_manager {\"action\": \"switch\"}'"
alias stst="subl '$HOME/Library/Application Support/Sublime Text 3/Packages/User/Projects/Sublime Text.sublime-project'"
alias stcd="cd '$HOME/Library/Application Support/Sublime Text 3'"
alias stcdp="cd '$HOME/Library/Application Support/Sublime Text 3/Packages'"
alias stcdu="cd '$HOME/Library/Application Support/Sublime Text 3/Packages/User'"
# alias stbak="rm -fv \"\$HOME/Downloads/st3-backup.\$(date --iso-8601).zip\"; zip -r \"\$HOME/Downloads/st3-backup.\$(date --iso-8601).zip\" \"\$HOME/Library/Application Support/Sublime Text 3\""
# alias smbak="rm -fv \"\$HOME/Downloads/sm-backup.\$(date --iso-8601).zip\"; zip -r \"\$HOME/Downloads/sm-backup.\$(date --iso-8601).zip\" \"\$HOME/Library/Application Support/Sublime Merge\""

function _sublime-text_bak() {
	[ "$#" != "2" ] && return 1
	local tgz="$HOME/Downloads/$1-backup.$(date --iso-8601).tgz"
	rm -iv "$tgz"
	cd "$HOME/Library/Application Support/$2"
	tar -czvf "$tgz" --exclude=".git" "."
	cd "$OLDPWD"
}
alias stbak="_sublime-text_bak 'sublime_text_3' 'Sublime Text 3'"
alias smbak="_sublime-text_bak 'sublime_merge' 'Sublime Merge'"

# function stbak() {
# 	local tgz="$HOME/Downloads/sublime_text_3-backup.$(date --iso-8601).tgz"
# 	rm -fv "$tgz"
# 	cd "$HOME/Library/Application Support/Sublime Text 3"
# 	tar -czvf "$tgz" --exclude=".git" "."
# 	cd "$OLDPWD"
# }
# function smbak() {
# 	local tgz="$HOME/Downloads/sublime_merge-backup.$(date --iso-8601).tgz"
# 	rm -fv "$tgz"
# 	cd "$HOME/Library/Application Support/Sublime Merge"
# 	tar -czvf "$tgz" --exclude=".git" "."
# 	cd "$OLDPWD"
# }

function stpush() {
	cd "$HOME/Library/Application Support/Sublime Text 3"
	local gs="$(git status -z)"
	git add -A
	git commit -a -m "[`uname -o`] $gs"
	git push origin master
	cd $OLDPWD
}
