alias lcdisabled="bat /var/db/com.apple.xpc.launchd/*.plist"
# alias lcdisableds="lcdisabled | rg --after-context=1 --smart-case --fixed-strings"
function lcdisableds() {
	rg --fixed-strings --ignore-case --after-context=1 --context-separator='' "$*" /var/db/com.apple.xpc.launchd/*.plist
	# cat "/var/db/com.apple.xpc.launchd/disabled."* | rg --color=always --after-context=1 --case-sensitive --fixed-strings "$*"
}

function lcl() {
	launchctl dumpstate | rg --color=never -e '^(gui/501/.+) = \{' -or '$1' | sortt
	launchctl dumpstate | rg --color=never -e '^(user/501/.+) = \{' -or '$1' | sortt
	launchctl dumpstate | rg --color=never -e '^(system/.+) = \{' -or '$1' | sortt
}
function lcla() {
	launchctl dumpstate | rg --color=never -e '^(.+/*/.+) = \{' -or '$1' | sortt
}
function lcb() {
	local v && for v in "$@"; do
		launchctl print "gui/501/$v" 2>/dev/null | bl java
		launchctl print "user/501/$v" 2>/dev/null | bl java
		launchctl print "system/$v" 2>/dev/null | bl java
	done
}
function lcs() {
	echo && echo "🟢 ENABLED"
	lcl | rg --fixed-strings --ignore-case "$*"
	echo && echo "🔴 DISABLED"
	lcdl | rg --fixed-strings --ignore-case "$*"
}
function lcsb() {
	lcs "$*" | while read i; do
		echo && echo "🟡 $i"
		lcb $(basename $i)
	done
}

function lcdl() {
	launchctl print-disabled gui/501 | rg --color=never -e '"(.+)" => true' -or 'gui/501/$1' | sortt
	launchctl print-disabled system | rg --color=never -e '"(.+)" => true' -or 'system/$1' | sortt
}
function lcds() {
	lcdl | rg --fixed-strings --ignore-case "$*"
}
function lcdown() {
	local v && for v in "$@"; do
		launchctl print "gui/501/$v" &>/dev/null \
			&& launchctl bootout "gui/501/$v" && launchctl disable "gui/501/$v" \
			&& echo "🔴 DISABLED -> 'gui/501/$v'"
		launchctl print "user/501/$v" &>/dev/null \
			&& launchctl bootout "user/501/$v" && launchctl disable "user/501/$v" \
			&& echo "🔴 DISABLED -> 'user/501/$v'"
		launchctl print "system/$v" &>/dev/null \
			&& sudo launchctl bootout "system/$v" && sudo launchctl disable "system/$v" \
			&& echo "🔴 DISABLED -> 'system/$v'"
	done
}
function lcup() {
	local v && for v in "$@"; do
		launchctl print-disabled gui/501 | rg -q $v && launchctl enable "gui/501/$v" \
			&& sudo /usr/libexec/PlistBuddy -c "Delete $v" /var/db/com.apple.xpc.launchd/disabled.501.plist &>/dev/null \
			&& echo "🟢 ENABLED -> 'gui/501/$v'"
		launchctl print-disabled system | rg -q $v && sudo launchctl enable "system/$v" \
			&& sudo /usr/libexec/PlistBuddy -c "Delete $v" /var/db/com.apple.xpc.launchd/disabled.plist &>/dev/null \
			&& echo "🟢 ENABLED -> 'system/$v'"
	done
}
function lcdel() {
	local v && for v in "$@"; do
		sudo /usr/libexec/PlistBuddy -c "Delete $v" /var/db/com.apple.xpc.launchd/disabled.501.plist &>/dev/null \
			&& echo "🟢 DELETED -> '$v' disabled.501.plist"
		sudo /usr/libexec/PlistBuddy -c "Delete $v" /var/db/com.apple.xpc.launchd/disabled.plist &>/dev/null \
			&& echo "🟢 DELETED -> '$v' disabled.plist"
	done
}

