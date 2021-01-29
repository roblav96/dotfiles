alias speedtest="wget --output-document=/dev/null"
alias cachefly="wget --output-document=/dev/null https://cachefly.cachefly.net/100mb.test"
alias linode="wget --output-document=/dev/null http://speedtest.newark.linode.com/100MB-newark.bin"
alias ievbox="wget --output-document=/dev/null https://az792536.vo.msecnd.net/vms/VMBuild_20190311/VirtualBox/MSEdge/MSEdge.Win10.VirtualBox.zip"

alias iperf="iperf3 -c 192.34.85.234 -p 15201 --verbose"

function premiumize-urls() {
	local html="$(curl "https://www.premiumize.me/speedtest")"
	local urls=()
	local locations=("Cloudflare (our default)" "Direct (no CDN)" "Bunny CDN (great alternative if Cloudflare consistently unreliable)" "M247 New York" "Leaseweb Chicago")
	local location && for location in "${locations[@]}"; do
		urls+=($(echo $html | pup "a[data-location=\"$location\"] attr{data-url}"))
		bhr
		echo "🟡 $location" && echo -n "   "
		echo "${urls[-1]}"
	done
	bhr
	# for url in "${urls[@]}"; do
	# 	echo "🟡 url -> '$url'"
	# 	speedtest "$url?no-cache=$(date +%s)000"
	# done
}

# speedtest "https://rose.listperfect.xyz/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-sto.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady.b-cdn.net/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-nyc1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-los1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-mia1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://cdn2-ovh-mon1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
