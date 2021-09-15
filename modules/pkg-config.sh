#

function pc_path() {
	local prefix="$(brew --prefix)"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/openssl@1.1/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/libressl/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.9/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.8/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ossp-uuid/lib/pkgconfig"
	# rg --no-messages --files-with-matches --hidden --type=ruby keg_only "$prefix/Cellar" | sortt | while read i; do
	rg --files-with-matches --type=ruby --case-sensitive 'keg_only' "$prefix/Homebrew/Library/Taps/homebrew" | sortt | while read i; do
		local name="$(basename "$i" ".rb")"
		[[ "$name" == "libressl" ]] && continue
		[[ "$name" == "openssl@1.1" ]] && continue
		local dir="$prefix/opt/$name/lib/pkgconfig"
		if [[ -d "$dir" && "$PKG_CONFIG_PATH" != *"$dir"* ]]; then
			export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$dir"
			echo "$dir"
		fi
	done
	# export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg-config --variable pc_path pkg-config)"
	echo && echo "🟡 PKG_CONFIG_PATH -> '$PKG_CONFIG_PATH'"
}