function lcls() {
	echo && echo "🟡 User Agents"
	launchctl list | column -t
	echo && echo "🟡 System Daemons"
	sudo launchctl list | column -t
}
function lclsp() {
	echo && echo "🟡 User Agents"
	launchctl list | sed '/^-/d' | sort --numeric-sort | column -t
	echo && echo "🟡 System Daemons"
	sudo launchctl list | sed '/^-/d' | sort --numeric-sort | column -t
}

function lchostinfo() {
	echo && echo "🟡 User Hostinfo"
	launchctl hostinfo 2>/dev/null | bl ini
	echo && echo "🟡 System hostinfo"
	sudo launchctl hostinfo 2>/dev/null | bl ini
}

function lclra() {
	echo && echo "🟡 $HOME/Library/LaunchAgents"
	lara "$HOME/Library/LaunchAgents"
	echo && echo "🟡 /Library/LaunchAgents"
	lara "/Library/LaunchAgents"
	echo && echo "🟡 /System/Library/LaunchAgents"
	lara "/System/Library/LaunchAgents"
	echo && echo "🟡 /Library/LaunchDaemons"
	lara "/Library/LaunchDaemons"
	echo && echo "🟡 /System/Library/LaunchDaemons"
	lara "/System/Library/LaunchDaemons"
}

function lcf() {
	echo && echo "🟡 [fd] $HOME/Library/LaunchAgents"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "$HOME/Library/LaunchAgents"
	echo && echo "🟡 [fd] /Library/LaunchAgents"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/Library/LaunchAgents"
	echo && echo "🟡 [fd] /System/Library/LaunchAgents"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/System/Library/LaunchAgents"
	echo && echo "🟡 [fd] /Library/LaunchDaemons"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/Library/LaunchDaemons"
	echo && echo "🟡 [fd] /System/Library/LaunchDaemons"
	fd -uu --follow --absolute-path --fixed-strings --ignore-case "$*" "/System/Library/LaunchDaemons"
}
function lcfb() {
	lcf "$*" | while read i; do
		[[ -e "$i" ]] && bpl "$i"
	done
}

function lcfr() {
	echo && echo "🟡 [rg] $HOME/Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case --context=2 --context-separator='' -e "$*" "$HOME/Library/LaunchAgents"
	echo && echo "🟡 [rg] /Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case --context=2 --context-separator='' -e "$*" "/Library/LaunchAgents"
	echo && echo "🟡 [rg] /System/Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case --context=2 --context-separator='' -e "$*" "/System/Library/LaunchAgents"
	echo && echo "🟡 [rg] /Library/LaunchDaemons"
	rg -uu --follow --fixed-strings --ignore-case --context=2 --context-separator='' -e "$*" "/Library/LaunchDaemons"
	echo && echo "🟡 [rg] /System/Library/LaunchDaemons"
	rg -uu --follow --fixed-strings --ignore-case --context=2 --context-separator='' -e "$*" "/System/Library/LaunchDaemons"
}
function lcfrfs() {
	echo && echo "🟡 [rg] $HOME/Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case --files-with-matches -e "$*" "$HOME/Library/LaunchAgents"
	echo && echo "🟡 [rg] /Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case --files-with-matches -e "$*" "/Library/LaunchAgents"
	echo && echo "🟡 [rg] /System/Library/LaunchAgents"
	rg -uu --follow --fixed-strings --ignore-case --files-with-matches -e "$*" "/System/Library/LaunchAgents"
	echo && echo "🟡 [rg] /Library/LaunchDaemons"
	rg -uu --follow --fixed-strings --ignore-case --files-with-matches -e "$*" "/Library/LaunchDaemons"
	echo && echo "🟡 [rg] /System/Library/LaunchDaemons"
	rg -uu --follow --fixed-strings --ignore-case --files-with-matches -e "$*" "/System/Library/LaunchDaemons"
}
function lcfrb() {
	lcfrfs "$*" | while read i; do
		[[ -e "$i" ]] && bpl "$i"
	done
}
