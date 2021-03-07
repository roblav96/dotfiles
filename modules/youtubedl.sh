alias youtube-dl="youtube-dl --no-call-home"
alias yt="youtube-dl"
alias ytdl="youtube-dl --restrict-filenames"
alias ytls="youtube-dl --restrict-filenames --list-formats"

alias ytsc='youtube-dl --restrict-filenames --config-location $DOTFILES/configs/youtube-dl/soundcloud.com.conf --add-header "$SOUNDCLOUD_OAUTH"'

function ytmpv() {
	youtube-dl --output - "$*" | mpv --force-seekable=yes -
}
