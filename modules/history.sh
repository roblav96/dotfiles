alias hist="cat ${HISTFILE:-$HOME/.zsh_history} | sed 's/^: .*:0;//'"
alias histy=" hist | tail --lines=\$(ty2) | sed 's/^/\n/' | bl sh"

function histr() {
	hist | rg --smart-case "$@" | sed 's/^/\n/g' | bl sh
} && compdef histr=which
alias histw="histr --word-regexp"

function __histbak() {
	local histfiles=("${HISTFILE:-$HOME/.zsh_history}" "$HOME/.z")
	local histfile && for histfile in "${histfiles[@]}"; do
		if [[ -e "$histfile" ]]; then
			local bakfile="$HOME/.Trash/tmp$(basename "$histfile").bak.$(date --iso-8601=seconds | head -c-7)"
			cp "$histfile" "$bakfile"
			chmod 000 "$bakfile"
		fi
	done
} && alias .zbak=" __histbak"

function __histsd() {
	if [[ $# -ne 2 ]]; then
		echo "🔴 num args '$#' -ne '2' -> '$*'"
		return 1
	fi
	local histfile="${HISTFILE:-$HOME/.zsh_history}"
	diff "$histfile" <(sd --preview --flags cw --string-mode "$1" "$2" "$histfile") | delta
	echo && read -q "?🔴 CONFIRM '$1' -> '$2' ...? " && return 1
	echo && __histbak && echo
	sd --flags cw --string-mode "$1" "$2" "$histfile"
	exit
} && compdef __histsd=which && alias histsd=" __histsd"

if [[ "$PLATFORM" == "Darwin" ]]; then
	alias .z=" __histbak; subl --wait --new-window $HOME/.z:999999 && exit"
	alias .hist=" __histbak; subl --wait --new-window ${HISTFILE:-$HOME/.zsh_history}:999999 && exit"
else
	alias .z=" __histbak; rmate --wait --new --line 999999 $HOME/.z && exit"
	alias .hist=" __histbak; rmate --wait --new --line 999999 ${HISTFILE:-$HOME/.zsh_history} && exit"
fi
