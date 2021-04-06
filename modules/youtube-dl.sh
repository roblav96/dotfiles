alias yt="youtube-dl"
alias ytls="youtube-dl --list-formats"

alias sc='youtube-dl --output="%(uploader)s/%(uploader)s__%(title)s.%(ext)s" --add-header="$SOUNDCLOUD_OAUTH" --extract-audio --audio-format=m4a --add-metadata --embed-thumbnail'
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
