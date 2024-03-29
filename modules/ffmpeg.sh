alias ffmpeg="ffmpeg -hide_banner"
alias ffplay="ffplay -hide_banner"
alias ffprobe="ffprobe -hide_banner"

function ffp() {
	ffprobe -pretty "$@" 2>&1 | bl yml
}

alias fpj="ffprobe -loglevel error -pretty -print_format json"
function fpf() {
	fpj -show_format "$@" | json '.format'
}
function fp() {
	fpj -show_format -show_streams "$@" | json 'del(.format.tags) | del(.streams[].disposition) | del(.streams[].tags)'
}
function fps() {
	fpj -show_streams "$@" | json '.streams[]'
}
function fpa() {
	fpj -show_streams -select_streams a "$@" | json '.streams[0,1]'
}
function fpv() {
	fpj -show_streams -select_streams v "$@" | json '.streams[0]'
}

function mi() {
	mediainfo "$@" | bl yml
	# mediaconch -mi "$@" | sed -e 's#/String #        #' -e 's#/Info #      #' | bl yml
}

function ffmp3() {
	local v && for v in "$@"; do
		ffmpeg -i "$v" -vn -b:a 320k "$v.mp3"
	done
}
