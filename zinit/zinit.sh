# zinit load jwilm/alacritty path:extra/completions kind:path
# zinit load junegunn/fzf path:completion.zsh kind:fpath
# zinit load caarlos0/ports kind:path
# zinit load spwhitt/nix-zsh-completions
# zinit load trapd00r/LS_COLORS kind:fpath

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit load mafredri/zsh-async
zinit load caarlos0/zsh-mkc
zinit load rupa/z
zinit load changyuheng/fz.sh
# zinit load changyuheng/zsh-interactive-cd
zinit load Tarrasch/zsh-bd
# zinit load zsh-users/zaw
zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-autosuggestions

# ████  KEEP AT BOTTOM  ████
# zinit load sindresorhus/pure
# zinit load geometry-zsh/geometry
# zinit load zsh-users/zsh-syntax-highlighting
zinit load zdharma/fast-syntax-highlighting
# zinit load zdharma/zui
# zinit load zdharma/zbrowse
zinit load zsh-users/zsh-history-substring-search
