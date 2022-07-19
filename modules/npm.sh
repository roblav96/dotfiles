# [[ -z "$NODE_NO_WARNINGS" ]] && export NODE_NO_WARNINGS="1"
# [[ -z "$NODE_OPTIONS" ]] && export NODE_OPTIONS="--max-old-space-size=4096"
# [[ -z "$NODE_REPL_HISTORY" ]] && export NODE_REPL_HISTORY=""

alias .node-v8-flags="node --help --v8-options | sed -e 's/^  --/\n  --/' -e 's/  default: /\n        default: /' | bl yml"

# alias n="npm"
alias npx="npx --yes"
alias rr="npm run-script"
alias npmls="npm --silent ls --depth=0"
alias npmlsa="npm --silent ls"
alias npmo="npm outdated"
alias npmup="npm outdated | tail -n+2 | awk '{ print \$1 }' | while read i; do npm install \$i@latest; done"
alias npmsa='npm search --searchlimit=$(ty)'
alias npms="npmsa --no-description"
alias npmsr="npm help-search --long"
alias npmcd='cd $(npm root -g)'

alias npmpublish='ln -s "$DOTFILES/configs/.env.npmrc" .npmrc || return 1; npm publish; rm .npmrc'

alias npmout="npx updates"
alias npmupg="npx updates --update && npm install"
alias npmaudit="npx auditjs ossi"
alias npmcheck="npx npm-check --skip-unused"
alias npmdepcheck="npx depcheck"

if [[ "$(id -un)" == "ubuntu" ]]; then
	alias npmupgg="npm outdated -g | grep global$ | awk '{ print \$1 }' | while read i; do (echo && echo \"🟡 '\$i'\" && sudo npm install -g \$i); done"
else
	alias npmupgg="npm outdated -g | grep global$ | awk '{ print \$1 }' | while read i; do (echo && echo \"🟡 '\$i'\" && npm install -g \$i); done"
fi

alias snykt="npx snyk test --dev --all-projects --detection-depth=1"
function snyknpm() {
	cat package.json >/dev/null || return 1
	[[ -e package-lock.json ]] && mv package-lock.json .package-lock.json
	npm install --ignore-scripts --no-bin-links --package-lock-only
	snykt
	rm package-lock.json
	[[ -e .package-lock.json ]] && mv .package-lock.json package-lock.json
}

alias npmi="npm install --prefer-offline --ignore-scripts"
function npmia() {
	fd --exclude=.git --exclude=node_modules --min-depth=2 --max-depth=3 --glob package.json
	fd --exclude=.git --exclude=node_modules --min-depth=2 --max-depth=3 --glob package.json --exec npm install --prefer-offline --ignore-scripts '{//}'
}

alias npmin="npm install --prefer-offline"
alias npmrm="npm uninstall --prefer-offline"
function npmv() {
	npm info --json "$@" | jq --tab '.time'
}

which final-pm &>/dev/null || alias final-pm="npx final-pm" # ; alias fpm="final-pm"
which insect &>/dev/null || alias insect="npx insect"
which forever &>/dev/null || alias forever="npx forever"
which pm2 &>/dev/null || alias pm2="npx pm2"
which rush &>/dev/null || alias rush="npx --package=@microsoft/rush rush"
which rushx &>/dev/null || alias rushx="npx --package=@microsoft/rush rushx"
which ts-node &>/dev/null || alias ts-node="npx ts-node"
which tsc &>/dev/null || alias tsc="npx --package=typescript tsc"

which vue &>/dev/null || alias vue="npx --package=@vue/cli-service vue-cli-service"
alias vueinspect="FORCE_COLOR=0 vue inspect"
# alias vue-inspect='echo "module.exports = $(FORCE_COLOR=0 npx --quiet vue-cli-service inspect)" | bat -l ts'

function nsc() {
	npm info "@nativescript/$@" && ns create "$@" --template "@nativescript/$@" || return 1
	cd "$@"
	command rm -rf .git .vscode .editorconfig
	# sed -i 's/": "~/": "^/' package.json
	# npm install --save-dev @nativescript/android
	prettier --write .
	ns platform add android
	# [[ -e webpack.config.js ]] && rm webpack.config.js
	# npx nativescript-webpack init
}
alias nscls="curl https://api.github.com/repos/NativeScript/nativescript-app-templates/contents/packages | json 'map(.name)'"

# alias sedt2="sed -e 's#^JS: ##'$(
# 	local sedexp=""
# 	for ((i = 16; i > 0; i--)); do
# 		sedexp+=" -e 's#^"
# 		for i in {1..$i}; do sedexp+="  "; done
# 		sedexp+="#"
# 		for i in {1..$i}; do sedexp+="\\\t"; done
# 		sedexp+="#'"
# 	done
# 	echo -n $sedexp
# )"

# alias ns="env JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home ns"
# alias tns="env JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home tns"

# function nsv() {
# 	local platforms=('android' 'ios')
# 	local platform && for platform in "${platforms[@]}"; do
# 		echo && echo "🟡 $platform"
# 		npm info "tns-$platform" --json | jq --tab '.["dist-tags"]'
# 	done
# }

# [[ -x "$(which -p pnpm)" ]] && source "$HOME/.config/tabtab/zsh/pnpm.zsh"
