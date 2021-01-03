function tar-encrypt() {
	[[ -z "$@" ]] && return 1
	# local targz="$1.chacha20.tar.gz"
	# if [[ "$#" -eq "1" ]]; then
	# 	tar --create --gzip --verbose --file "$1.tar.gz" "$1"
	# else
	# 	echo "🟡 @ -> $@"
	# 	echo "🟡 {@:2} -> ${@:2}"
	# 	tar --create --gzip --verbose --file "$1.tar.gz" "$1"
	# fi
	tar --create --gzip --verbose --preserve-permissions --file - "$@" | openssl enc -e -chacha20 -out "$1.chacha20.tar.gz"
	# echo "🟡 * -> $*"
	# echo "🟡 @ -> $@"
	# echo "🟡 _ -> $_"
	# echo "🟡 ! -> $!"
	# echo "🟡 !# -> $!#"
	# echo "🟡 {@:0:-1} -> ${@:0:-1}"
	# echo "🟡 {@:2} -> ${@:2}"
	# local files=""
	# local targz=""
	# tar --create --gzip --verbose --file "$1.tar.gz" "$@"
}

function tar-decrypt() {
	[[ -z "$@" ]] && return 1
	openssl enc -d -chacha20 -in "$@" | tar --extract --gzip --verbose --file -
	# --directory "$1"
}
