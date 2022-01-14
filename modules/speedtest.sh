alias sp="wget --output-document=/dev/null"
alias cachefly="wget --output-document=/dev/null https://cachefly.cachefly.net/100mb.test"
alias linode="wget --output-document=/dev/null http://speedtest.newark.linode.com/100MB-newark.bin"
alias ievbox="wget --output-document=/dev/null https://az792536.vo.msecnd.net/vms/VMBuild_20190311/VirtualBox/MSEdge/MSEdge.Win10.VirtualBox.zip"

alias aria2sp="aria2c -s16 -j16 -x16 -k1M -d /dev -o null --file-allocation=none --allow-overwrite=true"
alias iperf="iperf3 -c 192.34.85.234 -p 15201 --verbose"

function premiumize-urls() {
	local html="$(curl "https://www.premiumize.me/speedtest")"
	local urls=()
	local locations=(
		"Auto"
		"Cloudflare"
		"Direct"
		"Bunny CDN"
		"23Media Frankfurt"
		"OVH Frankfurt"
		"OVH Singapore"
		"DigitalOcean Franfurt"
		"Nforce Netherlands"
		"Digitalocean Toronto"
		"Digitalocean Singapore"
		"Hetzner Helsinki"
		"Digitalocean San Francisco"
		"OVH Roubaix"
		"OVH Sydney"
		"OVH North America (Beauharnois)"
	)
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

# xh --download --output=/dev/null https://sweetfairlady-sto.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://rose.listperfect.xyz/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://sweetfairlady-sto.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://sweetfairlady.b-cdn.net/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-23media-fra1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-ovh-lim1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-ovh-sgp1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-digitalocean-fra1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-nforce-roo1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-digitalocean-tor1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-digitalocean-sng1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-hetzner-hel1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-digitalocean-sfo1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-ovh-rou1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-ovh-syd1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;
# xh --download --output=/dev/null https://cdn2-ovh-bea1.energycdn.com/100Mio.dat no-cache==$(date +%s)000;

# speedtest "https://rose.listperfect.xyz/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-sto.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady.b-cdn.net/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-nyc1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-los1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-mia1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://cdn2-ovh-mon1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
