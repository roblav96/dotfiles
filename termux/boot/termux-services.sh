#!/data/data/com.termux/files/usr/bin/sh
[ -x "$(which termux-wake-lock)" ] && termux-wake-lock
if [ -x "$(which pgrep)" ]; then
	[ -x "$(which sshd)" ] && pgrep -x sshd >/dev/null || sshd
	[ -x "$(which tinyproxy)" ] && pgrep -x tinyproxy >/dev/null || tinyproxy
fi
