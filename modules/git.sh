alias gh='github'

# function _git-hr() {
# 	if [[ ! -d ".git" ]]; then
# 		echo "🔴 Not a git repository"
# 		return 1
# 	fi
# 	bat-hr; echo "🌕 git "$@" -> '"$(basename "$(pwd)")"'"; bat-hr; echo
# }
alias gd="git diff" # _git-hr 'diff' &&
alias gl="git log --stat --reverse --max-count=5" # _git-hr 'log' &&
alias gs="git status --short --branch" # _git-hr 'status' &&
alias gsu="git standup" # _git-hr 'standup' &&
alias gsa="gd; echo; gs"
# alias gd='[[ ! -d ".git" ]] && echo "🔴 Not a git repository" || (echo "🌕 git diff -> \x27$(basename $(pwd))\x27" && echo && git diff)'

alias gf="git fetch"
alias gfa="git fetch --all --prune"
alias gfo="git fetch origin"

alias gp="git pull"
alias gpr="git pull --rebase"

alias gi="git check-ignore --verbose"
alias gia="git check-ignore --verbose **/.* **/*"

function gc() {
	if [[ -z "$@" ]]; then
		echo "🔴 You must specify a repository to clone"
		return 1
	fi
	local outdir="${1##*/}"
	if [[ "${1##*.}" == "git" ]]; then
		outdir="${outdir:0:-4}"
	fi
	if [[ -n "$2" ]]; then
		outdir="$2"
	fi
	local url="$1"
	if [[ "${1:0:8}" == "https://" ]]; then
		url="git@${1:8}"
		url="${url/\//:}"
		if [[ "${1##*.}" != "git" ]]; then
			url="$url.git"
		fi
	fi
	git clone "$url" "$outdir" || return 1
	[[ ! -d "$outdir" ]] && return 1
	cd "$outdir"
	[[ -e "$outdir.sln" ]] && cd "$outdir"
	# echo "🌕 snyk test ->"
	# pnpx snyk test --dev --all-projects --detection-depth=1
	# if [[ -e "package.json" ]]; then
	# 	cat "package.json" | jq --monochrome-output --tab '{name,version,description,main,bin,scripts,dependencies,devDependencies,homepage,repository}' | bat -ljson
	# 	read -q "?npm install? [y/n]: " || return 1
	# 	npm install
	# 	# --ignore-scripts --no-bin-links --no-optional
	# 	cat "package.json" | jq --monochrome-output --tab '{scripts}' | bat -ljson
	# fi
	# if [[ -e "requirements.txt" ]]; then
	# 	bat "requirements.txt" -l sh
	# 	read -q "?pip install? [y/n]: " || return 1
	# 	pip install --requirements "requirements.txt"
	# fi
	# if [[ -e "$outdir.csproj" ]]; then
	# 	prettier "$outdir.csproj" | bat -lxml
	# 	read -q "?dotnet restore? [y/n]: " || return 1
	# 	dotnet restore
	# fi
}
# alias gc="git clone"
alias gcr="git clone --recursive"
# alias gcr="git clone --recurse-submodules"

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
