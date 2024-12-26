alias youtube-dl="youtube-dl --no-call-home"

# alias yt="yt-dlp --format-sort=ext,proto,height:480"
alias yt="yt-dlp --format-sort=ext,proto,height:1920"
alias ytls="yt --list-formats"

alias .yt=" yt-dlp --format-sort=ext,proto,height:1920"
alias ytp=" pueue add -- yt-dlp --format-sort=ext,proto,height:1920"

alias sc='yt-dlp --output="%(uploader)s/%(uploader)s__%(title)s.%(ext)s" --add-header="$SOUNDCLOUD_OAUTH" --extract-audio'

function ytmpv() {
	yt --output - "$*" | mpv --msg-module --msg-level=all=status --force-seekable=yes -
}
