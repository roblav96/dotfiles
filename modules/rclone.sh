alias rc="rclone"

function rcwd() {
	local v && for v in "$@"; do
		[[ ! -d "$v" ]] && continue
		local dir="$(realpath "$v")"
		local port="$(porthash "$dir")"
		local base="$(basename "$dir")"
		echo rclone serve webdav "$dir" --addr "$(getip):$port" --baseurl "$base" --read-only --verbose
	done
}
