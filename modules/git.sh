alias ghb="github"

[[ -x "$(which -p hub)" ]] && alias git="hub"

# --plus-color="#A2BF8A" --minus-color="#C16069"
alias gd="git diff"
alias gss="git status --short --branch | lscolors"
alias gs="gd; echo; gss"
alias gho="gh repo view --web"
alias gbl="git branch --list --all"
alias isgit='[[ ! -d "$(git rev-parse --show-toplevel)" ]] && return 1'

alias gl="git log --reverse --max-count=5 --date=relative --stat"
alias glm="git log --reverse --max-count=10 --oneline"
alias gla="git log --reverse --max-count=3 --date=relative --patch-with-stat"

alias gsu="git standup"
# alias gd='[[ ! -d ".git" ]] && echo "🔴 Not a git repository" || (echo "🌕 git diff -> \x27$(basename $(pwd))\x27" && echo && git diff)'

alias gsw="git switch"
alias gft="git fetch --verbose"
alias gfa="git fetch --all --verbose"
alias gfo="git fetch origin --verbose"
alias gfu="git fetch upstream --verbose"
# alias gfta="git fetch --all --prune"

alias gpl="git pull"
alias gpr="git pull --rebase"
alias gpf="git pull --ff-only"
alias gmupd="git submodule update --init --recursive"

alias gi="git check-ignore --verbose **/{.,}* | sortt | lscolors"
alias gia="git check-ignore --verbose **/{.,}* --non-matching | sortt | lscolors"

alias gclean='git clean -f -f -d -x'
alias greset='git reset --hard origin/$(echo -n $(git rev-parse --abbrev-ref HEAD))'
alias gcld='gss; echo; gclean --dry-run | sed "s#^Would remove ##" | lscolors'
alias gcl='gcld; echo; read -q "?Would remove...?" && return 1; echo; gclean; greset'
alias gclf="echo 'gcld; gclean; greset'"

alias gtag='git fetch --tags && git checkout $(git describe --tags $(git rev-list --tags --max-count=1))'
alias gca='isgit; git add -A && git commit -a -m "[$(uname -o)] $(git status --null)"'
alias gpush='isgit; gs && echo && gca && git push origin $(echo -n $(git rev-parse --abbrev-ref HEAD))'

# alias gc="gh repo clone"
function gc() {
	local repo=(${@/ -*/})
	local outdir="$(basename "${repo[-1]}")"
	[[ "${outdir##*.}" == "git" ]] && outdir="${outdir:0:-4}"
	if [[ -d "$outdir" ]]; then
		read -q "?🔴 Replace existing directory '$outdir'...?" && return 1
		rd "$outdir"
	fi
	git clone "$@" && cd "$outdir"
	[[ -e ".gitmodules" ]] && gmupd
}
function greload() {
	local topdir="$(git rev-parse --show-toplevel)"
	[[ ! -d "$topdir" ]] && return 1
	local outdir="$(basename "$topdir")"
	local repo="$(git remote get-url origin)"
	cd "$(dirname "$topdir")"
	gc "$repo" "$outdir"
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
# 	# echo "🌕 snyk test ->"
# 	# pnpx snyk test --dev --all-projects --detection-depth=1
# 	# if [[ -e "package.json" ]]; then
# 	# 	cat "package.json" | jq --monochrome-output --tab '{name,version,description,main,bin,scripts,dependencies,devDependencies,homepage,repository}' | bat -ljson
# 	# 	read -q "?npm install? [y/n]: " || return 1
# 	# 	npm install
# 	# 	# --ignore-scripts --no-bin-links --no-optional
# 	# 	cat "package.json" | jq --monochrome-output --tab '{scripts}' | bat -ljson
# 	# fi
# 	# if [[ -e "requirements.txt" ]]; then
# 	# 	bat "requirements.txt" -l sh
# 	# 	read -q "?pip install? [y/n]: " || return 1
# 	# 	pip install --requirements "requirements.txt"
# 	# fi
# 	# if [[ -e "$outdir.csproj" ]]; then
# 	# 	prettier "$outdir.csproj" | bat -lxml
# 	# 	read -q "?dotnet restore? [y/n]: " || return 1
# 	# 	dotnet restore
# 	# fi
# }

# alias delta="delta --tabs=0 --highlight-removed"

# function _git-hr() {
# 	if [[ ! -d ".git" ]]; then
# 		echo "🔴 Not a git repository"
# 		return 1
# 	fi
# 	bathr; echo "🌕 git "$@" -> '"$(basename "$(pwd)")"'"; bathr; echo
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
