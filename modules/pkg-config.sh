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
	export CMAKE_PREFIX_PATH="$prefix"
	if [[ -d "$prefix/opt/quictls@1.1/lib/pkgconfig" && "$PKG_CONFIG_PATH" != *"$prefix/opt/quictls@1.1/lib/pkgconfig"* ]]; then
		export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/quictls@1.1/lib/pkgconfig"
	fi
	if [[ -d "$prefix/opt/python@3.9/lib/pkgconfig" && "$PKG_CONFIG_PATH" != *"$prefix/opt/python@3.9/lib/pkgconfig"* ]]; then
		export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.9/lib/pkgconfig"
	fi
	if [[ -d "$prefix/opt/ruby@2.7/lib/pkgconfig" && "$PKG_CONFIG_PATH" != *"$prefix/opt/ruby@2.7/lib/pkgconfig"* ]]; then
		export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ruby@2.7/lib/pkgconfig"
	fi
	if [[ -d "$prefix/opt/util-linux/lib/pkgconfig" && "$PKG_CONFIG_PATH" != *"$prefix/opt/util-linux/lib/pkgconfig"* ]]; then
		export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/util-linux/lib/pkgconfig"
	fi
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/openssl@1.1/lib/pkgconfig"
	# # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/openssl@3/lib/pkgconfig"
	# # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/libressl/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ruby@2.7/lib/pkgconfig"
	# # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ruby/lib/pkgconfig"
	# # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.10/lib/pkgconfig"
	# # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.9/lib/pkgconfig"
	# # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/python@3.8/lib/pkgconfig"
	# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/util-linux/lib/pkgconfig"
	# # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/opt/ossp-uuid/lib/pkgconfig"
	# rg --no-messages --files-with-matches --hidden --type=ruby keg_only "$prefix/Cellar" | sortt | while read i; do
	rg --no-messages --files-with-matches --type=ruby --fixed-strings 'keg_only ' $prefix/Homebrew/Library/Taps/*/*/Formula | sortt | while read i; do
		local name="$(basename "$i" ".rb")"
		# [[ "$name" == "libressl" ]] && continue
		# [[ "$name" == "openssl@1.1" ]] && continue
		# [[ "$name" == "openssl@3" ]] && continue
		# [[ "$name" != "${name/'@'/''}" ]] && continue
		[[ "$name" == "ffmpeg@4" ]] && continue
		[[ "$name" == *"llvm"* ]] && continue
		local dir="$prefix/opt/$name"
		if [[ -d "$dir/lib/pkgconfig" && "$PKG_CONFIG_PATH" != *"$dir/lib/pkgconfig"* ]]; then
			export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$dir/lib/pkgconfig"
			# echo "$dir/lib/pkgconfig" | lscolors
		fi
		if [[ -d "$dir/lib/cmake" && "$CMAKE_PREFIX_PATH" != *"$dir/lib/cmake"* ]]; then
			export CMAKE_PREFIX_PATH="$dir:${CMAKE_PREFIX_PATH:+$CMAKE_PREFIX_PATH}"
			# echo "$dir/lib/cmake" | lscolors
		fi
	done
	# export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg-config --variable pc_path pkg-config)"
	bhr && echo "🟡 PKG_CONFIG_PATH -> '$PKG_CONFIG_PATH'" && echo && \
		echo $PKG_CONFIG_PATH | sed 's#:/#\n/#g' | lscolors
	bhr && echo "🟡 CMAKE_PREFIX_PATH -> '$CMAKE_PREFIX_PATH'" && echo && \
		echo $CMAKE_PREFIX_PATH | sed 's#:/#\n/#g' | lscolors
	bhr
}
