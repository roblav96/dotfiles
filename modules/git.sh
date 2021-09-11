# export GIT_PAGER="$PAGER"
[[ -x "$(which -p gh)" ]] && export GH_NO_UPDATE_NOTIFIER="1"
[[ -x "$(which -p gh)" ]] && export GH_PAGER="cat"
[[ -x "$(which -p git-restore-mtime)" ]] && alias gmt='isgit; git-restore-mtime --force'
[[ -x "$(which -p hub)" ]] && alias git="hub"

alias ghb="github"
# alias gho='isgit; open "$(gurl)"'
alias gho="gh repo view --web"
alias gurl="git remote get-url origin"
alias groot="git rev-parse --show-toplevel"
alias gbranch='echo -n $(git branch --show-current)'

alias isgit='[[ ! -d "$(git rev-parse --show-toplevel)" ]] && return 1'

# --plus-color="#A2BF8A" --minus-color="#C16069"
alias gd="git diff"
alias gss="git status --short --branch | lscolors"
alias gs="isgit; gd; echo; gss"
alias gbls="git branch --list --all --sort=committerdate"

alias gl='echo; git log --reverse --date=relative --stat --max-count=10'
alias gl1='gl --max-count=1'
alias gla='echo; git log --reverse --date=relative --patch-with-stat --max-count=5'
alias gla1='gla --max-count=1'

alias gsu="git standup"
# alias gd='[[ ! -d ".git" ]] && echo "🔴 Not a git repository" || (echo "🟡 git diff -> \x27$(basename $(pwd))\x27" && echo && git diff)'

alias gsw="git switch"
alias gft="git fetch"
alias gfa="git fetch --all"
alias gfo="git fetch origin"
alias gfu="git fetch upstream"
# alias gfta="git fetch --all --prune"

alias gpr="gfa && git pull --rebase --recurse-submodules"
alias gpf="gfa && git pull --ff-only --recurse-submodules"

alias gtls="git tag -n --list --sort=committerdate"
alias gtf="git tag --contains"
alias gti="git show --stat"
alias gtsw='git checkout $(git describe --tags $(git rev-list --tags --max-count=1))'

alias glf="git ls-files | sortt | lscolors"
alias gi="git check-ignore --verbose **/{.,}* | sortt | lscolors"
alias gia="git check-ignore --verbose **/{.,}* --non-matching | sortt | lscolors"

alias gclean='git clean -f -f -d -x'
alias greset='git reset --hard'
alias gcld='echo; gss; echo; gclean --dry-run | sed "s#^Would remove ##" | lscolors'
alias gcl='gcld; echo; read -s -q "?🔴 Would remove ? " || return; echo; echo; gclean; greset'
alias gclf="echo 'gcld; gclean; greset'"

alias gca='isgit; git add -A && git commit -a -m "[$(uname -o)] $(git status --null)"'
alias gpush='isgit; gs; echo; read -s -q "?🟠 git push origin $(basename --suffix=.git $(gurl)) ? " || return; echo; echo; gca && git push origin $(gbranch)'

function gup() {
	local v && for v in */.git; do (
		bhr
		local repo="$(dirname "$v")"
		cd "$repo"
		echo "🟡 $repo" && echo -n "   "
		gurl
		gss
		greset
		gpf
		if [[ -x "$(which -p git-restore-mtime)" ]]; then
			git-restore-mtime --force --quiet
		fi
	); done
	bhr
}

