alias n="npm"
alias rr="npm --silent run"
alias npmls="npm --silent ls --depth 0"
alias npmlsa="npm --silent ls"
alias npmo="npm outdated --long"

function npmi() {
	npm i $@; npm i -D @types/$@
}
function npmv() {
	npm info -j $@ | jq --indent 4 --color-output '.time'
}
