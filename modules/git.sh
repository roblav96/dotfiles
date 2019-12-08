alias gc="git clone --recurse-submodules"
alias gd="git diff"
alias gf="git fetch"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gs="git status --short --branch"
alias gsu="git standup"

if [[ -x "$(command -v diff-so-fancy)" ]]; then
	git config --global pager.diff "diff-so-fancy"
fi