# alias gc="gh repo clone"
function gc() {
	local repo=(${@/ -*/})
	local outdir="$(basename "${repo[-1]}")"
	[[ "${outdir##*.}" == "git" ]] && outdir="${outdir:0:-4}"
	if [[ -d "$outdir" ]]; then
		read -s -q "?🔴 Replace existing folder '$outdir' ? " || return
		echo && echo
		rd "$outdir"
	fi
	git clone --recurse-submodules "$@" && cd "$outdir"
	if [[ -e gradlew ]]; then
		fd --type=file --glob gradlew --exec-batch chmod -v -c a+x
	fi
	if [[ -x "$(which -p git-restore-mtime)" ]]; then
		git-restore-mtime --force --quiet
	fi
}
function greload() {
	local topdir="$(git rev-parse --show-toplevel)"
	[[ ! -d "$topdir" ]] && return 1
	local outdir="$(basename "$topdir")"
	local repo="$(git remote get-url origin)"
	local branch="$(git branch --show-current)"
	cd "$(dirname "$topdir")"
	gc -b "$branch" "$repo" "$outdir"
}
# alias greload='cd "$(dirname "$(git rev-parse --show-toplevel)")"'
# alias gcr="gc --recurse-submodules"
# alias gc="git clone"
# alias gcr="git clone --recurse-submodules"

# function gc() {
# 	if [[ -z "$@" ]]; then
# 		echo "🔴 You must specify a repository to clone"
# 		return 1
# 	fi
# 	local outdir="${1##*/}"
# 	if [[ "${1##*.}" == "git" ]]; then
# 		outdir="${outdir:0:-4}"
# 	fi
# 	if [[ -n "$2" ]]; then
# 		outdir="$2"
# 	fi
# 	local url="$1"
# 	if [[ "${1:0:8}" == "https://" ]]; then
# 		url="git@${1:8}"
# 		url="${url/\//:}"
# 		if [[ "${1##*.}" != "git" ]]; then
# 			url="$url.git"
# 		fi
# 	fi
# 	git clone "$url" "$outdir" || return 1
# 	[[ ! -d "$outdir" ]] && return 1
# 	cd "$outdir"
# 	[[ -e "$outdir.sln" ]] && cd "$outdir"
# 	# echo "🟡 snyk test ->"
# 	# npx snyk test --dev --all-projects --detection-depth=1
# 	# if [[ -e "package.json" ]]; then
# 	# 	cat "package.json" | jq --monochrome-output --tab '{name,version,description,main,bin,scripts,dependencies,devDependencies,homepage,repository}' | bat -l json
# 	# 	read -s -q "?npm install? [y/n]: " || return 1
# 	# 	npm install
# 	# 	# --ignore-scripts --no-bin-links --no-optional
# 	# 	cat "package.json" | jq --monochrome-output --tab '{scripts}' | bat -l json
# 	# fi
# 	# if [[ -e "requirements.txt" ]]; then
# 	# 	bat "requirements.txt" -l sh
# 	# 	read -s -q "?pip install? [y/n]: " || return 1
# 	# 	pip install --requirements "requirements.txt"
# 	# fi
# 	# if [[ -e "$outdir.csproj" ]]; then
# 	# 	prettier "$outdir.csproj" | bat -l xml
# 	# 	read -s -q "?dotnet restore? [y/n]: " || return 1
# 	# 	dotnet restore
# 	# fi
# }

# function _git-hr() {
# 	if [[ ! -d ".git" ]]; then
# 		echo "🔴 Not a git repository"
# 		return 1
# 	fi
# 	bathr; echo "🟡 git "$@" -> '"$(basename "$(pwd)")"'"; bathr; echo
# }

# if [[ -x "$(which -p delta)" ]]; then
# 	git config --global pager.diff "BAT_PAGER=cat delta --theme=none --light"
# 	git config --global core.pager "BAT_PAGER=cat delta --theme=none --light"
# el
# if [[ -x "$(which -p git-icdiff)" ]]; then
# 	git config --global core.pager "git-icdiff"
# 	git config --global pager.diff "git-icdiff"
# el

# if [[ -x "$(which -p diff-so-fancy)" ]]; then
# 	git config --global core.pager "diff-so-fancy"
# 	git config --global pager.diff "diff-so-fancy"
# else
# 	git config --global core.pager ""
# 	git config --global pager.diff ""
# fi
