function pc_path() {
	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
	# local PKG_CONFIG_PATH="$(pkg-config --variable pc_path pkg-config)"
	# echo $PATH | sed 's#:/#\n/#g' | sort --reverse | while read i; do
	# rg --no-messages --files-with-matches --follow --hidden --type=ruby keg_only /usr/local/opt | sort --reverse | while read i; do
	rg --no-messages --files-with-matches --hidden --type=ruby keg_only "$(brew --prefix)/Cellar" | sort | while read i; do
		# local dir="$(dirname "$(dirname "$i")")/lib/pkgconfig"
		local name="$(basename "$i" ".rb")"
		# [[ "$name" == "python@3.7" ]] && continue
		# [[ "$name" == "python@3.8" ]] && continue
		local dir="$(brew --prefix)/opt/$name/lib/pkgconfig"
		if [[ -d "$dir" ]]; then
			if [[ -z "$PKG_CONFIG_PATH" ]]; then
				export PKG_CONFIG_PATH="$dir"
			else
				export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$dir"
			fi
			echo "$dir"
		fi
	done
	pkg-config --variable pc_path pkg-config | sed 's#:/#\n/#g'
	export PKG_CONFIG_PATH="$(brew --prefix)/opt/python@3.9/lib/pkgconfig:$PKG_CONFIG_PATH:$(pkg-config --variable pc_path pkg-config)"
	echo "🟡 PKG_CONFIG_PATH -> '$PKG_CONFIG_PATH'"
}
