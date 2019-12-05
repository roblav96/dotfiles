alias lc-ls="echo '\n🌕 User Agents 🌕'; launchctl list; echo '\n🌕 System Daemons 🌕'; sudo launchctl list"
alias lc-hostinfo="echo '\n🌕 User Host Info 🌕'; launchctl hostinfo; echo '\n🌕 System Host Info 🌕'; sudo launchctl hostinfo"

function lc-f() {
	echo '\n🌕 Find User Agents 🌕'
	fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings $@ "$HOME/Library/LaunchAgents" | grep "$@|$"
	echo '\n🌕 Find Library Agents 🌕'
	fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings $@ "/Library/LaunchAgents" | grep "$@|$"
	echo '\n🌕 Find System Agents 🌕'
	fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings $@ "/System/Library/LaunchAgents" | grep "$@|$"
	echo '\n🌕 Find Library Daemons 🌕'
	fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings $@ "/Library/LaunchDaemons" | grep "$@|$"
	echo '\n🌕 Find System Daemons 🌕'
	fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings $@ "/System/Library/LaunchDaemons" | grep "$@|$"
}

function lc-r() {
	echo '\n🌕 Grep User Agents 🌕'
	rg -uuu --color=always --heading --line-number --smart-case --no-messages --follow --fixed-strings $@ "$HOME/Library/LaunchAgents"
	echo '\n🌕 Grep Library Agents 🌕'
	rg -uuu --color=always --heading --line-number --smart-case --no-messages --follow --fixed-strings $@ "/Library/LaunchAgents"
	echo '\n🌕 Grep System Agents 🌕'
	rg -uuu --color=always --heading --line-number --smart-case --no-messages --follow --fixed-strings $@ "/System/Library/LaunchAgents"
	echo '\n🌕 Grep Library Daemons 🌕'
	rg -uuu --color=always --heading --line-number --smart-case --no-messages --follow --fixed-strings $@ "/Library/LaunchDaemons"
	echo '\n🌕 Grep System Daemons 🌕'
	rg -uuu --color=always --heading --line-number --smart-case --no-messages --follow --fixed-strings $@ "/System/Library/LaunchDaemons"
}

function lc-a() {
	lc-f $@; lc-r $@
}
