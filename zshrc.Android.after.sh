export PURE_PROMPT_SYMBOL="$USER ➤"
if [[ "$USER" == "root" ]]; then
	export PURE_PROMPT_SYMBOL="⚠️  $USER ➤"
	unset HISTFILE
	unalias src
	alias apt="echo !root"
	alias pkg="echo !root"
fi

unalias sudo
alias sudo="tsudo "

if test -d "$HOME/.go"; then
	export GOPATH="$HOME/.go"
	export GOBIN="$GOPATH/bin"
	export PATH="$GOBIN:$PATH"
fi

test -d "$HOME/.cargo/bin" && export PATH="$HOME/.cargo/bin:$PATH"

test -d "/system/xbin" && export PATH="$PATH:/system/xbin"
test -d "/system/bin" && export PATH="$PATH:/system/bin"
test -d "/vendor/bin" && export PATH="$PATH:/vendor/bin"
test -d "/sbin" && export PATH="$PATH:/sbin"

source "$DOTFILES/modules/adbfi.sh"
