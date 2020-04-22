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
		curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&ipAddress=$@" | json
	else
		curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&domain=$@" | json
	fi
}
alias ipallinfo="ipinfo; echo; echo '🌕 iplist.cc'; curl https://iplist.cc/api | json; echo; echo '🌕 ifconfig.co'; curl https://ifconfig.co/json | json '. |= del(.user_agent)'; echo; echo '🌕 ipinfo.io'; curl https://ipinfo.io | json '. |= del(.readme)'"

function dns() {
	nslookup "google.com" | head -n2
	scutil --dns | grep -A99 --color=never 'for scoped queries' | tail -n+3
}
alias dnsinfo="scutil --dns | grep -B99 --color=never 'for scoped queries' | grep --color=never '(resolver|search|domain|nameserver)'"
alias dnsinfoall="scutil --dns"
