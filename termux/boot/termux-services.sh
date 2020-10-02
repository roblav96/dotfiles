#!/data/data/com.termux/files/usr/bin/sh

if [ -x "$(which pgrep)" ]; then
	[ -x "$(which termux-wake-lock)" ] && termux-wake-lock
	[ -x "$(which sshd)" ] && pgrep -xo sshd >/dev/null || sshd
	if [ -x "$(which tinyproxy)" ]; then
		if [ -x "$(which sed)" ]; then
			sed --in-place='' 's/^Allow/#Allow/' "$PREFIX/etc/tinyproxy/tinyproxy.conf"
		fi
		pgrep -xo tinyproxy >/dev/null || tinyproxy -c "$PREFIX/etc/tinyproxy/tinyproxy.conf"
	fi
fi
