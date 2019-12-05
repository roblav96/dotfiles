DOTFILES="$(cd "$(dirname "$0")"; pwd -P)"
[ -z "$DEV" ] && (cd $DOTFILES && git pull --quiet && git reset --quiet --hard)
ZSHRC="$(cd "$(dirname "$0")/.."; pwd -P)/.zshrc"
PLATFORM="$(uname -o)"

echo > $ZSHRC
echo "export DOTFILES='$DOTFILES'" >> $ZSHRC
echo "alias src='sh $DOTFILES/install.zsh.sh; rm -v ~/.zcompdump*; exit'" >> $ZSHRC
echo "[ -f '$DOTFILES/zshrc.${PLATFORM##*/}.before.sh' ] && source '$DOTFILES/zshrc.${PLATFORM##*/}.before.sh'" >> $ZSHRC
echo "[ -f '$DOTFILES/zshrc.sh' ] && source '$DOTFILES/zshrc.sh'" >> $ZSHRC
echo "[ -f '$DOTFILES/zshrc.${PLATFORM##*/}.after.sh' ] && source '$DOTFILES/zshrc.${PLATFORM##*/}.after.sh'" >> $ZSHRC
cat $ZSHRC

# clear
# reset
# echo "exec $(echo "$0") -l"

echo; echo '🌕 dotfiles install.zsh.sh complete'; echo



# export DOTFILES=""
# echo [ -f "$DOTFILES/zshrc.sh" ] && source "$DOTFILES/zshrc.sh" >> $ZSHRC
# echo `echo '[ -f "$DOTFILES/zshrc.${PLATFORM##*/}.sh" ] && source "$DOTFILES/zshrc.${PLATFORM##*/}.sh"'` >> $ZSHRC

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
# # echo '[ -f "$DOTFILES/zshrc.${PLATFORM##*/}.sh" ] && source "$DOTFILES/zshrc.${PLATFORM##*/}.sh"' >> $ZSHRC

# DIR="${0%/*}"
# DIR="$(readlink -f "$0")"
# DIR=$(readlink -f "$0")
# echo "DIR -> $DIR"
# export DOTFILES="$DIR/.dotfiles"
