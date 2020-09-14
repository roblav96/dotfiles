export EXA_COLORS="uu=2;37:gu=2;3;37:da=32:un=31:gn=2;3;31:lc=2;3;37:lm=3;37"
# export EXA_STRICT="1"

local exa_flags="--long --all --header --classify --group --color-scale"
local exa_ignore="--ignore-glob='.git|.DS_Store'"
# realpath "$(which -p exa)" | grep -q 'HEAD' && exa_flags="$exa_flags --icons"

alias la="exa $exa_flags $exa_ignore --extended --tree --level=1"
alias lar="exa $exa_flags $exa_ignore --extended --tree --level=2"
alias larr="exa $exa_flags $exa_ignore --extended --tree --level=3"
alias larrr="exa $exa_flags $exa_ignore --extended --tree --level=4"
alias larrrr="exa $exa_flags $exa_ignore --extended --tree --level=5"
alias lara="exa $exa_flags $exa_ignore --extended --tree"

alias l="exa $exa_flags $exa_ignore"
alias lt="exa $exa_flags $exa_ignore --modified --changed --created --accessed"
alias lb="exa $exa_flags $exa_ignore --sort=size"
alias lm="exa $exa_flags $exa_ignore --sort=modified --time=modified"
alias lch="exa $exa_flags $exa_ignore --sort=changed --time=changed"
alias lac="exa $exa_flags $exa_ignore --sort=accessed --time=accessed"
alias lcr="exa $exa_flags $exa_ignore --sort=created --time=created"

local exa_ignore="--ignore-glob='.git|.DS_Store|node_modules'"
alias lr="exa $exa_flags $exa_ignore --git-ignore --tree --level=2"
alias lrr="exa $exa_flags $exa_ignore --git-ignore --tree --level=3"
alias lrrr="exa $exa_flags $exa_ignore --git-ignore --tree --level=4"
alias lrrrr="exa $exa_flags $exa_ignore --git-ignore --tree --level=5"
alias lra="exa $exa_flags $exa_ignore --git-ignore --tree"

unset exa_flags exa_ignore
