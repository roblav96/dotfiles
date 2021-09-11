function pc_path() {
	# export PKG_CONFIG_PATH="$(pkg-config --variable pc_path pkg-config)"
	# export PKG_CONFIG_PATH="$(pkg-config --variable pc_path pkg-config)${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/openssl@1.1/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/python@3.9/lib/pkgconfig"
	export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$(brew --prefix)/opt/util-linux/lib/pkgconfig"
	# local PKG_CONFIG_PATH="$(pkg-config --variable pc_path pkg-config)"
	# echo $PATH | sed 's#:/#\n/#g' | sort --reverse | while read i; do
	# rg --no-messages --files-with-matches --follow --hidden --type=ruby keg_only /usr/local/opt | sort --reverse | while read i; do
	rg --no-messages --files-with-matches --hidden --type=ruby keg_only "$(brew --prefix)/Cellar" | sort | while read i; do
		# local dir="$(dirname "$(dirname "$i")")/lib/pkgconfig"
		local name="$(basename "$i" ".rb")"
		# [[ "$name" == "openssl@1.1" ]] && continue
		# [[ "$name" == "python@3.9" ]] && continue
		# [[ "$name" == "util-linux" ]] && continue
		local dir="$(brew --prefix)/opt/$name/lib/pkgconfig"
		if [[ -d "$dir" && "$PKG_CONFIG_PATH" != *"$dir"* ]]; then
			export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$dir"
			echo "$dir"
		fi
	done
	# export PKG_CONFIG_PATH="$(brew --prefix)/opt/util-linux/lib/pkgconfig:$PKG_CONFIG_PATH"
	# export PKG_CONFIG_PATH="$(brew --prefix)/opt/python@3.9/lib/pkgconfig:$PKG_CONFIG_PATH"
	# export PKG_CONFIG_PATH="$(brew --prefix)/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
	# pkg-config --variable pc_path pkg-config | sed 's#:/#\n/#g'
	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg-config --variable pc_path pkg-config)"
	echo && echo "🟡 PKG_CONFIG_PATH -> '$PKG_CONFIG_PATH'"
	# echo && echo "🟢 PKG_CONFIG_PATH ->"
	# echo $PKG_CONFIG_PATH | sed 's#:/#\n/#g' | lscolors
}
