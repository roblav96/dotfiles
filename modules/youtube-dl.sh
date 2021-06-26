alias yt="youtube-dl"
alias ytls="youtube-dl --list-formats"

alias ytsc='youtube-dl --output="%(uploader)s/%(uploader)s__%(webpage_url_basename)s__%(upload_date)s_.%(ext)s" --add-header="$SOUNDCLOUD_OAUTH" --extract-audio --add-metadata --embed-thumbnail'
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
