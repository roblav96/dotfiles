alias ffmpeg="ffmpeg -hide_banner -loglevel error"
alias ffplay="ffplay -hide_banner -loglevel error"
alias ffprobe="ffprobe -hide_banner -loglevel error"

alias fpm="ffprobe -pretty -print_format json -show_format"
alias fpj="ffprobe -pretty -print_format json -show_streams"

function fp() {
	fpj -show_format "$*" | json
}
function fpa() {
	fpj -select_streams a "$*" | json '.streams[]'
}
function fpv() {
	fpj -select_streams v "$*" | json '.streams[]'
}

function mi() {
	mediaconch -mi "$*" | sed -e 's#/String #        #' -e 's#/Info #      #' | bl yml
}

function fmp3() {
	ffmpeg -i "$*" -vn -b:a 320k "$*.mp3"
}
