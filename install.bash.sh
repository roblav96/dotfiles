DOTFILES="$(cd "$(dirname "$0")"; pwd -P)"
# [ -z "$DEV" ] && (cd $DOTFILES && git pull --quiet && git reset --quiet --hard)
BASH_PROFILE="$(cd "$(dirname "$0")/.."; pwd -P)/.bash_profile"

echo > $BASH_PROFILE
echo "export DOTFILES='$DOTFILES'" >> $BASH_PROFILE
echo "alias src='sh $DOTFILES/install.bash.sh'" >> $BASH_PROFILE
echo "[ -f '$DOTFILES/static/.profile' ] && source '$DOTFILES/static/.profile'" >> $BASH_PROFILE
chmod a+x $BASH_PROFILE
cat $BASH_PROFILE

# clear
# reset
# echo 'exec -l $(echo "$0")'
# exec -l /opt/bin/bash
# exec -l $SHELL
# exec $(echo "$0")

echo; echo '⭐ dotfiles install.sh complete'; echo
