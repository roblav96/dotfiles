
adbfi() {
	case $1 in
		on) setprop service.adb.tcp.port 5555
			su -c stop adbd
			su -c start adbd
			echo "ADB over WiFi enabled";;
		off) setprop service.adb.tcp.port -1
			su -c stop adbd
			su -c start adbd
			echo "ADB over WiFi disabled";;
		status) case `getprop service.adb.tcp.port` in -1) echo "off";; 5555) echo "on";; *) echo "off";; esac;;
		*) echo "Usage: adbfi [option]"
			echo " "
			echo "Options:"
			echo " on    - Enables ADB over Wifi"
			echo " off   - Disables ADB over WiFi"
			echo " status - Gets current status";;
	esac
}
