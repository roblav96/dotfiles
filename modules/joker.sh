alias jk="joker"
alias jkk=" joker stop"
alias jkl=" joker log"
alias jkls="joker list"

function jktf() {
	tf "$HOME/.joker/$@"
}

function jkal() {
	joker "$(echo $aliases[$1])" "${@:2}"
}
