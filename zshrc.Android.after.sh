export PURE_PROMPT_SYMBOL="$USER ➤"
if [[ "$USER" == "root" ]]; then
	export PURE_PROMPT_SYMBOL="⚠️  $USER ➤"
	unset HISTFILE
	unalias src
	alias apt="echo 'root will destroy apt file locks'"
	alias pkg="echo 'root will destroy pkg file locks'"
fi

# unalias sudo
# alias sudo="tsudo "

test -x "$(which dropbear)" && alias dropbear='echo; getip; echo; dropbear -F'

test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
test -d "/system/bin" && export PATH="$PATH:/system/bin"
test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
test -d "/sbin" && export PATH="$PATH:/sbin"
