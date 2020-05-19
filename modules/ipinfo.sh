function ipinfo() {
	if [[ -z "$@" ]]; then
		echo
		echo -n '🌕 icanhazip.com -> '; curl "https://icanhazip.com"; echo
		echo -n '🌕 api6.ipify.org -> '; curl "https://api6.ipify.org"; echo
		echo
		if [[ -z "$_IPIFY_API_KEY" ]]; then
			echo "🌕 ipinfo.io"
			curl "https://ipinfo.io" | json '. |= del(.readme)'
		else
			echo "🌕 geo.ipify.org"
			curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY" | json
		fi
	elif [[ $@ =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		if [[ -z "$_IPIFY_API_KEY" ]]; then
			curl "https://ipinfo.io/$@" | json '. |= del(.readme)'
		else
			curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&ipAddress=$@" | json
		fi
	else
		curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&domain=$@" | json
	fi
}
alias ipallinfo="ipinfo; echo; echo '🌕 iplist.cc'; curl https://iplist.cc/api | json; echo; echo '🌕 ifconfig.co'; curl https://ifconfig.co/json | json '. |= del(.user_agent)'; echo; echo '🌕 ipinfo.io'; curl https://ipinfo.io | json '. |= del(.readme)'"

function dnsinfo() {
	local domain="${1:-google.com}"
	echo; echo "🌕 nslookup -all $domain"
	nslookup -all -timeout=1 "$domain"
	if [[ "$PLATFORM" == "Darwin" ]]; then
		echo "🌕 networksetup -getdnsservers"
		networksetup -getdnsservers 'Wi-Fi'
		echo; echo "🌕 scutil --dns"
		scutil --dns | grep -B99 --color=never 'for scoped queries' | grep --color=never '(resolver|search|domain|nameserver)'
	fi
}
