alias yt="youtube-dl"
alias ytdl="youtube-dl --restrict-filenames --merge-output-format mp4"
alias ytls="youtube-dl --list-formats"

function ytmpv() {
	yt --output - "$1" | mpv --force-seekable=yes -
}
