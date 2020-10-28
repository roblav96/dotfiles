#!/data/data/com.termux/files/usr/bin/sh

echo "🌕 termux-services.sh"

if [ -x "$PREFIX/usr/bin/pgrep" ]; then
	[ -x "$PREFIX/usr/bin/termux-wake-lock" ] && termux-wake-lock
	echo "🌕 (pgrep -xo sshd) -> '$(pgrep -xo sshd)'"
	[ -x "$PREFIX/usr/bin/sshd" ] && pgrep -xo sshd >/dev/null || sshd
	if [ -x "$PREFIX/usr/bin/tinyproxy" ]; then
		if [ -x "$PREFIX/usr/bin/sed" ]; then
			sed --in-place='' 's/^Allow/#Allow/' "$PREFIX/etc/tinyproxy/tinyproxy.conf"
		fi
		echo "🌕 (pgrep -xo tinyproxy) -> '$(pgrep -xo tinyproxy)'"
		pgrep -xo tinyproxy >/dev/null || tinyproxy -c "$PREFIX/etc/tinyproxy/tinyproxy.conf"
	fi
fi
