if [[ -x "$(which -p diff-color)" ]]; then
	function diffc() {
		diff --unified "$@" | diff-color
	}; compdef diffc=diff
fi

function checksum() {
	sha256sum $@
}; compdef checksum=rm
