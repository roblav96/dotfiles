export NODE_OPTIONS="--max-old-space-size=2048"
export NODE_REPL_HISTORY=""

# alias n="npm"
alias rr="npm run"
alias npmls="npm --silent ls --depth=0"
alias npmlsa="npm --silent ls"
alias npmo="npm outdated --long"

alias npm.publish="ln -s $DOTFILES/.env.npmrc .npmrc || return 1; npm publish; rm .npmrc"

alias npmout="pnpx --quiet updates"
alias npmupg="pnpx --quiet updates --update"
alias npmaudit="pnpx --quiet auditjs ossi"
alias npmcheck="pnpx --quiet npm-check --skip-unused"
alias npmdepcheck="pnpx --quiet depcheck"

alias snykt="pnpx --quiet snyk test --dev --all-projects --detection-depth=1"
alias npmi='mv package-lock.json .package-lock.json; npm install --ignore-scripts --no-bin-links --package-lock-only; snykt; rm -f package-lock.json; mv .package-lock.json package-lock.json; read -q "?npm install? [y/n]: " || return 1; npm install'

function npmin() {
	npm install "$@" && npm install -D "@types/$@"
}
function npmrm() {
	npm uninstall "$@" "@types/$@"
}
function npmv() {
	npm info --json $@ | jq --color-output --tab '.time'
}

[[ ! -x "$(which -p final-pm)" ]] && alias final-pm="pnpx --quiet final-pm"; alias fpm="final-pm"
[[ ! -x "$(which -p forever)" ]] && alias forever="pnpx --quiet forever"
[[ ! -x "$(which -p ipcalc)" ]] && alias tsc="pnpx --quiet --package=ipcalc-cli ipcalc"
[[ ! -x "$(which -p pm2)" ]] && alias pm2="pnpx --quiet pm2"
[[ ! -x "$(which -p tsc)" ]] && alias tsc="pnpx --quiet --package=typescript tsc"

alias vue="pnpx --quiet --package=@vue/cli-service vue-cli-service"
alias vue.inspect="FORCE_COLOR=0 vue inspect"
# alias vue.inspect='echo "module.exports = $(FORCE_COLOR=0 npx vue-cli-service inspect)" | bat -lts'

# [[ -x "$(which -p pnpm)" ]] && source "$HOME/.config/tabtab/zsh/pnpm.zsh"
