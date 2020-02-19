function ipinfo() {
	echo
	if [[ $# -eq 0 ]]; then
		curl "https://icanhazip.com"
		curl "https://api6.ipify.org"
		echo; echo
		if [[ -z "$_IPIFY_API_KEY" ]]; then
			curl "https://ipinfo.io" | json '. |= del(.readme)'
		else
			curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY" | json
		fi
	elif [[ $@ =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&ipAddress=$@" | json
	else
		curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&domain=$@" | json
	fi
}

alias ipallinfo="echo; echo 🌕 icanhazip.com; curl https://icanhazip.com; echo; echo 🌕 api6.ipify.org; curl https://api6.ipify.org; echo; echo; echo 🌕 iplist.cc; curl https://iplist.cc/api | json; echo; echo 🌕 ifconfig.co; curl https://ifconfig.co/json | json '. |= del(.user_agent)'; echo; echo 🌕 ipinfo.io; curl https://ipinfo.io | json '. |= del(.readme)'"
