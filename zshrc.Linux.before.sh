export CLICOLOR="1"
export LSCOLORS="ExFxBxDxCxegedabagacad"

test -x "$(which nano)" && export EDITOR="nano"
test -x "$(which subl)" && export EDITOR="subl"

# export FZF_BASE="$HOME/.fzf"
# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
