export ZSH_SPECTRUM_TEXT="$(uname -a | head -c 49)"

alias color-spectrum="spectrum_ls | head -n 16"
alias color-spectrum-bg="spectrum_bls | head -n 16"
alias color-spectrum-ls="spectrum_ls"
alias color-spectrum-bls="spectrum_bls"

alias color-FG="echo '$FG'"
alias color-BG="echo '$BG'"
alias color-FX="echo '$FX'"
alias color-color="echo '$color'"

function .color-clr() {
	local OUTPUT="$(echo $1 | head -c -5)"
	color-tool create-clr $1 ~/Downloads/$OUTPUT.clr
}
