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

if [[ -x "$PREFIX/bin/$EDITOR" ]]; then
	if [[ ! -e "$HOME/bin/termux-file-editor" ]]; then
		[[ ! -d "$HOME/bin" ]] && mkdir -p "$HOME/bin"
		ln -sf "$PREFIX/bin/$EDITOR" "$HOME/bin/termux-file-editor"
	fi
fi

unalias htop &>/dev/null
alias htop="htop --delay=1"

# test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
# test -d "/system/bin" && export PATH="$PATH:/system/bin"
# test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
# test -d "/sbin" && export PATH="$PATH:/sbin"
