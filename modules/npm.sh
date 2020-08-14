# export NODE_NO_WARNINGS="1"
# export NODE_OPTIONS="--max-old-space-size=4096"
export NODE_REPL_HISTORY=""

# alias n="npm"
alias rr="npm run"
alias npmls="npm --silent ls --depth=0"
alias npmlsa="npm --silent ls"
alias npmo="npm outdated --long"
alias npmcd='cd $(npm root -g)'

alias npmpublish="ln -s $DOTFILES/.env.npmrc .npmrc || return 1; npm publish; rm .npmrc"

alias npmout="pnpx -p updates@10.3.3 updates"
alias npmupg="pnpx -p updates@10.3.3 updates --update"
alias npmaudit="pnpx auditjs ossi"
alias npmcheck="pnpx npm-check --skip-unused"
alias npmdepcheck="pnpx depcheck"

alias snykt="pnpx snyk test --dev --all-projects --detection-depth=1"
alias npmi='mv package-lock.json .package-lock.json; npm install --ignore-scripts --no-bin-links --package-lock-only; snykt; rm -f package-lock.json; mv .package-lock.json package-lock.json; read -q "?npm install? [y/n]: " || return 1; npm install'

function npmin() {
	local v; for v in "$@"; do
		npm install "$v" && npm install -D "@types/$v"
	done
}
function npmrm() {
	npm uninstall "$@" "@types/$@"
}
function npmv() {
	npm info --json "$@" | jq --tab '.time'
}

[[ ! -x "$(which -p final-pm)" ]] && alias final-pm="pnpx final-pm" # ; alias fpm="final-pm"
[[ ! -x "$(which -p forever)" ]] && alias forever="pnpx forever"
[[ ! -x "$(which -p pm2)" ]] && alias pm2="pnpx pm2"
[[ ! -x "$(which -p tsc)" ]] && alias tsc="pnpx --package=typescript tsc"
# [[ ! -x "$(which -p rush)" ]] && alias rush="pnpx --package=@microsoft/rush rush"
# [[ ! -x "$(which -p rushx)" ]] && alias rushx="pnpx --package=@microsoft/rush rushx"

alias vue="pnpx --package=@vue/cli-service vue-cli-service"
alias vue.inspect="FORCE_COLOR=0 vue inspect"
# alias vue.inspect='echo "module.exports = $(FORCE_COLOR=0 npx --quiet vue-cli-service inspect)" | bat -lts'

function tnsv() {
	local platforms=('android' 'ios')
	local platform; for platform in "${platforms[@]}"; do
		echo; echo "🌕 $platform"
		npm info "tns-$platform" --json | jq --tab '.["dist-tags"]'
	done
}

# [[ -x "$(which -p pnpm)" ]] && source "$HOME/.config/tabtab/zsh/pnpm.zsh"
