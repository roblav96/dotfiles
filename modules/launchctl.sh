alias lcls="echo '\n⭐ User Agents'; launchctl list; echo '\n⭐ System Daemons'; sudo launchctl list"
alias lchostinfo="echo '\n⭐ User Host Info'; launchctl hostinfo; echo '\n⭐ System Host Info'; sudo launchctl hostinfo"

function fpl() {
	echo "\n⭐ LaunchAgents"
	fd --color=always --hidden --no-ignore --fixed-strings "$@" "/System/Library/LaunchAgents" | grep "$@|"
	echo "\n⭐ LaunchDaemons"
	fd --color=always --hidden --no-ignore --fixed-strings "$@" "/System/Library/LaunchDaemons" | grep "$@|"
}
