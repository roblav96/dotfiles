export EXA_COLORS="uu=2;37:gu=2;3;37:da=32:un=31:gn=2;3;31:lc=2;3;37:lm=3;37"
# export EXA_STRICT="1"

local EXA_FLAGS="--long --all --header --classify --group --color-scale"
local EXA_IGNORE="--ignore-glob='.git|.DS_Store'"
# realpath "$(which -p exa)" | grep -q 'HEAD' && EXA_FLAGS="$EXA_FLAGS --icons"

alias la="exa $EXA_FLAGS $EXA_IGNORE --extended --tree --level=1"
alias lar="exa $EXA_FLAGS $EXA_IGNORE --extended --tree --level=2"
alias larr="exa $EXA_FLAGS $EXA_IGNORE --extended --tree --level=3"
alias larrr="exa $EXA_FLAGS $EXA_IGNORE --extended --tree --level=4"
alias larrrr="exa $EXA_FLAGS $EXA_IGNORE --extended --tree --level=5"
alias lara="exa $EXA_FLAGS $EXA_IGNORE --extended --tree"

alias l="exa $EXA_FLAGS $EXA_IGNORE"
alias lt="exa $EXA_FLAGS $EXA_IGNORE --modified --changed --created --accessed"
alias lb="exa $EXA_FLAGS $EXA_IGNORE --sort=size"
alias lm="exa $EXA_FLAGS $EXA_IGNORE --sort=modified --time=modified"
alias lch="exa $EXA_FLAGS $EXA_IGNORE --sort=changed --time=changed"
alias lac="exa $EXA_FLAGS $EXA_IGNORE --sort=accessed --time=accessed"
alias lcr="exa $EXA_FLAGS $EXA_IGNORE --sort=created --time=created"

local EXA_IGNORE="--ignore-glob='.git|.DS_Store|node_modules'"
alias lr="exa $EXA_FLAGS $EXA_IGNORE --git-ignore --tree --level=2"
alias lrr="exa $EXA_FLAGS $EXA_IGNORE --git-ignore --tree --level=3"
alias lrrr="exa $EXA_FLAGS $EXA_IGNORE --git-ignore --tree --level=4"
alias lrrrr="exa $EXA_FLAGS $EXA_IGNORE --git-ignore --tree --level=5"
alias lra="exa $EXA_FLAGS $EXA_IGNORE --git-ignore --tree"

unset EXA_FLAGS EXA_IGNORE
