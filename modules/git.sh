alias gh="github"

alias gd="git diff"
alias gl="git log --reverse --max-count=5"
alias gs="git status --short --branch"
alias gsh="git show --reverse --max-count=5 --stat"
alias gsu="git standup"

alias gf="git fetch"
alias gfa="git fetch --all --prune"
alias gfo="git fetch origin"

alias gp="git pull"
alias gpr="git pull --rebase"

alias gi="git check-ignore --verbose"
alias gia="git check-ignore --verbose **/.* **/*"

# alias gc="git clone"
# alias gcr="git clone --recurse-submodules"
function gc() {
	local repo="${1##*/}"
	local url="${1/https:\/\/github.com\//git@github.com:}.git"
	if [[ ${repo##*.} == "git" ]]; then
		repo=${repo:0:-4}
		url=${url:0:-4}
	fi
	git clone "$url" && cd "$repo" || return 1
	test -e "package.json" && npm install --ignore-scripts --no-bin-links --no-optional && echo && npm run-script
	test -e "requirements.txt" && pip install -r "requirements.txt"
	test -d "$repo" && cd "$repo" && dotnet restore
}

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
