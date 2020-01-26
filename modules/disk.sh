alias diskus="diskus --apparent-size"

alias dust="dust --apparent-size --reverse --number-of-lines=\$(expr \$(tput lines) - 10)"
# export DUST_FLAGS="--apparent-size --reverse"
# alias dust="command dust $DUST_FLAGS --depth=1"
# # alias dust="command dust $DUST_FLAGS --depth=1 | tail --lines=\$(expr \$(tput lines) - 10)"

alias duu='du -ah -d 1 | sort -h | sed s/\\t\.\\//\\t/g | tail'
# alias .du="du -ah * -d 0 | sort -h"
# alias .du="du -d 1 -h"

alias dff="df -h"
alias dfc="dfc -d -T -f -c always -q type"
