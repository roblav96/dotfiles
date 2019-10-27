alias npmls="npm -s ls --depth 0"
alias npmlsg="npm -s ls -g --depth 0"
alias npmlsa="npm -s ls"
alias npmlsag="npm -s ls -g"

function npmi() {
	npm i $@; npm i -D @types/$@
}
function npmv() {
	npm info -j $@ | json '.time'
}
