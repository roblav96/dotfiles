alias rc="rclone"

function rcwd() {
	local v && for v in "$@"; do
		[[ ! -d "$v" ]] && continue
		local port="$(porthash "$v")"
		local baseurl="$(basename "$v")"
		echo && echo "🟢 http://$(getip):$port/$baseurl/ -> $v"
		if which pueue &>/dev/null; then
			pueue add --group=webdav -- rclone serve webdav "$v" --addr "0.0.0.0:$port" --baseurl "$baseurl" --read-only --config /dev/null
		else
			echo rclone serve webdav "$v" --addr "0.0.0.0:$port" --baseurl "$baseurl" --read-only --config /dev/null --verbose
		fi
	done
}
