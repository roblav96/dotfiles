alias htop="htop --delay=5"
alias htopcpu="htop --sort-key=PERCENT_CPU"
alias htopstart="htop --sort-key=STARTTIME"
alias htoptime="htop --sort-key=TIME"

alias procs="procs --color always --pager disable --sorta Start"
# test -x "$(which -p procs)" && alias procs="sudo procs"
