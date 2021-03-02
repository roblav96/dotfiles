alias ffmpeg="ffmpeg -hide_banner" # -loglevel error"
alias ffplay="ffplay -hide_banner" # -loglevel error"
alias ffprobe="ffprobe -hide_banner" # -loglevel error"

alias fpj="ffprobe -loglevel error -pretty -print_format json"

function fpf() {
	fpj -show_format "$*" | json '.format'
}
function fp() {
	fpj -show_format -show_streams "$*" | json
}
function fps() {
	fpj -show_streams "$*" | json '.streams[]'
}
function fpa() {
	fpj -show_streams -select_streams a "$*" | json '.streams[0,1]'
}
function fpv() {
	fpj -show_streams -select_streams v "$*" | json '.streams[0]'
}

function mi() {
	mediaconch -mi "$*" | sed -e 's#/String #        #' -e 's#/Info #      #' | bl yml
}

function fmp3() {
	ffmpeg -i "$*" -vn -b:a 320k "$*.mp3"
}
