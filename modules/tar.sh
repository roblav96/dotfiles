# alias tar-compress="tar -czvf -"
# alias tar-encrypt="openssl enc -e -aes256 -out"
# tar-compress [FILE...] | tar-encrypt ARCHIVE

function tar-encrypt() {
	[[ -z "$@" ]] && echo "🔴 Application name required" && return 1
	echo "🌕 @ -> $@"
	echo "🌕 _ -> $_"
	echo "🌕 ! -> $!"
	echo "🌕 !# -> $!#"
	echo "🌕 {@:0:-1} -> ${@:0:-1}"
	echo "🌕 {@:2} -> ${@:2}"
	local files=""
	local targz=""
	tar --create --gzip --verbose --file "$targz"
}
