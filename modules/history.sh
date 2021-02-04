alias hist="cat ${HISTFILE:-$HOME/.zsh_history} | sed 's/^: .*:0;//'"
alias histy=" hist | tail --lines=\$(ty2) | sed 's/^/\n/' | bat --plain -l sh"

function histw() {
	hist | rg --smart-case --fixed-strings --word-regexp -e "$*" | sed 's/^/\n/g' | bat --plain -l sh
} && compdef histw=which

function histr() {
	hist | rg --smart-case --fixed-strings -e "$*" | sed 's/^/\n/g' | bat --plain -l sh
} && compdef histr=which

function __histbak() {
	local histfiles=("${HISTFILE:-$HOME/.zsh_history}" "$HOME/.z")
	local histfile && for histfile in "${histfiles[@]}"; do
		if [[ -d "$histfile" ]]; then
			local bakfile="$HOME/.Trash/tmp$(basename "$histfile").bak.$(date --iso-8601=seconds | head -c-7)"
			cp "$histfile" "$bakfile"
			chmod 400 "$bakfile"
		fi
	done
} && alias .zbak=" __histbak"

function __histsd() {
	if [[ $# -ne 2 ]]; then
		echo "🔴 num args '$#' -ne '2' -> '$*'"
		return 1
	fi
	local histfile="${HISTFILE:-$HOME/.zsh_history}"
	echo && echo "🟡 FIND -> '$1'" && echo
	cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings -e "$1"
	echo && echo "🟠 REPLACE -> '$2'" && echo
	cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings --replace "$2" --colors=match:fg:yellow -e "$1"
	echo && read -q "?🔴 CONFIRM -> '$2' ...? " && return 1
	__histbak
	sd --flags c --string-mode "$1" "$2" "$histfile"
	echo && echo "🟢 REPLACED -> '$2'" && echo
	cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings --colors=match:fg:green -e "$2"
} && compdef __histsd=which && alias histsd=" __histsd"

if [[ "$PLATFORM" == "Darwin" ]]; then
	alias .z=" __histbak; subl --wait --new-window $HOME/.z:999999"
	alias {.hist,.zsh_history}=" __histbak; subl --wait --new-window ${HISTFILE:-$HOME/.zsh_history}:999999"
else
	alias .z=" __histbak; rmate --wait --new --line 999999 $HOME/.z"
	alias {.hist,.zsh_history}=" __histbak; rmate --wait --new --line 999999 ${HISTFILE:-$HOME/.zsh_history}"
fi
