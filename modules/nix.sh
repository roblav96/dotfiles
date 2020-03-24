export NIX_PAGER=""

unalias ni &>/dev/null
unalias ns &>/dev/null

alias nxin="nix-env --install"
alias nxls="nix-env --query"
alias nxout="nix-env --query --compare-versions"
alias nxrm="nix-env --uninstall"
alias nxupd="nix search --update-cache"
alias nxupg="nix-env --upgrade"

function nxs() {
	nix-env --query --available --description --attr-path --prebuilt-only ".*$1.*"
}
# alias nxs="nix search"
