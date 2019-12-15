alias lc-ls="echo; echo '🌕 User Agents'; launchctl list; echo; echo '🌕 System Daemons'; sudo launchctl list"
alias lc-hostinfo="echo; echo '🌕 User Host Info'; launchctl hostinfo; echo; echo '🌕 System Host Info'; sudo launchctl hostinfo"

function lc-f() {
	echo; echo "🌕 Find User Agents"
	faa --absolute-path $@ "$HOME/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 Find Library Agents"
	faa --absolute-path $@ "/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 Find System Agents"
	faa --absolute-path $@ "/System/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 Find Library Daemons"
	faa --absolute-path $@ "/Library/LaunchDaemons" | rgp $@
	echo; echo "🌕 Find System Daemons"
	faa --absolute-path $@ "/System/Library/LaunchDaemons" | rgp $@
	# fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings
}

function lc-r() {
	echo; echo "🌕 Grep User Agents"
	raa --ignore-case --no-stats $@ "$HOME/Library/LaunchAgents"
	echo; echo "🌕 Grep Library Agents"
	raa --ignore-case --no-stats $@ "/Library/LaunchAgents"
	echo; echo "🌕 Grep System Agents"
	raa --ignore-case --no-stats $@ "/System/Library/LaunchAgents"
	echo; echo "🌕 Grep Library Daemons"
	raa --ignore-case --no-stats $@ "/Library/LaunchDaemons"
	echo; echo "🌕 Grep System Daemons"
	raa --ignore-case --no-stats $@ "/System/Library/LaunchDaemons"
	# rg --color=always --heading --line-number --no-messages --ignore-case --hidden --no-ignore --follow --fixed-strings --max-columns=$(tput cols) --max-columns-preview --text --search-zip -uuu
}

function lc-a() {
	lc-f $@; lc-r $@
}
