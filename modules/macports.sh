# alias port="port -v"

function pupd() {
	echo && echo "🟡 Updating ports"
	port -v update --verbose && bout
}

function pout() {
	echo && echo "🟡 Outdated ports"
	port -v outdated
}

function pupg() {
	local v && for v in "$@"; do
		echo && echo "🟡 Upgrading port -> '$v'"
		port -v upgrade "$v"
	done
}

function pls() {
	echo && echo "🟡 List ports"
	port -q installed
}
