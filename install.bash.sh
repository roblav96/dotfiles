
DOTFILES="$(cd "$(dirname "$0")"; pwd -P)"
[ -z "$DEV" ] && (cd $DOTFILES && git pull --quiet && git reset --quiet --hard)
BASHRC="$(cd "$(dirname "$0")/.."; pwd -P)/.bashrc"

echo > $BASHRC
echo "export DOTFILES='$DOTFILES'" >> $BASHRC
echo "[ -f '$DOTFILES/static/.profile' ] && source '$DOTFILES/static/.profile'" >> $BASHRC
echo "alias src='sh $DOTFILES/install.bash.sh'" >> $BASHRC
echo >> $BASHRC
# cat $ZSHRC

clear
reset
exec -l /opt/bin/bash
# exec -l $SHELL
# exec $(echo "$0")

echo; echo '⬤ dotfiles install.sh complete'; echo



# export DOTFILES=""
# echo [ -f "$DOTFILES/zshrc.sh" ] && source "$DOTFILES/zshrc.sh" >> $ZSHRC
# echo `echo '[ -f "$DOTFILES/zshrc.$(uname -s).sh" ] && source "$DOTFILES/zshrc.$(uname -s).sh"'` >> $ZSHRC

# mkdir -p "$DOTFILES/.bin"



# echo

# DIR="${0%/*}"
# echo "DIR -> $DIR"
# ZSHRC="$DIR/../.zshrc"
# echo "ZSHRC -> $ZSHRC"
# cp "$DIR/static/.zshrc" $ZSHRC
# cat $ZSHRC
# mkdir -p "$DIR/.bin"

# echo

# DIR="${0%/*}"
# echo "DIR -> $DIR"
# SCRIPT="`readlink -f "$0"`"
# echo "SCRIPT -> $SCRIPT"
# ZSHRC="$DIR/../.zshrc"
# echo "ZSHRC -> $ZSHRC"
# DOTFILES="`cd "$(dirname "$0")"; pwd -P`"
# echo "DOTFILES -> $DOTFILES"

# DOTFILES=".dotfiles"
# ZSHRC="$DOTFILES/../.zshrc"
# echo "ZSHRC -> $ZSHRC"
# cat $ZSHRC
# # echo > $ZSHRC
# # echo '[ -f "$DOTFILES/zshrc.sh" ] && source "$DOTFILES/zshrc.sh"' >> $ZSHRC
# # echo '[ -f "$DOTFILES/zshrc.$(uname -s).sh" ] && source "$DOTFILES/zshrc.$(uname -s).sh"' >> $ZSHRC

# DIR="${0%/*}"
# DIR="$(readlink -f "$0")"
# DIR=$(readlink -f "$0")
# echo "DIR -> $DIR"
# export DOTFILES="$DIR/.dotfiles"
