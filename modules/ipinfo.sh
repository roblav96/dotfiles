function ipinfo() {
	if [[ $# -eq 0 ]]; then
		echo
		echo -n '🟡 icanhazip.com -> ' && curl "https://icanhazip.com"
		echo
		echo -n '🟡 api6.ipify.org -> ' && curl "https://api6.ipify.org"
		echo
		echo '🟡 ip-api.com ->'
		curl "http://ip-api.com/json" | json
	else
		curl "http://ip-api.com/json/$@" | json
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
	echo && echo "🟡 ip-api.com"
	curl "http://ip-api.com/json" | json
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
alias getip="node -p 'Object.values(os.networkInterfaces()).flat().filter(v => v.internal == false && v.family == \"IPv4\" && v.mac != \"00:00:00:00:00:00\")[0].address'"
# alias getrouter="ipconfig getoption en0 router"
alias getrouter="networksetup -getinfo Wi-Fi | rg --color=never -e 'Router: (.+)' -or '\$1'"
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
