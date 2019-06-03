# ████  Homebrew  ████

function bupdate() {
	echo "\n⭐ Updating formulas and casks..."
	brew update
}

function boutdated() {
	echo "\n⭐ Outdated formulas"
	brew outdated
	echo "\n⭐ Outdated casks"
	brew cask outdated
}

alias bls="blist"
function blist() {
	echo "\n⭐ List formulas"
	brew list --versions
	echo "\n⭐ List casks"
	brew cask list --versions
}
function blspinned() {
	echo "\n⭐ List pinned formulas"
	brew list --versions --pinned
}

function bsearch() {
	echo "\n⭐ Searching descriptions..."
	brew search --desc $@ | grep "$@|"
	echo "\n⭐ Searching formulas and casks..."
	brew search $@ | grep "$@|"
}

function binstall() {
	echo "\n⭐ Install formula"
	brew install $@
}
function bcinstall() {
	echo "\n⭐ Install cask"
	brew cask install $@
}

function bupgrade() {
	echo "\n⭐ Upgrade '$@'"
	brew upgrade $@
}
function bcupgrade() {
	echo "\n⭐ Upgrade '$@'"
	brew cask upgrade $@
}

function bjson() {
	echo "\n⭐ JSON formula"
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
	echo "\n⭐ Info '$@'"
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

alias brm="buninstall"
function buninstall() {
	echo "\n⭐ Uninstall '$@'"
	brew uninstall --force $@
}
alias bcrm="bcuninstall"
function bcuninstall() {
	echo "\n⭐ Uninstall cask '$@'"
	brew cask uninstall --force $@
}
