DOTFILES="$(cd "$(dirname "$0")"; pwd -P)"
[ -z "$DEV" ] && (cd $DOTFILES && git pull --quiet && git reset --quiet --hard)
BASHRC="$(cd "$(dirname "$0")/.."; pwd -P)/..bashrc"

echo > $BASHRC
echo 'export PLATFORM="$(uname -o)"' >> $BASHRC
echo "export DOTFILES='$DOTFILES'" >> $BASHRC
echo "alias src='sh $DOTFILES/install.bash.sh; exit'" >> $BASHRC
echo "[ -f '$DOTFILES/static/.profile' ] && source '$DOTFILES/static/.profile'" >> $BASHRC
chmod a+x $BASHRC
cat $BASHRC

# clear
# reset
# echo 'exec -l $(echo "$0")'
# exec -l /opt/bin/bash
# exec -l $SHELL
# exec $(echo "$0")

echo; echo '✅ .dotfiles BASH install complete!'; echo
