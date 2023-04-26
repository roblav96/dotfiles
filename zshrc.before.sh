#!/usr/bin/env zsh

# declare DOTBENCH="$(date +%s%3N)"

alias sudo="sudo "
alias xargs="xargs "
# alias rargs="rargs "
# alias just="just "
# alias pueue="pueue "

if [[ -z "$HOMEBREW_PREFIX" && -x "$(which -p brew)" ]]; then
	export HOMEBREW_PREFIX="$(brew --prefix)"
fi
