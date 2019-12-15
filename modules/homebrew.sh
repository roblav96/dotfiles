# ████  Homebrew  ████

# export HOMEBREW_DEV_CMD_RUN="0"
# export HOMEBREW_NO_ANALYTICS="1"
# export HOMEBREW_NO_ANALYTICS_THIS_RUN="1"

function bupd() {
	echo; echo "🌕 Updating taps..."
	brew update --verbose
}

function bout() {
	echo; echo "🌕 Outdated formulas"
	brew outdated --verbose
	echo; echo "🌕 Outdated casks"
	brew cask outdated --verbose --greedy | grep --invert-match "latest"
}

function bls() {
	echo; echo "🌕 List formulas"
	brew list --versions
	echo; echo "🌕 List casks"
	brew cask list --versions
}

function blsp() {
	echo; echo "🌕 Pinned formulas"
	brew list --versions --pinned
}

function bs() {
	echo; echo "🌕 Searching descriptions"
	brew search --desc "$*" | rg --passthru --ignore-case --fixed-strings "$*"
	echo; echo "🌕 Searching names"
	brew search "$*" | rg --passthru --ignore-case --fixed-strings "$*"
}

function bin() {
	echo; echo "🌕 Install formula '$@'"
	brew install $@
}
function brein() {
	echo; echo "🌕 Reinstall formula '$@'"
	brew reinstall $@
}
function bfs() {
	echo; echo "🌕 Files installed '$@'"
	brew list $@
}
function bcin() {
	echo; echo "🌕 Install cask '$@'"
	brew cask install $@
}
function bcrein() {
	echo; echo "🌕 Reinstall cask '$@'"
	brew cask reinstall $@
}

function bupg() {
	echo; echo "🌕 Upgrade formula '$@'"
	brew upgrade $@
}
function bcupg() {
	echo; echo "🌕 Upgrade cask '$@'"
	brew cask upgrade $@
}

function bjson() {
	echo; echo "🌕 JSON formula '$@'"
	brew desc $@
	brew info $@ --json | json
}

function bi() {
	for v in "$@"; do
		echo; echo "🌕 Description formula '$v'"
		brew desc $v
		echo; echo "🌕 Info formula '$v'"
		brew info $v
	done
}
function bci() {
	for v in "$@"; do
		echo; echo "🌕 Info cask '$v'"
		brew cask info $v
	done
}

function bcat() {
	echo; echo "🌕 Cat formula '$@'"
	brew cat $@ | prettier --parser ruby | bat -l rb
}
function bccat() {
	echo; echo "🌕 Cat cask '$@'"
	brew cask cat $@ | prettier --parser ruby | bat -l rb
}

function bopen() {
	echo; echo "🌕 Open formula '$@'"
	brew home $@
}
function bcopen() {
	echo; echo "🌕 Open cask '$@'"
	brew cask home $@
}

function brm() {
	echo; echo "🌕 Uninstall formula '$@'"
	brew uninstall --force $@
}
function bcrm() {
	echo; echo "🌕 Uninstall cask '$@'"
	brew cask zap --force $@
}

function bsls() {
	echo; echo "🌕 List services"
	brew services list
}
function bsdown() {
	echo; echo "🌕 Stop service '$@'"
	brew services stop $@
	brew services list
}
function bsup() {
	echo; echo "🌕 Start service '$@'"
	brew services restart $@
	brew services list
}
function bsre() {
	echo; echo "🌕 Restart service '$@'"
	brew services restart $@
	brew services list
}
function bsrun() {
	echo; echo "🌕 Run service '$@'"
	brew services run $@
}
