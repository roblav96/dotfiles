alias youtube-dl="youtube-dl --no-call-home"
alias yt="youtube-dl"
alias ytdl="youtube-dl --restrict-filenames --merge-output-format mp4"
alias ytls="youtube-dl --restrict-filenames --merge-output-format mp4 --list-formats"

function ytmpv() {
	youtube-dl --output - "$*" | mpv --force-seekable=yes -
}
