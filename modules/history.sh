alias hist="cat ${HISTFILE:-$HOME/.zsh_history} | sed 's/^: .*:0;//'"
alias histy=" hist | tail --lines=\$(ty2) | sed 's/^/\n/' | bl sh"

function histr() {
	hist | rg --smart-case "$@" | sed 's/^/\n/g' | bl sh
} && compdef histr=which
alias histw="histr --word-regexp"

function __histbak() {
	echo
	local histfiles=("${HISTFILE:-$HOME/.zsh_history}" "$HOME/.z")
	local histfile && for histfile in "${histfiles[@]}"; do
		if [[ -e "$histfile" ]]; then
			local bakfile="$HOME/.Trash/tmp$(basename "$histfile").bak.$(date --iso-8601=seconds | head -c-7)"
			cp "$histfile" "$bakfile"
			chmod 000 "$bakfile"
		fi
	done
	echo
} && alias .zbak=" __histbak"

function __histsd() {
	if [[ $# -ne 2 ]]; then
		echo "🔴 num args '$#' -ne '2' -> '$*'"
		return 1
	fi
	local histfile="${HISTFILE:-$HOME/.zsh_history}"
	echo && echo "█ 🟡 FIND -> '$1'" && echo
	# cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings "$1"
	hist | rg --case-sensitive --fixed-strings --word-regexp "$1"
	echo && echo "█ 🟠 REPLACE -> '$2'" && echo
	# cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings --colors=match:fg:yellow --replace "$2" "$1"
	hist | rg --case-sensitive --fixed-strings --word-regexp --colors=match:fg:yellow --replace "$2" "$1"
	echo && read -q "?🔴 CONFIRM -> '$2' ...? " && return 1
	__histbak
	sd --flags cw --string-mode \'$1\' \'$2\' "$histfile"
	echo && echo "█ 🟢 REPLACED -> '$2'" && echo
	# cat "$histfile" | sed 's/^: .*:0;/:0;/' | rg --case-sensitive --fixed-strings --colors=match:fg:green "$2"
	hist | rg --case-sensitive --fixed-strings --word-regexp --colors=match:fg:green "$2"
} && compdef __histsd=which && alias histsd=" __histsd"

if [[ "$PLATFORM" == "Darwin" ]]; then
	alias .z=" __histbak; subl --wait --new-window $HOME/.z:999999"
	alias {.hist,.zsh_history}=" __histbak; subl --wait --new-window ${HISTFILE:-$HOME/.zsh_history}:999999"
else
	alias .z=" __histbak; rmate --wait --new --line 999999 $HOME/.z"
	alias {.hist,.zsh_history}=" __histbak; rmate --wait --new --line 999999 ${HISTFILE:-$HOME/.zsh_history}"
fi
