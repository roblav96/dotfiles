alias rc="rclone"

function rcwd() {
	if [[ $# -ne 1 ]]; then
		echo "🔴 only 1 path allowed -> '$*'"
		return 1
	fi
	local port="$(porthash "$1")"
	local baseurl="$(basename "$1")"
	bhr
	echo "🟢 http://$(getip):$port/$baseurl/ -> $1"
	bhr
	if which pueue &>/dev/null; then
		pueue add --group=webdav rclone serve webdav "$1" --addr "0.0.0.0:$port" --baseurl "$baseurl" --read-only --config /dev/null
	else
		rclone serve webdav "$1" --addr "0.0.0.0:$port" --baseurl "$baseurl" --read-only --config /dev/null --verbose
	fi
}
