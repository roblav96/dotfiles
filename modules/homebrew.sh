# ████  Homebrew  ████

# export HOMEBREW_DEV_CMD_RUN="0"
# export HOMEBREW_NO_ANALYTICS="1"
# export HOMEBREW_NO_ANALYTICS_THIS_RUN="1"

function bupd() {
	echo "\n⭐ Updating"
	brew update --verbose
}

function bout() {
	echo "\n⭐ Outdated formulas"
	brew outdated --verbose
	echo "\n⭐ Outdated casks"
	brew cask outdated --verbose --greedy | grep -v latest
}

function bls() {
	echo "\n⭐ List formulas"
	brew list --versions
	echo "\n⭐ List casks"
	brew cask list --versions
}

function bfs() {
	echo "\n⭐ List '$@' files"
	brew list $@
}

function blsp() {
	echo "\n⭐ List pinned formulas"
	brew list --versions --pinned
}

function bs() {
	echo "\n⭐ Searching descriptions"
	brew search --desc $@ | grep "$@|"
	echo "\n⭐ Searching formulas & casks"
	brew search $@ | grep "$@|"
}

function bin() {
	echo "\n⭐ Install '$@'"
	brew install $@
}
function brein() {
	echo "\n⭐ Reinstall '$@'"
	brew reinstall $@
}
function bcin() {
	echo "\n⭐ Install cask '$@'"
	brew cask install $@
}
function bcrein() {
	echo "\n⭐ Reinstall cask '$@'"
	brew cask reinstall $@
}

function bupg() {
	echo "\n⭐ Upgrade '$@'"
	brew upgrade $@
}
function bcupg() {
	echo "\n⭐ Upgrade cask '$@'"
	brew cask upgrade $@
}

function bjson() {
	echo "\n⭐ JSON '$@'"
	brew desc $@
	brew info $@ --json | json
}

function bi() {
	echo "\n⭐ Description '$@'"
	brew desc $@
	echo "\n⭐ Info '$@'"
	brew info $@
}
function bci() {
	echo "\n⭐ Info cask '$@'"
	brew cask info $@
}

function bcat() {
	echo "\n⭐ Cat '$@'"
	brew cat $@ | bat --language ruby
}
function bccat() {
	echo "\n⭐ Cat cask '$@'"
	brew cask cat $@ | bat --language ruby
}

function bopen() {
	echo "\n⭐ Open '$@'"
	brew home $@
}
function bcopen() {
	echo "\n⭐ Open cask '$@'"
	brew cask home $@
}

function brm() {
	echo "\n⭐ Uninstall '$@'"
	brew uninstall --force $@
}
function bcrm() {
	echo "\n⭐ Uninstall cask '$@'"
	brew cask zap --force $@
}

function bsls() {
	echo "\n⭐ List services"
	brew services list
}
function bsdown() {
	echo "\n⭐ Stop service '$@'"
	brew services stop $@; brew services list
}
function bsup() {
	echo "\n⭐ Start service '$@'"
	brew services restart $@; brew services list
}
function bsre() {
	echo "\n⭐ Restart service '$@'"
	brew services restart $@; brew services list
}
function bsrun() {
	echo "\n⭐ Run service '$@'"
	brew services run $@
}
