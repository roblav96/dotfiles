alias ipinfo="
echo;
curl https://icanhazip.com;
curl https://api6.ipify.org; echo;
echo;
curl https://ipinfo.io | json '. |= del(.readme)'
"
alias ipinfoa="
echo;
echo '\t\ticanhazip.com';
curl https://icanhazip.com;
echo;
echo '\t\tapi6.ipify.org';
curl https://api6.ipify.org; echo;
echo;
echo '\t\tiplist.cc';
curl https://iplist.cc/api | json;
echo;
echo '\t\tipvigilante.com';
curl https://ipvigilante.com/json/full | json '.data';
echo;
echo '\t\tifconfig.co';
curl https://ifconfig.co/json | json '. |= del(.user_agent)';
echo;
echo '\t\tipinfo.io';
curl https://ipinfo.io | json '. |= del(.readme)'
"
alias cachefly="wget --quiet --show-progress -O /dev/null https://cachefly.cachefly.net/100mb.test"
alias ie8vbox="wget --quiet --show-progress -O /dev/null https://az792536.vo.msecnd.net/vms/VMBuild_20150916/VirtualBox/IE8/IE8.Win7.VirtualBox.zip"
alias linode="wget --quiet --show-progress -O /dev/null http://speedtest.newark.linode.com/100MB-newark.bin"
alias iperf="iperf3 -c 192.34.85.234 -p 15201 --verbose"
