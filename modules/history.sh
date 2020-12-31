alias hist="cat $HOME/.zsh_history | sed 's/^: .*:0;//'"
alias histy="hist | tail --lines=\$(ty2) | sed 's/^/\n/' | bat --plain -l sh"

function __histw() {
	hist | rg --smart-case --fixed-strings --word-regexp "$*" | sed 's/^/\n/g' | bat --plain -l sh
} && compdef __histw=which && alias histw=" __histw"

function __histr() {
	rg --smart-case --fixed-strings "$*" "$HOME/.zsh_history"
} && compdef __histr=which && alias histr=" __histr"

function __histsd() {
	if [[ $# -ne 2 ]]; then
		echo "🔴 num args '$#' -ne '2' -> '$*'"
		return 1
	fi
	echo && echo "🔶 FIND 🔶 -> '$1'"
	rg --smart-case --fixed-strings "$1" "$HOME/.zsh_history"
	cp "$HOME/.zsh_history" "$HOME/...zsh_history.bak.$(dateiso)"
	sd -s "$1" "$2" "$HOME/.zsh_history"
	echo && echo "🔶 REPLACE 🔶 -> '$2'"
	rg --smart-case --fixed-strings "$2" "$HOME/.zsh_history"
} && compdef __histsd=which && alias histsd=" __histsd"
