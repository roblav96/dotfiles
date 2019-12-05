export FZF_DEFAULT_OPTS="
	--no-multi
	--tabstop=4
	--height=$(expr $(tput lines) - 5)
	--prompt='$PURE_PROMPT_SYMBOL '
	--color=dark
	--color=fg:-1,bg:-1,hl:5,fg+:231,bg+:-1,hl+:5
	--color=gutter:-1,info:2,prompt:4,pointer:1,marker:6,spinner:1,header:6
"
# --color=fg:231,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
# --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef

bindkey '^[r' fzf-history-widget
# bindkey '^F' fzf-history-widget
# bindkey '^F' fzf-history-widget
