# [[ -z "$NODE_NO_WARNINGS" ]] && export NODE_NO_WARNINGS="1"
# [[ -z "$NODE_OPTIONS" ]] && export NODE_OPTIONS="--max-old-space-size=4096"
# [[ -z "$NODE_REPL_HISTORY" ]] && export NODE_REPL_HISTORY=""

# alias n="npm"
alias rr="npm run"
alias npmls="npm --silent ls --depth=0"
alias npmlsa="npm --silent ls"
alias npmo="npm outdated"
alias npmcd='cd $(npm root -g)'

alias npmpublish="ln -s $DOTFILES/.env.npmrc .npmrc || return 1; npm publish; rm .npmrc"

alias npmout="pnpx updates"
alias npmupg="pnpx updates --update && npm install"
alias npmaudit="pnpx auditjs ossi"
alias npmcheck="pnpx npm-check --skip-unused"
alias npmdepcheck="pnpx depcheck"

alias snykt="pnpx snyk test --dev --all-projects --detection-depth=1"
alias npmi='mv package-lock.json .package-lock.json; npm install --ignore-scripts --no-bin-links --package-lock-only; snykt; rm -f package-lock.json; mv .package-lock.json package-lock.json; read -q "?npm install? [y/n]: " || return 1; npm install'

function npmin() {
	local v && for v in "$@"; do
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

[[ ! -x "$(which -p vue)" ]] && alias vue="pnpx --package=@vue/cli-service vue-cli-service"
alias vue.inspect="FORCE_COLOR=0 vue inspect"
# alias vue.inspect='echo "module.exports = $(FORCE_COLOR=0 npx --quiet vue-cli-service inspect)" | bat -lts'

alias nssed="sed -e 's|^JS: ||'$(
	local sedexp=""
	for ((i = 16; i > 0; i--)); do
		sedexp+=" -e 's|^"
		for i in {1..$i}; do sedexp+="  "; done
		sedexp+="|"
		for i in {1..$i}; do sedexp+="\\\t"; done
		sedexp+="|'"
	done
	echo -n $sedexp
)"

# alias ns="env JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home ns"
# alias tns="env JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home tns"

# function nsv() {
# 	local platforms=('android' 'ios')
# 	local platform && for platform in "${platforms[@]}"; do
# 		echo && echo "🌕 $platform"
# 		npm info "tns-$platform" --json | jq --tab '.["dist-tags"]'
# 	done
# }

# [[ -x "$(which -p pnpm)" ]] && source "$HOME/.config/tabtab/zsh/pnpm.zsh"
