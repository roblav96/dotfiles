alias rc="rclone"

function rcwd() {
	local v && for v in "$@"; do
		[[ ! -d "$v" ]] && continue
		local dir="$(realpath "$v")"
		echo rclone serve webdav "'$dir'" --addr "$(getip):$(porthash "$dir")" --baseurl "'$(basename "$dir")'" --read-only
		# --local-no-check-updated --local-no-set-modtime
	done
}

alias rsy="rsync --verbose --human-readable --info=progress2 --recursive --force"

function rcdlna() {
	local v && for v in "$@"; do
		echo rclone serve dlna "$v:" --name "$v" --addr "$(getip):$(porthash "$v")" --read-only
	done
}
