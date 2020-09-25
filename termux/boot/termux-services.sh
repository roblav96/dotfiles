#!/data/data/com.termux/files/usr/bin/sh
[ -x "$(which termux-wake-lock)" ] && termux-wake-lock
if [ -x "$(which pgrep)" ]; then
	[ -x "$(which sshd)" ] && pgrep -x sshd >/dev/null || sshd
	if [ -x "$(which tinyproxy)" ]; then
		if [ -x "$(which sed)" ]; then
			sed --in-place='' 's/^Allow/#Allow/' "$PREFIX/etc/tinyproxy/tinyproxy.conf"
		fi
		pgrep -x tinyproxy >/dev/null || tinyproxy
	fi
fi
