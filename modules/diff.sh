alias diffs="icdiff --highlight --line-numbers --unified=3"

if [[ -x "$(which -p diff-color)" ]]; then
	function diffc() {
		diff --unified "$@" | diff-color
	}; compdef diffc=rm
fi

function checksum() {
	sha256sum $@
}; compdef checksum=rm
