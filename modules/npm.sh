alias n="npm --silent"
alias rr="npm --silent run"
alias npmls="npm --silent ls --depth 0"
alias npmlsg="npm --silent ls --global --depth 0"
alias npmlsa="npm --silent ls"
alias npmlsag="npm --silent ls --global"

function npmi() {
	npm i $@; npm i -D @types/$@
}
function npmv() {
	npm info -j $@ | jq --indent 4 --color-output '.time'
}
