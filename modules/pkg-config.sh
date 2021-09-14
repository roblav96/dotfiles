#

function pc_path() {
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/openssl@1.1/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/libressl/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/python@3.9/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/python@3.8/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/ossp-uuid/lib/pkgconfig"
	rg --no-messages --files-with-matches --hidden --type=ruby keg_only "$(brew --prefix)/Cellar" | sort | while read i; do
		local name="$(basename "$i" ".rb")"
		local dir="$(brew --prefix)/opt/$name/lib/pkgconfig"
		if [[ -d "$dir" && "$PKG_CONFIG_PATH" != *"$dir"* ]]; then
			export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$dir"
			echo "$dir"
		fi
	done
	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg-config --variable pc_path pkg-config)"
	echo && echo "🟡 PKG_CONFIG_PATH -> '$PKG_CONFIG_PATH'"
}
