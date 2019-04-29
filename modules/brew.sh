# ████  Homebrew  ████

function bupdate() {
	echo '\n⬤ [brew] Updating formulas and casks...\n'
	brew update
}

function boutdated() {
	echo '\n⬤ [brew] Outdated formulas\n'
	brew outdated
	echo '\n⬤ [brew] Outdated casks\n'
	brew cask outdated
}

alias bls='blist'
function blist() {
	echo '\n⬤ [brew] List formulas\n'
	brew list --versions
	echo '\n⬤ [brew] List casks\n'
	brew cask list --versions
}
function blspinned() {
	echo '\n⬤ [brew] List pinned formulas\n'
	brew list --versions --pinned
}

function bsearch() {
	echo '\n⬤ [brew] Searching descriptions...\n'
	brew search --desc $@ | grep "$@|"
	echo '\n⬤ [brew] Searching formulas and casks...\n'
	brew search $@ | grep "$@|"
}

function binstall() {
	echo '\n⬤ [brew] Install formula\n'
	brew install $@
}
function bcinstall() {
	echo '\n⬤ [brew] Install cask\n'
	brew cask install $@
}

function bupgrade() {
	echo "\n⬤ [brew] Upgrade '$@'\n"
	brew upgrade $@
}
function bcupgrade() {
	echo "\n⬤ [brew] Upgrade '$@'\n"
	brew cask upgrade $@
}

function bjson() {
	echo '\n⬤ [brew] JSON formula\n'
	brew desc $@
	brew info $@ --json | json
}

function binfo() {
	echo "\n⬤ [brew] Description '$@'\n"
	brew desc $@
	echo "\n⬤ [brew] Info '$@'\n"
	brew info $@
}
function bcinfo() {
	echo "\n⬤ [brew] Info '$@'\n"
	brew cask info $@
}

function bcat() {
	echo '\n⬤ [brew] Cat formula\n'
	brew cat $@ | bat -l=ruby
}
function bccat() {
	echo '\n⬤ [brew] Cat cask\n'
	brew cask cat $@ | bat -l=ruby
}

alias brm='bremove'
function bremove() {
	echo '\n⬤ [brew] Remove formula\n'
	brew remove --force $@
}
alias bcrm='bcremove'
function bcremove() {
	echo "\n⬤ [brew] Remove '$@'\n"
	brew cask remove --force $@
}
