
export DEVING="$DEVING"

# echo "DEVING ➤ $DEVING"

alias deving="_deving_watch"
function _deving_watch {
	DEVING="1"
	echo "⬤ [deving] Watching for '$DOTFILES/**/*' changes..."
	onchange -s $DOTFILES/**/* -- exit 1
	# (onchange -s $DOTFILES/**/* -- exit 0 || _deving_reload) > /dev/null &
}

alias reload="_deving_reload"
function _deving_reload {
	clear
	reset
	exec $SHELL -l
}

if [[ -n "$DEVING" ]]; then
	(_deving_watch &) > /dev/null &
fi
