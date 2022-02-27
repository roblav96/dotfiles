function ipinfo() {
	if [[ -z "$@" ]]; then
		echo && echo -n '🟡 icanhazip.com -> ' && curl "https://icanhazip.com" && echo
		echo -n '🟡 api6.ipify.org -> ' && curl "https://api6.ipify.org" && echo && echo
		# if [[ -n "$IPIFY_API_KEY" ]]; then
		# 	echo "🟡 geo.ipify.org"
		# 	curl "https://geo.ipify.org/api/v1?apiKey=$IPIFY_API_KEY" | json
		# else
		echo "🟡 ipinfo.io"
		curl "https://ipinfo.io" | json '. |= del(.readme)'
		# fi
	elif [[ "$@" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		if [[ -z "$IPIFY_API_KEY" ]]; then
			curl "https://ipinfo.io/$@" | json '. |= del(.readme)'
		else
			curl "https://geo.ipify.org/api/v1?apiKey=$IPIFY_API_KEY&ipAddress=$@" | json
		fi
	else
		curl "https://geo.ipify.org/api/v1?apiKey=$IPIFY_API_KEY&domain=$@" | json
	fi
}

function ipallinfo() {
	ipinfo
	echo && echo "🟡 iplist.cc"
	curl "https://iplist.cc/api" | json
	echo && echo "🟡 ifconfig.co"
	curl "https://ifconfig.co/json" | json '. |= del(.user_agent)'
	echo && echo "🟡 ipinfo.io"
	curl "https://ipinfo.io" | json '. |= del(.readme)'
}

function dns() {
	if [[ "$PLATFORM" == "Darwin" ]]; then
		networksetup -getdnsservers 'Wi-Fi' | bat --file-name='networksetup -getdnsservers' -l yml
		scutil --dns | rg -B99 --fixed-strings 'for scoped queries' | rg --regexp='(resolver|search|domain|nameserver)' | bat --file-name='scutil --dns' -l yml
	fi
	local domain="${1:-google.com}"
	nslookup -all -timeout=1 "$domain" | bat --file-name='nslookup -all $domain' -l yml
}

unalias getip &>/dev/null
alias getip="node -p 'Object.values(os.networkInterfaces()).flat().filter(v => v.internal == false && v.family == \"IPv4\" && v.mac != \"00:00:00:00:00:00\" && v.netmask == \"255.255.255.0\")[0].address'"
# alias getrouter="ipconfig getoption en0 router"
alias getrouter="networksetup -getinfo Wi-Fi | rg --color=never -e 'Router: (.*)' -or '\$1'"
# alias getrouter="networksetup -getinfo Wi-Fi | awk '/Router: / { print \$2 }'"

function porthash() {
	node --print "
		let value = '$(realpath "${1:-"$PWD"}")'
		let [hash, i, char] = [0, 0, 0]
		for (i = 0; i < value.length; i++) {
			char = value.charCodeAt(i)
			hash = (hash << 1) - hash + char
			hash |= 0
		}
		Math.min(Math.abs(hash) + 10000, 65535)
	"
}
