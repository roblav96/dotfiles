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
	echo && echo "🌕 System hostinfo"
	sudo launchctl hostinfo 2>/dev/null | bat --plain -l ini
}

function lcdomains() {
	echo && echo "🌕 User Domains"
	defaults domains | sed 's#, #\n#g' | sortt
	echo && echo "🌕 System Domains"
	sudo defaults domains | sed 's#, #\n#g' | sortt
}

function lcdumpstate() {
	echo && echo "🌕 User Dumpstate"
	launchctl dumpstate
	echo && echo "🌕 System Dumpstate"
	sudo launchctl dumpstate
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
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "$HOME/Library/LaunchAgents"
	echo && echo "🌕 [fd] /Library/LaunchAgents"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/Library/LaunchAgents"
	echo && echo "🌕 [fd] /System/Library/LaunchAgents"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/System/Library/LaunchAgents"
	echo && echo "🌕 [fd] /Library/LaunchDaemons"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/Library/LaunchDaemons"
	echo && echo "🌕 [fd] /System/Library/LaunchDaemons"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/System/Library/LaunchDaemons"
}

function lcsr() {
	echo && echo "🌕 [rg] $HOME/Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case -e "$*" "$HOME/Library/LaunchAgents"
	echo && echo "🌕 [rg] /Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case -e "$*" "/Library/LaunchAgents"
	echo && echo "🌕 [rg] /System/Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case -e "$*" "/System/Library/LaunchAgents"
	echo && echo "🌕 [rg] /Library/LaunchDaemons"
	rg -uu --follow --fixed-strings --ignore-case -e "$*" "/Library/LaunchDaemons"
	echo && echo "🌕 [rg] /System/Library/LaunchDaemons"
	rg -uu --follow --fixed-strings --ignore-case -e "$*" "/System/Library/LaunchDaemons"
}
