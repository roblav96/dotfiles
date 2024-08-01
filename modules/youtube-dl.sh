alias youtube-dl="youtube-dl --no-call-home"

alias yt="yt-dlp"
alias ytp=" pueue add -- yt-dlp"
alias ytls="yt --list-formats"

alias sc='yt --output="%(uploader)s/%(uploader)s__%(title)s.%(ext)s" --add-header="$SOUNDCLOUD_OAUTH" --extract-audio'

function ytmpv() {
	yt --output - "$*" | mpv --msg-module --msg-level=all=status --force-seekable=yes -
}
