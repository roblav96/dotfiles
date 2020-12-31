alias hist="cat $HOME/.zsh_history | sed 's/^: .*:0;//'"
alias histy="hist | tail --lines=\$(ty2) | sed 's/^/\n/' | bat --plain -l sh"

function __histw() {
	hist | rg --smart-case --fixed-strings --word-regexp "$*" | sed 's/^/\n/g' | bat --plain -l sh
} && compdef __histw=which && alias histw=" __histw"

function __histr() {
	rg --smart-case --fixed-strings --word-regexp "$*" "$HOME/.zsh_history"
} && compdef __histr=which && alias histr=" __histr"

function __histsd() {
	if [[ $# -ne 2 ]]; then
		echo "🔴 num args '$#' -ne '2' -> '$*'"
		return 1
	fi
	echo && echo "🔶 FIND 🔶 -> '$1'"
	rg --smart-case --fixed-strings --word-regexp "$1" "$HOME/.zsh_history"
	# sd -f w -s "$1" "$2" "$HOME/.zsh_history"
	echo && echo "🔶 REPLACE 🔶 -> '$2'"
	rg --smart-case --fixed-strings --word-regexp "$2" "$HOME/.zsh_history"
} && compdef __histsd=which && alias histsd=" __histsd"
