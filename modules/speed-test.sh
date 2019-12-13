alias ipinfo="
echo;
curl https://icanhazip.com;
curl https://api6.ipify.org; echo;
echo;
curl https://ipinfo.io | json '. |= del(.readme)'
"
alias ipinfoa="
echo;
echo '		icanhazip.com';
curl https://icanhazip.com;
echo;
echo '		api6.ipify.org';
curl https://api6.ipify.org; echo;
echo;
echo '		iplist.cc';
curl https://iplist.cc/api | json;
echo;
echo '		ipvigilante.com';
curl https://ipvigilante.com/json/full | json '.data';
echo;
echo '		ifconfig.co';
curl https://ifconfig.co/json | json '. |= del(.user_agent)';
echo;
echo '		ipinfo.io';
curl https://ipinfo.io | json '. |= del(.readme)'
"
alias cachefly="wget -O /dev/null https://cachefly.cachefly.net/100mb.test"
alias ie8vbox="wget -O /dev/null https://az792536.vo.msecnd.net/vms/VMBuild_20150916/VirtualBox/IE8/IE8.Win7.VirtualBox.zip"
alias linode="wget -O /dev/null http://speedtest.newark.linode.com/100MB-newark.bin"
alias iperf="iperf3 -c 192.34.85.234 -p 15201 --verbose"
