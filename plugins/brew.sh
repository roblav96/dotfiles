#!/bin/sh

function bupdate {
	echo "⬤ [brew] Updating formulae and casks..."
	brew update
}

function boutdated {
	echo "⬤ [brew] Outdated formulae"
	brew outdated
	echo "⬤ [brew] Outdated casks"
	brew cask outdated
}

alias bls="blist"
function blist {
	echo "⬤ [brew] List formulae"
	brew list --versions
	echo "⬤ [brew] List casks"
	brew cask list --versions
}

function bsearch {
	echo "⬤ [brew] Searching formulae and casks..."
	brew search $@
	brew search --desc $@
	# local -a cmds; cmds=(
	# 	brew search $@
	# 	brew search --desc $@
	# )
	# parallel --jobs 2 cmds
	# parallel ::: cmds
	# brew search $@
	# brew search --desc $@
	# ( brew search $@ & ) > /dev/null &
	# ( brew search --desc $@ & ) > /dev/null &
	# wait
	# echo "[brew] ➤ Searched Formulae and Casks!"
}
# if [[ -n "$DEVING" ]]; then
# 	bsearch java
# fi

function binstall {
	echo "⬤ [brew] Install formula"
	brew install $@ --verbose
}
function bcinstall {
	echo "⬤ [brew] Install cask"
	brew cask install $@ --verbose
}

function bupgrade {
	echo "⬤ [brew] Upgrade formula"
	brew upgrade $@ --verbose
}
function bcupgrade {
	echo "⬤ [brew] Upgrade formula"
	brew cask upgrade $@ --verbose
}

function bjson {
	echo "⬤ [brew] JSON formula"
	brew desc $@
	brew info $@ --json | json
}

function binfo {
	echo "⬤ [brew] Info formula"
	brew desc $@
	brew info $@
}
function bcinfo {
	echo "⬤ [brew] Info cask"
	brew cask info $@
}

function bcat {
	echo "⬤ [brew] Cat formula"
	brew cat $@ | bat -l=ruby
}
function bccat {
	echo "⬤ [brew] Cat cask"
	brew cask cat $@ | bat -l=ruby
}

alias brm="bremove"
function bremove {
	echo "⬤ [brew] Remove formula"
	brew remove $@ --force --verbose
}
alias bcrm="bcremove"
function bcremove {
	echo "⬤ [brew] Remove cask"
	brew cask remove $@ --force --verbose
}
