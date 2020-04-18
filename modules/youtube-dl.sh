alias yt="youtube-dl"
alias ytdl="youtube-dl --merge-output-format mp4 --restrict-filenames"
alias ytls="youtube-dl --merge-output-format mp4 --list-formats"

function ytmpv() {
	youtube-dl --output - "$1" | mpv --force-seekable=yes -
}
