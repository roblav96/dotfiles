export PURE_PROMPT_SYMBOL="$USER ➤"
if [[ "$USER" == "root" ]]; then
	export PURE_PROMPT_SYMBOL="$USER ⌦"
fi

test -d "$HOME/.bin" && export PATH="$HOME/.bin:$PATH"

test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
test -d "/system/bin" && export PATH="$PATH:/system/bin"
test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
test -d "/sbin" && export PATH="$PATH:/sbin"
