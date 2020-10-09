#!/data/data/com.termux/files/usr/bin/sh

echo "🌕 termux-services.sh"

if [[ -x "$(which pgrep)" ]]; then
	[[ -x "$(which termux-wake-lock)" ]] && termux-wake-lock
	echo "🌕 (pgrep -xo sshd) -> '$(pgrep -xo sshd)'"
	[[ -x "$(which sshd)" ]] && pgrep -xo sshd >/dev/null || sshd
	if [[ -x "$(which tinyproxy)" ]]; then
		if [[ -x "$(which sed)" ]]; then
			sed --in-place='' 's/^Allow/#Allow/' "$PREFIX/etc/tinyproxy/tinyproxy.conf"
		fi
		echo "🌕 (pgrep -xo tinyproxy) -> '$(pgrep -xo tinyproxy)'"
		pgrep -xo tinyproxy >/dev/null || tinyproxy -c "$PREFIX/etc/tinyproxy/tinyproxy.conf"
	fi
fi
