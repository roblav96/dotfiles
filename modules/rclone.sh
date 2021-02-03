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
	rclone serve webdav "$1" --verbose --addr "0.0.0.0:$port" --baseurl "$baseurl" --read-only --config /dev/null
}
