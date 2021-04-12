alias jk="joker"
alias jkk=" joker kill"
alias jkls="joker list"

function jktf() {
	tf "$HOME/.joker/$@"
}

function jkal() {
	joker "$(echo $aliases[$1])" "${@:2}"
}
