# ████  brew  ████

function bupdate() {
	echo "\n⭐ Updating"
	brew update
}

function boutdated() {
	echo "\n⭐ Outdated Formulas"
	brew outdated
	echo "\n⭐ Outdated Casks"
	brew cask outdated
}

alias bls="blist"
function blist() {
	if [[ -z "$@" ]]; then
		echo "\n⭐ List Formulas"
		brew list --versions
		echo "\n⭐ List Casks"
		brew cask list --versions
	else
		echo "\n⭐ List '$@' files"
		brew list $@
	fi
}
alias blspinned="blistpinned"
function blistpinned() {
	echo "\n⭐ List Pinned Formulas"
	brew list --versions --pinned
}

function bsearch() {
	echo "\n⭐ Searching Descriptions"
	brew search --desc $@ | grep "$@|"
	echo "\n⭐ Searching Formulas & Casks"
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

function bupgrade() {
	echo "\n⭐ Upgrade '$@'"
	brew upgrade $@
}
function bcupgrade() {
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
