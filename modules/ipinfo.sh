function ipinfo() {
	if [[ -z "$@" ]]; then
		echo && echo -n '🌕 icanhazip.com -> '; curl "https://icanhazip.com"; echo
		echo -n '🌕 api6.ipify.org -> '; curl "https://api6.ipify.org"; echo && echo
		if [[ -n "$_IPIFY_API_KEY" ]]; then
			echo "🌕 geo.ipify.org"
			curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY" | json
		else
			echo "🌕 ipinfo.io"
			curl "https://ipinfo.io" | json '. |= del(.readme)'
		fi
	elif [[ "$@" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		if [[ -z "$_IPIFY_API_KEY" ]]; then
			curl "https://ipinfo.io/$@" | json '. |= del(.readme)'
		else
			curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&ipAddress=$@" | json
		fi
	else
		curl "https://geo.ipify.org/api/v1?apiKey=$_IPIFY_API_KEY&domain=$@" | json
	fi
}

alias ipallinfo='
ipinfo;
echo;
echo "🌕 iplist.cc";
curl https://iplist.cc/api | json;
echo;
echo "🌕 ifconfig.co";
curl https://ifconfig.co/json | json ". |= del(.user_agent)";
echo;
echo "🌕 ipinfo.io";
curl https://ipinfo.io | json ". |= del(.readme)"
'

function dnsinfo() {
	if [[ "$PLATFORM" == "Darwin" ]]; then
		echo && echo "🌕 networksetup -getdnsservers"
		networksetup -getdnsservers 'Wi-Fi' | bat --plain -l yml
		echo && echo "🌕 scutil --dns"
		scutil --dns | rg -B99 --fixed-strings 'for scoped queries' | rg --regexp='(resolver|search|domain|nameserver)' | bat --plain -l yml
	fi
	local domain="${1:-google.com}"
	echo && echo "🌕 nslookup -all $domain"
	nslookup -all -timeout=1 "$domain" | bat --plain -l yml
}
