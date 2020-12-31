alias hist='cat $HOME/.zsh_history | sed "s/^: .*:0;//"'
alias histy='hist | tail --lines=$(ty) | sed "s/^/\n/" | bat --plain -l sh'

function __histw() {
	hist | rg --smart-case --fixed-strings --word-regexp "$*" | sed 's/^/\n/g' | bat --plain -l sh
} && compdef __histw=which && alias histw=" __histw"

function __histr() {

} && compdef __histr=which && alias histr=" __histr"

function __histsd() {

} && compdef __histsd=which && alias histsd=" __histsd"
