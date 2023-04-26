export FZF_DEFAULT_COMMAND="fd --hidden --exclude=.git --exclude=node_modules --type=file"
# export FZF_CTRL_T_COMMAND="fd --hidden --exclude=.git --exclude=node_modules --type=file | cut -b3-"
# export FZF_ALT_C_COMMAND="fd --hidden --exclude=.git --exclude=node_modules --type=directory | cut -b3-"
export FZF_DEFAULT_OPTS="--no-height --no-multi --tabstop=4 --prompt='▶ ' --pointer='▶ ' --color='dark,fg:-1,bg:-1,hl:5,fg+:231,bg+:-1,hl+:5,gutter:-1,info:2,prompt:4,pointer:1,marker:6,spinner:1,header:6'"
export {FZF_CTRL_T_OPTS,FZF_ALT_C_OPTS}="--scheme=path"
export FZF_CTRL_R_OPTS="--scheme=history"
# --color=fg:231,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
# --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef

bindkey '^[r' fzf-history-widget
bindkey '^[t' fzf-file-widget

alias .fzf-fix-cd-widget='sd -s "builtin cd -- " "cd " "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" && exit'
