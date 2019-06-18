# ████  Homebrew  ████

function bupd() {
	echo "\n⭐ Updating"
	brew update
}

function boutd() {
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

function bfiles() {
	echo "\n⭐ List '$@' files"
	brew list $@
}

function blpinned() {
	echo "\n⭐ List pinned formulas"
	brew list --versions --pinned
}

function bsearch() {
	echo "\n⭐ Searching descriptions"
	brew search --desc $@ | grep "$@|"
	echo "\n⭐ Searching formulas & casks"
	brew search $@ | grep "$@|"
}

function binstall() {
	echo "\n⭐ Install '$@'"
	brew install $@
}
function bcinstall() {
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

function bjson() {
	echo "\n⭐ JSON '$@'"
	brew desc $@
	brew info $@ --json | json
}

function binfo() {
	echo "\n⭐ Description '$@'"
	brew desc $@
	echo "\n⭐ Info '$@'"
	brew info $@
}
function bcinfo() {
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
	brew cask uninstall --force $@
}

function bsls() {
	echo "\n⭐ List services"
	brew services list
}
function bsstop() {
	echo "\n⭐ Stop service '$@'"
	brew services stop $@
}
function bsstart() {
	echo "\n⭐ Start service '$@'"
	brew services start $@
}
function bsrestart() {
	echo "\n⭐ Restart service '$@'"
	brew services restart $@
}
function bsrun() {
	echo "\n⭐ Run service '$@'"
	brew services run $@
}
