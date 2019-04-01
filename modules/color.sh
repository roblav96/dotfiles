export ZSH_SPECTRUM_TEXT="$(uname -a | head -c49)"

alias ,color-spectrum="spectrum_ls | head -n16"
alias ,color-spectrum_bg="spectrum_bls | head -n16"
alias ,color-spectrum_ls="spectrum_ls"
alias ,color-spectrum_bls="spectrum_bls"

alias ,color-FG="echo '$FG'"
alias ,color-BG="echo '$BG'"
alias ,color-FX="echo '$FX'"
alias ,color-color="echo '$color'"

function ,color-tool() {
	color-tool create-clr $@ ~/Downloads/$@.clr
}
