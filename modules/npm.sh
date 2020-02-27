alias n="npm"
alias rr="npm run"
alias npmls="npm --silent ls --depth 0"
alias npmlsa="npm --silent ls"
alias npmo="npm outdated --long"

alias snykt="snyk test --all-projects"
alias npmi='test -x "$(which -p snyk)" && snyk test --all-projects && read -q "?npm install? [y/n]: " || return 1; npm install'

function npmin() {
	npm install "$@" && npm install -D "@types/$@"
}
function npmv() {
	npm info --json $@ | json '.time'
}
