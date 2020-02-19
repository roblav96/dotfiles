# alias tar-compress="tar -czvf -"
# alias tar-encrypt="openssl enc -e -aes256 -out"
# tar-compress [FILE...] | tar-encrypt ARCHIVE

function tar-encrypt() {
	echo "🌕 @ -> $@"
	echo "🌕 _ -> $_"
	echo "🌕 ! -> $!"
	echo "🌕 !# -> $!#"
	echo "🌕 {@:-1} -> ${@:-1}"
	local files=""
	local targz=""
	# tar -czvf -
}
