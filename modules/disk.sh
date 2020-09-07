local TK_FLAGS="--sort=code --exclude=.git"
local TK_FLAGS_ALL="--hidden --no-ignore --no-ignore-parent --no-ignore-vcs"
alias tk="tokei $TK_FLAGS --exclude=node_modules"
alias tkf="tokei $TK_FLAGS --exclude=node_modules --files"
alias tka="tokei $TK_FLAGS $TK_FLAGS_ALL"
alias tkaf="tokei $TK_FLAGS $TK_FLAGS_ALL --files"
alias tkls="tokei --languages"
unset TK_FLAGS TK_FLAGS_ALL

alias diskus="diskus --apparent-size"

alias dust="dust --apparent-size --ignore-directory=.git"
alias dustr="dust --depth=1"
alias dustrr="dust --depth=2"
alias dustrrr="dust --depth=3"
# alias dusta="command dust"
# alias dust="command dust --ignore-directory .git --ignore-directory node_modules"
# alias dusta="command dust --ignore-directory .git"
# alias dust="dust --reverse --number-of-lines=\$(expr \$(tput lines) - 10)"
# export DUST_FLAGS= --reverse"
# alias dust="command dust $DUST_FLAGS --depth=1"
# # alias dust="command dust $DUST_FLAGS --depth=1 | tail --lines=\$(expr \$(tput lines) - 10)"

alias duu='du -ah -d 1 | sort -h | sed s/\\t\.\\//\\t/g | tail'
# alias .du="du -ah * -d 0 | sort -h"
# alias .du="du -d 1 -h"

# alias dff="df -h"
alias dfc="dfc -c always -q mount -d -f -T -m -l"

alias .rclone.conf="subl --new-window $HOME/.config/rclone/rclone.conf"
