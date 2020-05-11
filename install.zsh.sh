#!/usr/bin/env bash

# # [[ -x "$(which clear)" ]] && clear
# echo "🌕 (env) -> '$(env)'"; echo
# echo "🌕 0 -> '$0'"; echo
# echo "🌕 PATH -> '$PATH'"; echo
# echo "🌕 SHELL -> '$SHELL'"; echo
# echo "🌕 HOME -> '$HOME'"; echo

if [[ ! -f "$0" ]]; then
	echo "🔴 Invalid directory of script -> '$0'"
	return 1
fi
DOTFILES="$(cd "$(dirname "$0")"; pwd -P)"

ZSHRC="$HOME/.zshrc"
[[ -z "$HOME" ]] && ZSHRC="$(dirname "$DOTFILES")/.zshrc"
ZSHRC_EXISTS="$([[ -f "$ZSHRC" ]] && echo true)"

PLATFORM="${$(uname -o)##*/}"
if [[ "$PLATFORM" != "Darwin" ]]; then
	(cd $DOTFILES && git pull --quiet && git reset --quiet --hard)
fi

echo > $ZSHRC
echo "export PLATFORM='$PLATFORM'" >> $ZSHRC
echo "export DOTFILES='$DOTFILES'" >> $ZSHRC
# echo "alias src='sh $DOTFILES/install.zsh.sh; command rm -v $(dirname $DOTFILES)/.zcomp*; exit'" >> $ZSHRC
# echo "test ! -d ~/.zinit/bin && mkdir ~/.zinit && rm -rf ~/.zinit/bin && git clone git@github.com:zdharma/zinit.git ~/.zinit/bin" >> $ZSHRC
# echo "source ~/.zinit/bin/zinit.zsh" >> $ZSHRC
echo "[ -f '$DOTFILES/zshrc.$PLATFORM.before.sh' ] && source '$DOTFILES/zshrc.$PLATFORM.before.sh'" >> $ZSHRC
echo "[ -f '$DOTFILES/zshrc.sh' ] && source '$DOTFILES/zshrc.sh'" >> $ZSHRC
echo "[ -f '$DOTFILES/zshrc.$PLATFORM.after.sh' ] && source '$DOTFILES/zshrc.$PLATFORM.after.sh'" >> $ZSHRC
echo "typeset -f dotcompinit &>/dev/null && dotcompinit && unfunction dotcompinit" >> $ZSHRC
cat $ZSHRC

# clear
# reset
# echo "exec $(echo "$0") -l"

echo; echo '✅ .dotfiles ZSH install complete!'; echo



# export DOTFILES=""
# echo [ -f "$DOTFILES/zshrc.sh" ] && source "$DOTFILES/zshrc.sh" >> $ZSHRC
# echo `echo '[ -f "$DOTFILES/zshrc.$PLATFORM.sh" ] && source "$DOTFILES/zshrc.$PLATFORM.sh"'` >> $ZSHRC

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
# # echo '[ -f "$DOTFILES/zshrc.$PLATFORM.sh" ] && source "$DOTFILES/zshrc.$PLATFORM.sh"' >> $ZSHRC

# DIR="${0%/*}"
# DIR="$(readlink -f "$0")"
# DIR=$(readlink -f "$0")
# echo "DIR -> $DIR"
# export DOTFILES="$DIR/.dotfiles"
