# pkg-config.sh

function pkgprovides() {
	local v && for v in "$@"; do
		pkg-config --print-provides --debug "$v" 2>&1 | sed -e '/line>$/d' -e 's/line>//' | t1 | bat --file-name="$v" -l sh
	done
} && compdef pkgprovides=pkg-config

function pkgfind() {
	pkg-config --list-all | sortt | rg --smart-case --fixed-strings -- "$*" | bl properties
} && compdef pkgfind=pkg-config

function pc_path() {
	local prefix="$(brew --prefix)"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/openssl@1.1/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/openssl@3/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/libressl/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ruby@2.7/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ruby/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.10/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.9/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.8/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/util-linux/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ossp-uuid/lib/pkgconfig"
	# rg --no-messages --files-with-matches --hidden --type=ruby keg_only "$prefix/Cellar" | sortt | while read i; do
	rg --no-messages --files-with-matches --type=ruby --fixed-strings 'keg_only ' $prefix/Homebrew/Library/Taps/*/*/Formula | sortt | while read i; do
		local name="$(basename "$i" ".rb")"
		[[ "$name" == "libressl" ]] && continue
		[[ "$name" == "openssl@1.1" ]] && continue
		[[ "$name" == "openssl@3" ]] && continue
		[[ "$name" != "${name/'@'/''}" ]] && continue
		local dir="$prefix/opt/$name/lib/pkgconfig"
		if [[ -d "$dir" && "$PKG_CONFIG_PATH" != *"$dir"* ]]; then
			export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$dir"
			echo "$dir"
		fi
	done
	# export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg-config --variable pc_path pkg-config)"
	echo && echo "🟡 PKG_CONFIG_PATH -> '$PKG_CONFIG_PATH'"
}
