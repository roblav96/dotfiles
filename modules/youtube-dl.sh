alias youtube-dl="youtube-dl --no-call-home"
alias yt-dlp="yt-dlp --no-call-home"

alias yt="yt-dlp"
alias ytls="yt-dlp --list-formats"
alias ytsc='yt-dlp --output="%(uploader)s/%(uploader)s__%(title)s.%(ext)s" --add-header="$SOUNDCLOUD_OAUTH" --extract-audio --add-metadata --embed-thumbnail'
# --audio-format=m4a

# function sc() {
# 	youtube-dl --ignore-errors \
# 		--output '%(uploader)s/%(uploader)s__%(title)s.%(ext)s' --add-header "$SOUNDCLOUD_OAUTH" \
# 		--extract-audio --audio-format=m4a --add-metadata --embed-thumbnail \
# 		"$@"
# } && compdef ytsc=youtube-dl
# alias sc="$(echo 'youtube-dl --restrict-filenames --ignore-errors
#  --output="%(uploader)s/%(uploader)s__%(title)s.%(ext)s" --add-header="$SOUNDCLOUD_OAUTH"
#  --extract-audio --audio-format=m4a --add-metadata --embed-thumbnail
# ' | tr -d '\n')"

function ytmpv() {
	youtube-dl --output - "$*" | mpv --force-seekable=yes -
}
