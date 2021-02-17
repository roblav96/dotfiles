which rc &>/dev/null || alias rc="rclone"

function rcwd() {
	local v && for v in "$@"; do
		[[ ! -d "$v" ]] && continue
		local dir="$(realpath "$v")"
		local port="$(porthash "$dir")"
		local base="$(basename "$dir")"
		echo rclone serve webdav "$dir" --addr "$(getip):$port" --baseurl "$base" --poll-interval 0 --read-only
	done
}

alias rsy="rsync --verbose --human-readable --info=progress2 --recursive --force"
