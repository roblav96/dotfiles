alias lc-ls="echo; echo '🌕 User Agents'; launchctl list; echo; echo '🌕 System Daemons'; sudo launchctl list"
# alias lchostinfo="echo; echo '🌕 User Host Info'; launchctl hostinfo; echo; echo '🌕 System Host Info'; sudo launchctl hostinfo"

function lc-f() {
	echo; echo "🌕 [fd] User Agents"
	fa --ignore-case $@ "$HOME/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 [fd] Library Agents"
	fa --ignore-case $@ "/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 [fd] System Agents"
	fa --ignore-case $@ "/System/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 [fd] Library Daemons"
	fa --ignore-case $@ "/Library/LaunchDaemons" | rgp $@
	echo; echo "🌕 [fd] System Daemons"
	fa --ignore-case $@ "/System/Library/LaunchDaemons" | rgp $@
	# fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings
}

function lc-r() {
	echo; echo "🌕 [rg] User Agents"
	ra --ignore-case --no-stats $@ "$HOME/Library/LaunchAgents"
	echo; echo "🌕 [rg] Library Agents"
	ra --ignore-case --no-stats $@ "/Library/LaunchAgents"
	echo; echo "🌕 [rg] System Agents"
	ra --ignore-case --no-stats $@ "/System/Library/LaunchAgents"
	echo; echo "🌕 [rg] Library Daemons"
	ra --ignore-case --no-stats $@ "/Library/LaunchDaemons"
	echo; echo "🌕 [rg] System Daemons"
	ra --ignore-case --no-stats $@ "/System/Library/LaunchDaemons"
	# rg --color=always --heading --line-number --no-messages --ignore-case --hidden --no-ignore --follow --fixed-strings --max-columns=$(tput cols) --max-columns-preview --text --search-zip -uuu
}

function lc-a() {
	lc-f $@
	lc-r $@
}
