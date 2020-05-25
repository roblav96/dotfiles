alias lc-ls="(echo; echo '🌕 User Agents'; launchctl list | column -t; echo; echo '🌕 System Daemons'; sudo launchctl list | column -t)"
alias lc-hostinfo="echo; echo '🌕 User Host Info'; launchctl hostinfo 2>/dev/null | bat -p -l ini; echo; echo '🌕 System Host Info'; echo; sudo launchctl hostinfo 2>/dev/null | bat -p -l ini"

function lc-l() {
	echo; echo "🌕 $HOME/Library/LaunchAgents"
	lara "$HOME/Library/LaunchAgents"
	echo; echo "🌕 /Library/LaunchAgents"
	lara "/Library/LaunchAgents"
	echo; echo "🌕 /System/Library/LaunchAgents"
	lara "/System/Library/LaunchAgents"
	echo; echo "🌕 /Library/LaunchDaemons"
	lara "/Library/LaunchDaemons"
	echo; echo "🌕 /System/Library/LaunchDaemons"
	lara "/System/Library/LaunchDaemons"
}

function lc-f() {
	echo; echo "🌕 [fd] $HOME/Library/LaunchAgents"
	faa --ignore-case "$*" "$HOME/Library/LaunchAgents" | rgf "$*"
	echo; echo "🌕 [fd] /Library/LaunchAgents"
	faa --ignore-case "$*" "/Library/LaunchAgents" | rgf "$*"
	echo; echo "🌕 [fd] /System/Library/LaunchAgents"
	faa --ignore-case "$*" "/System/Library/LaunchAgents" | rgf "$*"
	echo; echo "🌕 [fd] /Library/LaunchDaemons"
	faa --ignore-case "$*" "/Library/LaunchDaemons" | rgf "$*"
	echo; echo "🌕 [fd] /System/Library/LaunchDaemons"
	faa --ignore-case "$*" "/System/Library/LaunchDaemons" | rgf "$*"
	# fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings
}

function lc-r() {
	echo; echo "🌕 [rg] $HOME/Library/LaunchAgents"
	raa --ignore-case --no-stats "$*" "$HOME/Library/LaunchAgents"
	echo; echo "🌕 [rg] /Library/LaunchAgents"
	raa --ignore-case --no-stats "$*" "/Library/LaunchAgents"
	echo; echo "🌕 [rg] /System/Library/LaunchAgents"
	raa --ignore-case --no-stats "$*" "/System/Library/LaunchAgents"
	echo; echo "🌕 [rg] /Library/LaunchDaemons"
	raa --ignore-case --no-stats "$*" "/Library/LaunchDaemons"
	echo; echo "🌕 [rg] /System/Library/LaunchDaemons"
	raa --ignore-case --no-stats "$*" "/System/Library/LaunchDaemons"
	# rg --color=always --heading --line-number --no-messages --ignore-case --hidden --no-ignore --follow --fixed-strings --max-columns=$(tput cols) --max-columns-preview --text --search-zip -uuu
}

function lc-a() {
	lc.f "$*"
	lc.r "$*"
}
