alias hist="cat $HOME/.zsh_history | sed 's/^: .*:0;//'"
alias histy="hist | tail --lines=\$(ty2) | sed 's/^/\n/' | bat --plain -l sh"

function __histw() {
	hist | rg --case-sensitive --fixed-strings --word-regexp -e "$*" | sed 's/^/\n/g' | bat --plain -l sh
} && compdef __histw=which && alias histw=" __histw"

function __histr() {
	hist | rg --case-sensitive --fixed-strings -e "$*" | sed 's/^/\n/g' | bat --plain -l sh
} && compdef __histr=which && alias histr=" __histr"

function __histsd() {
	if [[ $# -ne 2 ]]; then
		echo "🟥 num args '$#' -ne '2' -> '$*'"
		return 1
	fi
	local histfile="${HISTFILE:-$HOME/.zsh_history}"
	local bakfile="$HOME/.Trash/tmp$(basename "$histfile").bak.$(date --iso-8601=seconds | head -c-7)"
	echo && echo "🟨 FIND -> '$1'" && echo
	cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings -e "$1"
	echo && echo "🟨 REPLACE -> '$2'" && echo
	cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings --replace "$2" --colors=match:fg:yellow -e "$1"
	echo && read -q "?🟧 CONFIRM -> '$2' ...? " && return 1
	cp "$histfile" "$bakfile"
	chmod 400 "$bakfile"
	sd --flags c --string-mode "$1" "$2" "$histfile"
	echo && echo "🟩 REPLACED -> '$2'" && echo
	cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings --colors=match:fg:green -e "$2"
} && compdef __histsd=which && alias histsd=" __histsd"
