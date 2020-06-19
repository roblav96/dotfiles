export ZSH_SPECTRUM_TEXT="	$(uname -a | head -c 49)	"

alias colorls="spectrum_ls | head -n 16"
alias colorls-bg="spectrum_bls | head -n 16"
alias colorls-spectrum="spectrum_ls"
alias colorls-spectrum-bg="spectrum_bls"
alias colorls-codes="echo '
  1	bold/bright
  2	dim
  3	italic
  4	underline
  5	blink
  6	reverse
  7	hidden

 30	black
 31	red
 32	green
 33	yellow
 34	blue
 35	magenta
 36	cyan
 37	white
'"

# alias color-FG="echo '$FG'"
# alias color-BG="echo '$BG'"
# alias color-FX="echo '$FX'"
# alias color-color="echo '$color'"

function color-clr() {
	local OUTPUT="$(echo $1 | head -c -5)"
	color-tool create-clr $1 $HOME/Downloads/$OUTPUT.clr
}

function truecolor() {
	awk 'BEGIN{
	    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
	    for (colnum = 0; colnum<77; colnum++) {
	        r = 255-(colnum*255/76);
	        g = (colnum*510/76);
	        b = (colnum*255/76);
	        if (g>255) g = 510-g;
	        printf "\033[48;2;%d;%d;%dm", r,g,b;
	        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
	        printf "%s\033[0m", substr(s,colnum+1,1);
	    }
	    printf "\n";
	}'
}
