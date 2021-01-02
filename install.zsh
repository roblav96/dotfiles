#!/usr/bin/env zsh

# DOTBENCH="$(date +%s%3N)"
# echo "🌕 ZSH install before"

if [[ ! -e "$0" ]]; then
	echo "[ERROR] Invalid script directory -> '$0'"
	return 1
fi
DOTFILES="$(dirname "$(readlink -f "$0")")"

ZSHRC="$HOME/.zshrc"
[[ -z "$HOME" ]] && ZSHRC="$(dirname "$DOTFILES")/.zshrc"
ZSHRC_EXISTS="$([[ -e "$ZSHRC" ]] && echo 1)"

PLATFORM="${$(uname -o)##*/}"
if [[ "$PLATFORM" != "Darwin" ]]; then
	(cd "$DOTFILES" && git pull --rebase && git reset --hard origin/master)
fi

echo '#!/usr/bin/env zsh' > "$ZSHRC"
echo >> "$ZSHRC"
echo "export PLATFORM='$PLATFORM'" >> "$ZSHRC"
echo "export DOTFILES='$DOTFILES'" >> "$ZSHRC"
# echo "alias src='zsh $DOTFILES/install.zsh; command rm -v $(dirname $DOTFILES)/.zcomp*; exit'" >> "$ZSHRC"
# echo "test ! -d ~/.zinit/bin && mkdir ~/.zinit && rm -rf ~/.zinit/bin && git clone git@github.com:zdharma/zinit.git ~/.zinit/bin" >> "$ZSHRC"
# echo "source ~/.zinit/bin/zinit.zsh" >> "$ZSHRC"
echo "[[ -e '$DOTFILES/zshrc.before.sh' ]] && source '$DOTFILES/zshrc.before.sh'" >> "$ZSHRC"
echo "[[ -e '$DOTFILES/zshrc.$PLATFORM.before.sh' ]] && source '$DOTFILES/zshrc.$PLATFORM.before.sh'" >> "$ZSHRC"
echo "[[ -e '$DOTFILES/zshrc.sh' ]] && source '$DOTFILES/zshrc.sh'" >> "$ZSHRC"
echo "[[ -e '$DOTFILES/zshrc.$PLATFORM.after.sh' ]] && source '$DOTFILES/zshrc.$PLATFORM.after.sh'" >> "$ZSHRC"
echo "[[ -e '$DOTFILES/zshrc.after.sh' ]] && source '$DOTFILES/zshrc.after.sh'" >> "$ZSHRC"
echo "typeset -f dotcompinit &>/dev/null && dotcompinit && unfunction dotcompinit" >> "$ZSHRC"
# echo >> "$ZSHRC"

if [[ -z "$ZSHRC_EXISTS" ]]; then
	cat "$ZSHRC"
	echo && echo "✅ ZSH dotfiles installed"
fi

# echo "🌕 ZSH install after -> '$(bc <<< "$(date +%s%3N) - $DOTBENCH")'"



# clear
# reset
# echo "exec $(echo "$0") -l"

# export DOTFILES=""
# echo [ -e "$DOTFILES/zshrc.zsh" ] && source "$DOTFILES/zshrc.zsh" >> $ZSHRC
# echo `echo '[ -e "$DOTFILES/zshrc.$PLATFORM.sh" ] && source "$DOTFILES/zshrc.$PLATFORM.sh"'` >> $ZSHRC

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
# # echo '[ -e "$DOTFILES/zshrc.zsh" ] && source "$DOTFILES/zshrc.zsh"' >> $ZSHRC
# # echo '[ -e "$DOTFILES/zshrc.$PLATFORM.sh" ] && source "$DOTFILES/zshrc.$PLATFORM.sh"' >> $ZSHRC

# DIR="${0%/*}"
# DIR="$(readlink -f "$0")"
# DIR=$(readlink -f "$0")
# echo "DIR -> $DIR"
# export DOTFILES="$DIR/.dotfiles"
