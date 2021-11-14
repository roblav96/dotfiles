alias ffmpeg="ffmpeg -hide_banner" # -loglevel fatal"
alias ffplay="ffplay -hide_banner" # -loglevel fatal"
alias ffprobe="ffprobe -hide_banner" # -loglevel fatal"

alias fpj="ffprobe -loglevel fatal -pretty -print_format json"

function fpf() {
	fpj -show_format "$*" | json '.format'
}
function fp() {
	fpj -show_format -show_streams "$*" | json 'del(.streams[].disposition) | del(.streams[].tags)'
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
	mediainfo "$*" | bl yml
	# mediaconch -mi "$*" | sed -e 's#/String #        #' -e 's#/Info #      #' | bl yml
}

function fmp3() {
	ffmpeg -i "$*" -vn -b:a 320k "$*.mp3"
}
