#!/data/data/com.termux/files/usr/bin/sh

echo "█ termux-gost.sh"

if [ -x $(command -v pgrep) ]; then
	[ -x $(command -v termux-wake-lock) ] && termux-wake-lock
	[ -x $(command -v termux-api-start) ] && termux-api-start
	[ -x $(command -v gost) ] && pgrep -x gost >/dev/null || gost -L 'http://:11080?dns=1.1.1.1:53/tcp,1.1.1.1:853/tls,https://1.1.1.1/dns-query'
fi
