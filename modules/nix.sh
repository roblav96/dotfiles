export NIX_PAGER=""

unalias ni &>/dev/null
unalias ns &>/dev/null

alias nixupd="nix upgrade-nix; nix search --update-cache"
alias nixs="nix search"
alias nixsa="nix-env --query --available --description --attr-path --prebuilt-only"

alias nixin="nix-env --install"
alias nixls="nix-env --query"
alias nixout="nix-env --query --compare-versions"
alias nixrm="nix-env --uninstall"
alias nixupg="nix-env --upgrade"

# function nixs() {
# 	nix-env --query --available --description --attr-path --prebuilt-only ".*$1.*"
# }
# # alias nixs="nix search"
