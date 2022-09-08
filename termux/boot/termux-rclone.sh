#!/data/data/com.termux/files/usr/bin/sh

echo "█ termux-rclone.sh"

killall -v rclone || true

start-stop-daemon -S -b -p /dev/null \
	-x /data/data/com.termux/files/usr/bin/rclone -- --config /data/data/com.termux/files/home/.config/rclone/rclone.conf \
	serve dlna alldebrid: --name alldebrid --addr 0.0.0.0:13545 --read-only
start-stop-daemon -S -b -p /dev/null \
	-x /data/data/com.termux/files/usr/bin/rclone -- --config /data/data/com.termux/files/home/.config/rclone/rclone.conf \
	serve dlna premiumize: --name premiumize --addr 0.0.0.0:13709 --read-only
start-stop-daemon -S -b -p /dev/null \
	-x /data/data/com.termux/files/usr/bin/rclone -- --config /data/data/com.termux/files/home/.config/rclone/rclone.conf \
	serve dlna megadav: --name megadav --addr 0.0.0.0:13339 --read-only
start-stop-daemon -S -b -p /dev/null \
	-x /data/data/com.termux/files/usr/bin/rclone -- --config /data/data/com.termux/files/home/.config/rclone/rclone.conf \
	serve dlna WD_GRAPHITE: --name WD_GRAPHITE --addr 0.0.0.0:13460 --read-only
