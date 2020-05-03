alias speedtest="wget --quiet --output-document=/dev/null"
alias cachefly="speedtest https://cachefly.cachefly.net/100mb.test"
alias linode="speedtest http://speedtest.newark.linode.com/100MB-newark.bin"
alias ievbox="speedtest https://az792536.vo.msecnd.net/vms/VMBuild_20190311/VirtualBox/MSEdge/MSEdge.Win10.VirtualBox.zip"

alias iperf="iperf3 -c 192.34.85.234 -p 15201 --verbose"
