#!/usr/bin/env bash

if [[ -z "$HOME" ]]; then
	echo "[ERROR] Invalid HOME directory -> '$HOME'"
	return 1
fi
DOTFILES="$HOME/.dotfiles"
BASHRC="$HOME/..bashrc"
BASHRC_EXISTS="$([[ -e "$BASHRC" ]] && echo 1)"

PLATFORM="$(uname -s)"
if [[ "$PLATFORM" != "Darwin" && -x "$(which git)" ]]; then
	(cd "$DOTFILES" && git pull --rebase && git reset --hard origin/master)
fi

echo > "$BASHRC"
echo "export PLATFORM='$PLATFORM'" >> "$BASHRC"
echo "export DOTFILES='$DOTFILES'" >> "$BASHRC"
echo "alias dotsrc='bash $DOTFILES/install.bash.sh && exit'" >> $BASHRC
echo "[[ -e '$DOTFILES/static/.profile' ]] && source '$DOTFILES/static/.profile'" >> "$BASHRC"
echo >> "$BASHRC"

if [[ -z "$BASHRC_EXISTS" ]]; then
	cat "$BASHRC"
	echo && echo "✔ BASH dotfiles install"
fi

# clear
# reset
# echo 'exec -l $(echo "$0")'
# exec -l /opt/bin/bash
# exec -l $SHELL
# exec $(echo "$0")
