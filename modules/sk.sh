export SKIM_DEFAULT_OPTIONS="--layout=default --no-height --no-multi --tabstop=4 --prompt='▶ ' --color=dark,fg:-1,bg:-1,matched:5,current:231,current_bg:-1,current_match:5,info:0,border:-1,prompt:4,pointer:1,marker:6,spinner:1,header:6"
# export SKIM_ALT_C_OPTS="--layout=default"
# export SKIM_CTRL_R_OPTS="--no-height"
# --color=fg:231,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
# --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef

local sk_base="$(dirname $(dirname $(realpath $(which -p sk))))"
source "$sk_base/share/zsh/site-functions/completion.zsh"
source "$sk_base/share/zsh/site-functions/key-bindings.zsh"
unset sk_base

bindkey '^[r' skim-history-widget
bindkey '^[t' skim-file-widget
