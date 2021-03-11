alias youtube-dl="youtube-dl --no-call-home"
alias yt="youtube-dl"
alias ytdl="youtube-dl --restrict-filenames"
alias ytls="youtube-dl --restrict-filenames --list-formats"

alias ytsc="$(echo 'youtube-dl --restrict-filenames --add-header "$SOUNDCLOUD_OAUTH"
 --output "%(uploader)s/%(uploader)s__%(title)s.%(ext)s"
 --add-metadata --audio-format m4a --embed-thumbnail --extract-audio --ignore-errors' | tr -d '\n')"

function ytmpv() {
	youtube-dl --output - "$*" | mpv --force-seekable=yes -
}
