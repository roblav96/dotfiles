alias rc="rclone"

function rcwd() {
	local v && for v in "$@"; do
		[[ ! -d "$v" ]] && continue
		local dir="$(realpath "$v")"
		local port="$(porthash "$dir")"
		local base="$(basename "$dir")"
		echo rclone serve webdav "'$dir'" --addr "$(getip):$port" --baseurl "'$base'" --read-only
		# echo && echo "🟢 http://$(getip):$port/$base/ -> $dir"
		# if which pueue &>/dev/null; then
		# 	pueue add --group=webdav -- rclone serve webdav "$dir" --addr "0.0.0.0:$port" --baseurl "$base" --read-only --config /dev/null
		# else
		# 	echo rclone serve webdav "$dir" --addr "0.0.0.0:$port" --baseurl "$base" --read-only --config /dev/null --verbose
		# fi
	done
}
