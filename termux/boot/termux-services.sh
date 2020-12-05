#!/data/data/com.termux/files/usr/bin/sh

echo "█ termux-services.sh"

if [ -x "$PREFIX/bin/pgrep" ]; then
	[ -x "$PREFIX/bin/termux-wake-lock" ] && termux-wake-lock
	echo "█ (pgrep -x sshd) -> '$(pgrep -x sshd)'"
	[ -x "$PREFIX/bin/sshd" ] && pgrep -x sshd >/dev/null || sshd
	if [ -x "$PREFIX/bin/tinyproxy" ]; then
		if [ -x "$PREFIX/bin/sed" ]; then
			sed --in-place='' 's/^Allow/#Allow/' "$PREFIX/etc/tinyproxy/tinyproxy.conf"
			# sed --in-place='' -c 's/^Allow/#Allow/' -c 's/Servers \d+$/Servers 1/' "$PREFIX/etc/tinyproxy/tinyproxy.conf"
		fi
		echo "█ (pgrep -x tinyproxy) -> '$(pgrep -x tinyproxy)'"
		pgrep -x tinyproxy >/dev/null || tinyproxy -c "$PREFIX/etc/tinyproxy/tinyproxy.conf"
	fi
fi
