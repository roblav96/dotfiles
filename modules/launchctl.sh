alias lcdisabled="bat /var/db/com.apple.xpc.launchd/disabled.*"

alias lclist='(
	echo; echo "🌕 User Agents";
	launchctl list | column -t;
	echo; echo "🌕 System Daemons";
	sudo launchctl list | column -t;
)'

alias lchostinfo='(
	echo; echo "🌕 User hostinfo";
	launchctl hostinfo 2>/dev/null | bat -p -l ini;
	echo; echo "🌕 System hostinfo";
	sudo launchctl hostinfo 2>/dev/null | bat -p -l ini;
)'

alias lcdomains='(
	echo; echo "🌕 User domains";
	defaults domains | sd ", " "\n" | sortt;
	echo; echo "🌕 System domains";
	sudo defaults domains | sd ", " "\n" | sortt;
)'

alias lcdumpstate='(
	echo; echo "🌕 User dumpstate";
	launchctl dumpstate | column -t;
	echo; echo "🌕 System dumpstate";
	sudo launchctl dumpstate | column -t;
)'

function lcls() {
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

function lcs() {
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

function lcsr() {
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

function lca() {
	lcf "$*"
	lcr "$*"
}
