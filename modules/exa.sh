export EXA_COLORS="uu=2;37:gu=2;3;37:da=32:un=31:gn=2;3;31"
export EXA_FLAGS="--long --all --header --classify --group --color-scale --color=always --ignore-glob='.git|.DS_Store'"
# export EXA_STRICT="1"

alias l="exa $EXA_FLAGS"
alias lb="exa $EXA_FLAGS --sort=size"
alias lm="exa $EXA_FLAGS --time=modified --sort=modified"
alias lch="exa $EXA_FLAGS --time=changed --sort=changed"
alias lac="exa $EXA_FLAGS --time=accessed --sort=accessed"
alias lcr="exa $EXA_FLAGS --time=created --sort=created"
alias lr="exa $EXA_FLAGS --git-ignore --tree --recurse --level=2 --ignore-glob='.git|.DS_Store|node_modules'"
alias lra="exa $EXA_FLAGS --git-ignore --tree --recurse --ignore-glob='.git|.DS_Store|node_modules'"
alias la="exa $EXA_FLAGS --extended --modified --changed --created --accessed"
alias lar="exa $EXA_FLAGS --extended --modified --changed --created --accessed --tree --recurse --level=2"
alias lara="exa $EXA_FLAGS --extended --modified --changed --created --accessed --tree --recurse"
