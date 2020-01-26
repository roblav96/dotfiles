export ZSH_SPECTRUM_TEXT="$(uname -a | head -c 50)"

alias colorls="spectrum_ls | head -n 17"
alias colorls-bg="spectrum_bls | head -n 17"
alias colorls-spectrum="spectrum_ls"
alias colorls-spectrum-bg="spectrum_bls"

# alias color-FG="echo '$FG'"
# alias color-BG="echo '$BG'"
# alias color-FX="echo '$FX'"
# alias color-color="echo '$color'"

function color-clr() {
	local OUTPUT="$(echo $1 | head -c -5)"
	color-tool create-clr $1 $HOME/Downloads/$OUTPUT.clr
}
