alias youtube-dl="youtube-dl --no-call-home"
alias yt="youtube-dl"
alias ytdl="youtube-dl --restrict-filenames"
alias ytls="youtube-dl --restrict-filenames --list-formats"

function ytsc() {
	youtube-dl --restrict-filenames --ignore-errors --output '%(uploader)s/%(uploader)s__%(title)s.%(ext)s' --add-header "$SOUNDCLOUD_OAUTH" --extract-audio --audio-format=m4a --add-metadata --embed-thumbnail "$@"
} && compdef ytsc=youtube-dl
# alias ytsc="$(echo 'youtube-dl --restrict-filenames --ignore-errors
#  --output="%(uploader)s/%(uploader)s__%(title)s.%(ext)s" --add-header="$SOUNDCLOUD_OAUTH"
#  --extract-audio --audio-format=m4a --add-metadata --embed-thumbnail
# ' | tr -d '\n')"

function ytmpv() {
	youtube-dl --output - "$*" | mpv --force-seekable=yes -
}
