alias youtube-dl="youtube-dl --no-call-home"
alias yt="youtube-dl"
alias ytdl="youtube-dl --restrict-filenames"
alias ytls="youtube-dl --restrict-filenames --list-formats"

function ytmpv() {
	youtube-dl --output - "$*" | mpv --force-seekable=yes -
}
