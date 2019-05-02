# ████  Homebrew  ████

function bupdate() {
	echo '⬤ Updating formulas and casks...'
	brew update
}

function boutdated() {
	echo '⬤ Outdated formulas'
	brew outdated
	echo '⬤ Outdated casks'
	brew cask outdated
}

alias bls='blist'
function blist() {
	echo '⬤ List formulas'
	brew list --versions
	echo '⬤ List casks'
	brew cask list --versions
}
function blspinned() {
	echo '⬤ List pinned formulas'
	brew list --versions --pinned
}

function bsearch() {
	echo '⬤ Searching descriptions...'
	brew search --desc $@ | grep "$@|"
	echo '⬤ Searching formulas and casks...'
	brew search $@ | grep "$@|"
}

function binstall() {
	echo '⬤ Install formula'
	brew install $@
}
function bcinstall() {
	echo '⬤ Install cask'
	brew cask install $@
}

function bupgrade() {
	echo "⬤ Upgrade '$@'"
	brew upgrade $@
}
function bcupgrade() {
	echo "⬤ Upgrade '$@'"
	brew cask upgrade $@
}

function bjson() {
	echo '⬤ JSON formula'
	brew desc $@
	brew info $@ --json | json
}

function binfo() {
	echo "⬤ Description '$@'"
	brew desc $@
	echo "⬤ Info '$@'"
	brew info $@
}
function bcinfo() {
	echo "⬤ Info '$@'"
	brew cask info $@
}

function bcat() {
	echo '⬤ Cat formula'
	brew cat $@ | bat -l=ruby
}
function bccat() {
	echo '⬤ Cat cask'
	brew cask cat $@ | bat -l=ruby
}

alias brm='bremove'
function bremove() {
	echo '⬤ Remove formula'
	brew remove --force $@
}
alias bcrm='bcremove'
function bcremove() {
	echo "⬤ Remove '$@'"
	brew cask remove --force $@
}
