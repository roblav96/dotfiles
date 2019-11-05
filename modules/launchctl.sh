alias lcls="echo '\n⭐ User Agents'; launchctl list; echo '\n⭐ System Daemons'; sudo launchctl list"
alias lchostinfo="echo '\n⭐ User Host Info'; launchctl hostinfo; echo '\n⭐ System Host Info'; sudo launchctl hostinfo"

function fl() { fd --color=always --hidden --no-ignore --fixed-strings "$@" "/System/Library/LaunchAgents" "/System/Library/LaunchDaemons" }
