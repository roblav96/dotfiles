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

function binstall {
	echo "⬤ [brew] Install formula"
	brew install $@ --verbose
}

function bcinstall {
	echo "⬤ [brew] Install cask"
	brew cask install $@ --verbose
}

alias bls="blist"
function blist {
	echo "⬤ [brew] List formulae"
	brew list --versions
	echo "⬤ [brew] List casks"
	brew cask list --versions
}

function bsearch {
	echo "⬤ [brew] Searching Formulae and Casks..."
	local -a cmds; cmds=(
		brew search $@
		brew search --desc $@
	)
	parallel --jobs 2 cmds
	# parallel ::: cmds
	# brew search $@
	# brew search --desc $@
	# ( brew search $@ & ) > /dev/null &
	# ( brew search --desc $@ & ) > /dev/null &
	# wait
	# echo "[brew] ➤ Searched Formulae and Casks!"
	# brew search $@ &
	# brew search --desc $@ &
	# wait
}
# if [[ -n "$DEVING" ]]; then
# 	bsearch java
# fi

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
	echo "⬤ [brew] Info Cask"
	brew cask info $@
}

function bcat {
	echo "⬤ [brew] Cat Formula"
	brew cat $@ | bat -l=ruby
}
function bccat {
	echo "⬤ [brew] Cat Cask"
	brew cask cat $@ | bat -l=ruby
}
