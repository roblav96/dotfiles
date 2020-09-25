if [[ "$USER" == "root" ]]; then
	# unset HISTFILE
	unalias src
	alias apt="echo 'root will destroy apt file locks'"
	alias pkg="echo 'root will destroy pkg file locks'"
	alias dpkg="echo 'root will destroy dpkg file locks'"
fi

if [[ -x "$HOME/.termux/boot/termux-services.sh" ]]; then
	sh "$HOME/.termux/boot/termux-services.sh"
fi

# test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
# test -d "/system/bin" && export PATH="$PATH:/system/bin"
# test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
# test -d "/sbin" && export PATH="$PATH:/sbin"
