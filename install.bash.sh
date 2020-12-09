#!/usr/bin/env bash

if [[ ! -e "$0" ]]; then
	echo "[ERROR] Invalid script directory -> '$0'"
	return 1
fi
DOTFILES="$(dirname "$(realpath "$0")")"

BASHRC="$HOME/..bashrc"
[[ -z "$HOME" ]] && BASHRC="$(dirname "$DOTFILES")/..bashrc"
BASHRC_EXISTS="$([[ -e "$BASHRC" ]] && echo 1)"

PLATFORM="$(uname -o)"
if [[ "$PLATFORM" != "Darwin" ]]; then
	(cd "$DOTFILES" && git pull --rebase && git reset --hard origin/master)
fi

echo > "$BASHRC"
echo "export PLATFORM='$PLATFORM'" >> "$BASHRC"
echo "export DOTFILES='$DOTFILES'" >> "$BASHRC"
echo "alias dotsrc='bash $DOTFILES/install.bash.sh && exit'" >> $BASHRC
echo "[[ -e '$DOTFILES/static/.profile' ]] && source '$DOTFILES/static/.profile'" >> "$BASHRC"
echo >> "$BASHRC"
chmod a+x $BASHRC
cat $BASHRC

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
