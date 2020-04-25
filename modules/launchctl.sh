alias lc.ls="(echo; echo '🌕 User Agents'; launchctl list; echo; echo '🌕 System Daemons'; sudo launchctl list)"
# alias lchostinfo="echo; echo '🌕 User Host Info'; launchctl hostinfo; echo; echo '🌕 System Host Info'; sudo launchctl hostinfo"

function lc.l() {
	echo; echo "🌕 $HOME/Library/LaunchAgents"
	lra "$HOME/Library/LaunchAgents"
	echo; echo "🌕 /Library/LaunchAgents"
	lra "/Library/LaunchAgents"
	echo; echo "🌕 /System/Library/LaunchAgents"
	lra "/System/Library/LaunchAgents"
	echo; echo "🌕 /Library/LaunchDaemons"
	lra "/Library/LaunchDaemons"
	echo; echo "🌕 /System/Library/LaunchDaemons"
	lra "/System/Library/LaunchDaemons"
}

function lc.f() {
	echo; echo "🌕 [fd] $HOME/Library/LaunchAgents"
	fa --ignore-case $@ "$HOME/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 [fd] /Library/LaunchAgents"
	fa --ignore-case $@ "/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 [fd] /System/Library/LaunchAgents"
	fa --ignore-case $@ "/System/Library/LaunchAgents" | rgp $@
	echo; echo "🌕 [fd] /Library/LaunchDaemons"
	fa --ignore-case $@ "/Library/LaunchDaemons" | rgp $@
	echo; echo "🌕 [fd] /System/Library/LaunchDaemons"
	fa --ignore-case $@ "/System/Library/LaunchDaemons" | rgp $@
	# fd --color=always --hidden --full-path --absolute-path --no-ignore --follow --fixed-strings
}

function lc.r() {
	echo; echo "🌕 [rg] $HOME/Library/LaunchAgents"
	ra --ignore-case --no-stats $@ "$HOME/Library/LaunchAgents"
	echo; echo "🌕 [rg] /Library/LaunchAgents"
	ra --ignore-case --no-stats $@ "/Library/LaunchAgents"
	echo; echo "🌕 [rg] /System/Library/LaunchAgents"
	ra --ignore-case --no-stats $@ "/System/Library/LaunchAgents"
	echo; echo "🌕 [rg] /Library/LaunchDaemons"
	ra --ignore-case --no-stats $@ "/Library/LaunchDaemons"
	echo; echo "🌕 [rg] /System/Library/LaunchDaemons"
	ra --ignore-case --no-stats $@ "/System/Library/LaunchDaemons"
	# rg --color=always --heading --line-number --no-messages --ignore-case --hidden --no-ignore --follow --fixed-strings --max-columns=$(tput cols) --max-columns-preview --text --search-zip -uuu
}

function lc.a() {
	lc.f $@
	lc.r $@
}
