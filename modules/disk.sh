local tk_flags="--exclude=.git"
local tk_flags_all="--hidden --no-ignore --no-ignore-parent --no-ignore-vcs"
alias tk="tokei $tk_flags --exclude=node_modules"
alias tka="tokei $tk_flags $tk_flags_all"
alias tkf="tokei $tk_flags --exclude=node_modules --files"
alias tkfa="tokei $tk_flags $tk_flags_all --files"
alias tkls="tokei --languages"
unset tk_flags tk_flags_all

# [[ -x "$(which -p diskonaut)" ]] && alias diskonaut="diskonaut --apparent-size"
# [[ -x "$(which -p diskus)" ]] && alias diskus="diskus --apparent-size"
# [[ -x "$(which -p dua)" ]] && alias dua="dua --apparent-size"

alias dust='dust --reverse --ignore-directory=.git'
alias dustr='dust --depth=1'
# alias dusta="command dust"
# alias dust="command dust --ignore-directory .git --ignore-directory node_modules"
# alias dusta="command dust --ignore-directory .git"
# alias dust="dust --reverse --number-of-lines=\$(ty)"
# export DUST_FLAGS= --reverse"
# alias dust="command dust $DUST_FLAGS --depth=1"
# # alias dust="command dust $DUST_FLAGS --depth=1 | tail --lines=\$(ty)"

# alias duu='du -ah -d 1 | sort -h | sed s/\\t\.\\//\\t/g | tail'
# alias .du="du -ah * -d 0 | sort -h"
# alias .du="du -d 1 -h"

# alias dff="df -h"
# alias dfc="dfc -q name -d -f -T -m -l"
