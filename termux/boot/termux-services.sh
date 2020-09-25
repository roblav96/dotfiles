#!/data/data/com.termux/files/usr/bin/sh
[ -x "$(which termux-wake-lock)" ] && termux-wake-lock
if [ -x "$(which pgrep)" ]; then
	[ -x "$(which sshd)" ] && pgrep -x sshd || sshd
	[ -x "$(which tinyproxy)" ] && pgrep -x tinyproxy || tinyproxy
fi
