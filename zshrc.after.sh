#!/usr/bin/env zsh

function collisions() {
	local key && for key in ${(k)aliases}; do
		echo "🟡 alias -> '$key'"
		if [[ " ${commands[@]} " =~ " $key " ]]; then
			echo "🔴 collision -> '$key'"
		fi
	done
	# local command && for command in "${commands[@]}"; do
	# 	command="$(echo "${command##*/}")"
	# 	echo "🟡 command -> '$command'"
	# done
}
