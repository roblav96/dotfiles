alias rc="rclone"

function rcwd() {
	if [[ $# -ne 1 ]]; then
		echo "🔴 only 1 path allowed -> '$*'"
		return 1
	fi
	local addr="0.0.0.0:$(porthash "$1")"
	local baseurl="$(basename "$1")"
	echo && echo "🟢 'http://$addr/$baseurl/' -> '$1'" && echo
	rclone serve webdav "$1" -vv --addr "$addr" --baseurl "$baseurl" --read-only --no-modtime
}
