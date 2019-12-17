alias gc="git clone --recurse-submodules"
alias gd="git diff"
alias gf="git fetch"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gs="git status --short --branch"
alias gsh="git show"
alias gsu="git standup"

# if [[ -x "$(which -p delta)" ]]; then
# 	git config --global pager.diff "BAT_PAGER=cat delta --theme=none --light"
# 	git config --global core.pager "BAT_PAGER=cat delta --theme=none --light"
# el
# if [[ -x "$(which -p git-icdiff)" ]]; then
# 	git config --global core.pager "git-icdiff"
# 	git config --global pager.diff "git-icdiff"
# el
if [[ -x "$(which -p diff-so-fancy)" ]]; then
	git config --global core.pager "diff-so-fancy"
	git config --global pager.diff "diff-so-fancy"
else
	git config --global core.pager ""
	git config --global pager.diff ""
fi
