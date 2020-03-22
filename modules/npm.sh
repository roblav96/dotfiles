alias n="npm"
alias rr="npm run"
alias npmls="npm --silent ls --depth=0"
alias npmlsa="npm --silent ls"
alias npmo="npm outdated --long"
alias npmout="pnpx npm-check"
alias npmupg="pnpx npm-check --update"

alias snykt="pnpx snyk test --dev --all-projects" # --detection-depth=1"
alias npmi='mv package-lock.json .package-lock.json; npm install --ignore-scripts --no-bin-links --package-lock-only; snykt; rm -f package-lock.json; mv .package-lock.json package-lock.json; read -q "?npm install? [y/n]: " || return 1; npm install'

function npmin() {
	npm install "$@" && npm install -D "@types/$@"
}
function npmv() {
	npm info --json $@ | jq --color-output --tab '.time'
}

alias tsc="npx tsc"
alias vue="npx vue-cli-service"
alias vue.inspect="FORCE_COLOR=0 npx vue-cli-service inspect"
