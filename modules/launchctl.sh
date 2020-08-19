alias lcdisabled="bat /var/db/com.apple.xpc.launchd/disabled.*"

function lcl() {
	echo && echo "🌕 User Agents"
	launchctl list | column -t
	echo && echo "🌕 System Daemons"
	sudo launchctl list | column -t
}

function lchostinfo() {
	echo && echo "🌕 User Hostinfo"
	launchctl hostinfo 2>/dev/null | bat --plain -l ini
	# echo && echo "🌕 System hostinfo"
	# sudo launchctl hostinfo 2>/dev/null | bat --style=grid -l ini
}

function lcdomains() {
	echo && echo "🌕 User Domains"
	defaults domains | sed 's#, #\n#g' | sortt
	echo && echo "🌕 System Domains"
	sudo defaults domains | sed 's#, #\n#g' | sortt
}

function lcdumpstate() {
	echo && echo "🌕 User Dumpstate"
	launchctl dumpstate | column -t
	echo && echo "🌕 System Dumpstate"
	sudo launchctl dumpstate | column -t
}

function lcls() {
	echo && echo "🌕 $HOME/Library/LaunchAgents"
	lara "$HOME/Library/LaunchAgents"
	echo && echo "🌕 /Library/LaunchAgents"
	lara "/Library/LaunchAgents"
	echo && echo "🌕 /System/Library/LaunchAgents"
	lara "/System/Library/LaunchAgents"
	echo && echo "🌕 /Library/LaunchDaemons"
	lara "/Library/LaunchDaemons"
	echo && echo "🌕 /System/Library/LaunchDaemons"
	lara "/System/Library/LaunchDaemons"
}

function lcs() {
	echo && echo "🌕 [fd] $HOME/Library/LaunchAgents"
	faa --ignore-case "$*" "$HOME/Library/LaunchAgents" | rg --smart-case --fixed-strings --color=never "$*"
	echo && echo "🌕 [fd] /Library/LaunchAgents"
	faa --ignore-case "$*" "/Library/LaunchAgents" | rg --smart-case --fixed-strings --color=never "$*"
	echo && echo "🌕 [fd] /System/Library/LaunchAgents"
	faa --ignore-case "$*" "/System/Library/LaunchAgents" | rg --smart-case --fixed-strings --color=never "$*"
	echo && echo "🌕 [fd] /Library/LaunchDaemons"
	faa --ignore-case "$*" "/Library/LaunchDaemons" | rg --smart-case --fixed-strings --color=never "$*"
	echo && echo "🌕 [fd] /System/Library/LaunchDaemons"
	faa --ignore-case "$*" "/System/Library/LaunchDaemons" | rg --smart-case --fixed-strings --color=never "$*"
	# fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings
}

function lcsr() {
	echo && echo "🌕 [rg] $HOME/Library/LaunchAgents"
	raa --ignore-case --no-stats "$*" "$HOME/Library/LaunchAgents"
	echo && echo "🌕 [rg] /Library/LaunchAgents"
	raa --ignore-case --no-stats "$*" "/Library/LaunchAgents"
	echo && echo "🌕 [rg] /System/Library/LaunchAgents"
	raa --ignore-case --no-stats "$*" "/System/Library/LaunchAgents"
	echo && echo "🌕 [rg] /Library/LaunchDaemons"
	raa --ignore-case --no-stats "$*" "/Library/LaunchDaemons"
	echo && echo "🌕 [rg] /System/Library/LaunchDaemons"
	raa --ignore-case --no-stats "$*" "/System/Library/LaunchDaemons"
}
