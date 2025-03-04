# alias rc="rclone"

function rcwd() {
	local ip="$(getip)"
	local v && for v in "$@"; do
		local base="$v"
		local remote="$v"
		if [[ -d "$remote" ]]; then
			remote="$(realpath "$remote")"
			base="$(basename "$base")"
		elif [[ ! "$remote" =~ ":" ]]; then
			remote="$remote:"
		fi
		echo rclone serve webdav "'$remote'" --baseurl "'$base'" --addr "$ip:18888" --read-only --include "'*.mp3'" --include "'*.mp4'" --include "'*.m4a'"
		# echo rclone serve webdav "'$remote'" --baseurl "'$base'" --addr "$ip:$(porthash "$remote")" --read-only
	done
}

function rcdlna() {
	local ip="$(getip)"
	local v && for v in "$@"; do
		echo rclone serve dlna "$v:" --name "$v" --addr "$ip:$(porthash "$v")" --read-only
	done
}
