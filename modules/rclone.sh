alias rc="rclone"

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
		echo rclone serve webdav "'$remote'" --baseurl "'$base'" --addr "$ip:$(porthash "$remote")" --read-only
	done
}

alias rsy="rsync --verbose --human-readable --info=progress2 --recursive --force"

function rcdlna() {
	local v && for v in "$@"; do
		echo rclone serve dlna "$v:" --name "$v" --addr "$(getip):$(porthash "$v")" --read-only
	done
}
function rctmpdlna() {
	local v && for v in "$@"; do
		echo /data/local/tmp/bin/rclone --config /data/local/tmp/rclone.conf serve dlna "$v:" --name "$v" --addr "$(getip):$(porthash "$v")" --read-only
	done
}
