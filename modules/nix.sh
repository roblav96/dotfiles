export NIX_PAGER=""

unalias ni &>/dev/null
unalias ns &>/dev/null

alias nin="nix-env --install"
alias nls="nix-env --query"
alias nout="nix-env -qc"
alias nrm="nix-env --uninstall"
alias ns="nix search"
alias nupd="nix search --update-cache"
alias nupg="nix-env --upgrade"
