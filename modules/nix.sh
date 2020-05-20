export NIX_PAGER="cat"

unalias ni &>/dev/null
unalias ns &>/dev/null

alias nixupd="nix upgrade-nix; nix-channel --update; nix search --update-cache; nix-collect-garbage --delete-old"
alias nixs="nix search"
alias nixsa="nix-env --query --available --description --attr-path --prebuilt-only"

alias nixin="nix-env --install --attr"
alias nixls="nix-env --query --description"
alias nixout="nix-env --query --description --compare-versions"
alias nixrm="nix-env --uninstall"
alias nixupg="nix-env --upgrade"

# function nixs() {
# 	nix-env --query --available --description --attr-path --prebuilt-only ".*$1.*"
# }
# # alias nixs="nix search"
