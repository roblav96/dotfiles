# ████  Homebrew  ████

# export HOMEBREW_DEV_CMD_RUN="0"
export HOMEBREW_NO_ANALYTICS_THIS_RUN="1"

function bupd() {
	echo "\n⭐ Updating"
	brew update
}

function bout() {
	echo "\n⭐ Outdated formulas"
	brew outdated
	echo "\n⭐ Outdated casks"
	brew cask outdated
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

function bins() {
	echo "\n⭐ Install '$@'"
	brew install $@
}
function bcins() {
	echo "\n⭐ Install cask '$@'"
	brew cask install $@
}

function bupg() {
	echo "\n⭐ Upgrade '$@'"
	brew upgrade $@
}
function bcupg() {
	echo "\n⭐ Upgrade cask '$@'"
	brew cask upgrade $@
}

function bjs() {
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
	brew cat $@ | bat -l=ruby
}
function bccat() {
	echo "\n⭐ Cat cask '$@'"
	brew cask cat $@ | bat -l=ruby
}

function bop() {
	echo "\n⭐ Open '$@'"
	brew home $@
}
function bcop() {
	echo "\n⭐ Open cask '$@'"
	brew cask home $@
}

function brm() {
	echo "\n⭐ Uninstall '$@'"
	brew uninstall --force $@
}
function bcrm() {
	echo "\n⭐ Uninstall cask '$@'"
	brew cask uninstall --force $@
}

function bsls() {
	echo "\n⭐ List services"
	brew services list
}
function bssp() {
	echo "\n⭐ Stop service '$@'"
	brew services stop $@
}
function bsst() {
	echo "\n⭐ Start service '$@'"
	brew services start $@
}
function bsre() {
	echo "\n⭐ Restart service '$@'"
	brew services restart $@
}
function bsr() {
	echo "\n⭐ Run service '$@'"
	brew services run $@
}
