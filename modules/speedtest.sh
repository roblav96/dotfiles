if [[ -x "$(which -p xh)" ]]; then
	alias sp="xh --print=b --download --output=/dev/null"
else
	alias sp="wget --output-document=/dev/null"
fi
alias cachefly="sp https://cachefly.cachefly.net/100mb.test"
alias linode="sp http://speedtest.newark.linode.com/100MB-newark.bin"
alias ievbox="sp https://az792536.vo.msecnd.net/vms/VMBuild_20190311/VirtualBox/MSEdge/MSEdge.Win10.VirtualBox.zip"

alias sp-alldebrid='sp "https://i45hh6.alld.io/speedtest/1073741824?$(date +%s)000"'
alias sp-premiumize='sp "https://cdn2-ovh-bea1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"'
alias sp-real-debrid="sp https://45.download.real-debrid.com/speedtest/testDefault.rar"

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

# xh --download --output=/dev/null https://sweetfairlady-sto.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://rose.listperfect.xyz/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://sweetfairlady-sto.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://sweetfairlady.b-cdn.net/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-23media-fra1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-ovh-lim1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-ovh-sgp1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-digitalocean-fra1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-nforce-roo1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-digitalocean-tor1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-digitalocean-sng1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-hetzner-hel1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-digitalocean-sfo1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-ovh-rou1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-ovh-syd1.energycdn.com/100Mio.dat no-cache==$(date +%s)000
# xh --download --output=/dev/null https://cdn2-ovh-bea1.energycdn.com/100Mio.dat no-cache==$(date +%s)000

# speedtest "https://rose.listperfect.xyz/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-sto.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady.b-cdn.net/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-nyc1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-los1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://sweetfairlady-mia1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"
# speedtest "https://cdn2-ovh-mon1.energycdn.com/100Mio.dat?no-cache=$(date +%s)000"

# [
# 	" [Auto] https://sweetfairlady-sto.energycdn.com/100Mio.dat ",
# 	" [Cloudflare] https://rose.listperfect.xyz/100Mio.dat ",
# 	" [Direct] https://sweetfairlady-sto.energycdn.com/100Mio.dat ",
# 	" [Bunny CDN] https://sweetfairlady.b-cdn.net/100Mio.dat ",
# 	" [23Media Frankfurt] https://cdn2-23media-fra1.energycdn.com/100Mio.dat ",
# 	" [OVH Frankfurt] https://cdn2-ovh-lim1.energycdn.com/100Mio.dat ",
# 	" [OVH Singapore] https://cdn2-ovh-sgp1.energycdn.com/100Mio.dat ",
# 	" [DigitalOcean Franfurt] https://cdn2-digitalocean-fra1.energycdn.com/100Mio.dat ",
# 	" [Nforce Netherlands] https://cdn2-nforce-roo1.energycdn.com/100Mio.dat ",
# 	" [Digitalocean Toronto] https://cdn2-digitalocean-tor1.energycdn.com/100Mio.dat ",
# 	" [Digitalocean Singapore] https://cdn2-digitalocean-sng1.energycdn.com/100Mio.dat ",
# 	" [Hetzner Helsinki] https://cdn2-hetzner-hel1.energycdn.com/100Mio.dat ",
# 	" [Digitalocean San Francisco] https://cdn2-digitalocean-sfo1.energycdn.com/100Mio.dat ",
# 	" [OVH Roubaix] https://cdn2-ovh-rou1.energycdn.com/100Mio.dat ",
# 	" [OVH Sydney] https://cdn2-ovh-syd1.energycdn.com/100Mio.dat ",
# 	" [OVH North America (Beauharnois)] https://cdn2-ovh-bea1.energycdn.com/100Mio.dat "
# ]
