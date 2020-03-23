export NIX_PAGER=""

unalias ni &>/dev/null
unalias ns &>/dev/null

alias nxin="nix-env --install"
alias nxls="nix-env --query"
alias nxout="nix-env -qc"
alias nxrm="nix-env --uninstall"
alias nxs="nix search"
alias nxupd="nix search --update-cache"
alias nxupg="nix-env --upgrade"
