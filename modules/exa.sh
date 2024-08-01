export EXA_COLORS="uu=2;37:gu=2;3;37:da=32:un=31:gn=2;3;31:lc=2;3;37:lm=3;37"
# export EXA_STRICT="1"

local exa_flags="--long --all --header --classify --group --color-scale"
local exa_ignore='--ignore-glob=".git|.DS_Store"'
# realpath "$(which -p eza)" | grep -q 'HEAD' && exa_flags="$exa_flags --icons"

alias la="eza $exa_flags $exa_ignore --extended --tree --level=1"
alias lar="eza $exa_flags $exa_ignore --extended --tree --level=2"
alias larr="eza $exa_flags $exa_ignore --extended --tree --level=3"
alias larrr="eza $exa_flags $exa_ignore --extended --tree --level=4"
alias larrrr="eza $exa_flags $exa_ignore --extended --tree --level=5"
alias lara="eza $exa_flags $exa_ignore --extended --tree"

alias l="eza $exa_flags $exa_ignore"
alias lt="eza $exa_flags $exa_ignore --modified --changed --created --accessed"

alias lb="eza $exa_flags $exa_ignore --sort=size" && alias lbt='lb --color=always | tail --lines=$(ty)'
alias lm="eza $exa_flags $exa_ignore --sort=modified --time=modified" && alias lmt='lm --color=always | tail --lines=$(ty)'
alias lch="eza $exa_flags $exa_ignore --sort=changed --time=changed" && alias lcht='lch --color=always | tail --lines=$(ty)'
alias lac="eza $exa_flags $exa_ignore --sort=accessed --time=accessed" && alias lact='lac --color=always | tail --lines=$(ty)'
alias lcr="eza $exa_flags $exa_ignore --sort=created --time=created" && alias lcrt='lcr --color=always | tail --lines=$(ty)'

local exa_ignore='--ignore-glob=".git|.DS_Store|node_modules"' # --git-ignore'
alias lr="eza $exa_flags $exa_ignore --tree --level=2"
alias lrr="eza $exa_flags $exa_ignore --tree --level=3"
alias lrrr="eza $exa_flags $exa_ignore --tree --level=4"
alias lrrrr="eza $exa_flags $exa_ignore --tree --level=5"
alias lra="eza $exa_flags $exa_ignore --tree"

alias lrab="eza $exa_flags $exa_ignore --tree --sort=size"
alias lram="eza $exa_flags $exa_ignore --tree --sort=modified --time=modified"
alias lrach="eza $exa_flags $exa_ignore --tree --sort=changed --time=changed"
alias lraac="eza $exa_flags $exa_ignore --tree --sort=accessed --time=accessed"
alias lracr="eza $exa_flags $exa_ignore --tree --sort=created --time=created"

unset exa_flags exa_ignore
