export HOMEBREW_AUTO_UPDATE_SECS="3600"
export HOMEBREW_DISPLAY_INSTALL_TIMES="1"
export HOMEBREW_INSTALL_BADGE="✅"
export HOMEBREW_NO_AUTO_UPDATE="1"
export HOMEBREW_NO_INSECURE_REDIRECT="1"
# export HOMEBREW_DEV_CMD_RUN="0"
# export HOMEBREW_NO_ANALYTICS="1"
# export HOMEBREW_NO_ANALYTICS_THIS_RUN="1"

# if [[ -e "/usr/local/etc/bash_completion.d/pueue.bash" ]]; then
# 	source "/usr/local/etc/bash_completion.d/pueue.bash"
# fi

alias bh="brew commands --quiet"

function bupd() {
	echo; echo "🌕 Updating taps"
	brew update --verbose
}
function bout() {
	echo; echo "🌕 Outdated formulas"
	brew outdated --verbose
	if [[ "$PLATFORM" != "Linux" ]]; then
		echo; echo "🌕 Outdated casks"
		brew cask outdated --verbose --greedy | grep --invert-match 'latest'
	fi
}
function bls() {
	echo; echo "🌕 List formulas"
	brew list --versions
}
function bcls() {
	echo; echo "🌕 List casks"
	brew cask list --versions
}
alias blsa="bls; bcls"
function bpls() {
	echo; echo "🌕 Pinned formulas"
	brew list --versions --pinned
}

function bs() {
	for v in "$@"; do
		echo; echo "🌕 Searching descriptions -> '$v'"
		brew search --desc "$v" | rgpw "$v"
		echo; echo "🌕 Searching names -> '$v'"
		brew search "$v" | rgpw "$v"
	done
}

function bin() {
	for v in "$@"; do
		echo; echo "🌕 Installing formula -> '$v'"
		brew install "$v"
		# [[ "$PLATFORM" == "Linux" ]] && bin-linux "$v"
	done
}
function bcin() {
	for v in "$@"; do
		echo; echo "🌕 Installing cask -> '$v'"
		brew cask install "$v"
	done
}

function brein() {
	for v in "$@"; do
		echo; echo "🌕 Reinstalling formula -> '$v'"
		brew reinstall "$v"
		# [[ "$PLATFORM" == "Linux" ]] && bin-linux "$v"
	done
}; compdef brein=command
function bcrein() {
	for v in "$@"; do
		echo; echo "🌕 Reinstalling cask -> '$v'"
		brew cask reinstall "$v"
	done
}; compdef bcrein=command

function bupg() {
	for v in "$@"; do
		echo; echo "🌕 Upgrading formula -> '$v'"
		brew upgrade "$v"
		# [[ "$PLATFORM" == "Linux" ]] && bin-linux "$v"
	done
}; compdef bupg=command
function bcupg() {
	for v in "$@"; do
		echo; echo "🌕 Upgrading cask -> '$v'"
		brew cask upgrade "$v"
	done
}; compdef bcupg=command

function bi() {
	for v in "$@"; do
		echo; echo "🌕 Info formula -> '$v'"
		brew desc "$v" && brew info "$v"
	done
}; compdef bi=command
function bci() {
	for v in "$@"; do
		echo; echo "🌕 Info cask -> '$v'"
		brew cask info "$v"
	done
}; compdef bci=command

function bcd() {
	cd "$(brew --prefix)/opt/$1"
}; compdef bcd=command
function bfs() {
	for v in "$@"; do
		echo; echo "🌕 Files formula -> '$v'"
		brew list "$v"
	done
}; compdef bfs=command
function bfsa() {
	for v in "$@"; do
		echo; echo "🌕 All files formula -> '$v'"
		lara "$(brew --prefix)/opt/$v/"
	done
}; compdef bfsa=command
function bjson() {
	for v in "$@"; do
		echo; echo "🌕 JSON formula -> '$v'"
		brew desc "$v" && brew info "$v" --json | json
	done
}; compdef bjson=command
function bdep() {
	for v in "$@"; do
		echo; echo "🌕 Dependencies formula -> '$v'"
		brew deps "$v" -n --tree
	done
}; compdef bdep=command

function bcat() {
	for v in "$@"; do
		echo; echo "🌕 Cat formula -> '$v'"
		brew cat "$v" | pbat ruby
	done
}; compdef bcat=command
function bccat() {
	for v in "$@"; do
		echo; echo "🌕 Cat cask -> '$v'"
		brew cask cat "$v" | pbat ruby
	done
}; compdef bccat=command

function bia() {
	for v in "$@"; do
		bi "$v" && bcat "$v"
	done
}; compdef bia=command
function bcia() {
	for v in "$@"; do
		bci "$v" && bccat "$v"
	done
}; compdef bcia=command

function bo() {
	for v in "$@"; do
		echo; echo "🌕 Opening formula -> '$v'"
		brew home "$v"
	done
}; compdef bo=command
function bco() {
	for v in "$@"; do
		echo; echo "🌕 Opening cask -> '$v'"
		brew cask home "$v"
	done
}; compdef bco=command

function brm() {
	for v in "$@"; do
		# [[ "$PLATFORM" == "Linux" ]] && bin-linux "$v"
		echo; echo "🌕 Uninstalling formula -> '$v'"
		brew uninstall --force "$v"
	done
}; compdef brm=command
function bcrm() {
	for v in "$@"; do
		echo; echo "🌕 Uninstalling cask -> '$v'"
		brew cask zap --force "$v"
	done
}; compdef bcrm=command

function bsls() {
	echo; echo "🌕 List services"
	brew services list
}
function bsdown() {
	for v in "$@"; do
		echo; echo "🌕 Stopping service -> '$v'"
		brew services stop "$v"
	done
	echo; brew services list
}
function bsup() {
	for v in "$@"; do
		echo; echo "🌕 Starting service -> '$v'"
		brew services restart "$v"
	done
	echo; brew services list
}
function bsre() {
	for v in "$@"; do
		echo; echo "🌕 Restarting service -> '$v'"
		brew services restart "$v"
	done
	echo; brew services list
}
function bsrun() {
	for v in "$@"; do
		echo; echo "🌕 Running service -> '$v'"
		brew services run "$v"
	done
	echo; brew services list
}

function bin-linux() {
	local prefix="$(brew --prefix)/opt/$1"
	[[ ! -d "$prefix" ]] && return
	prefix="$(realpath $prefix)"
	[[ "$PLATFORM" == "Linux" ]] && bfsa "$1"
	local install=""
	local remove=""
	local bins=('bin' 'sbin')
	local bin; for bin in "${bins[@]}"; do
		if [[ -d "$prefix/$bin" ]]; then
			local xfile; for xfile in $prefix/$bin/*; do
				install="$install sudo cp -v '$(realpath "$xfile")' '/usr/local/$bin/${xfile##*/}' && sudo chmod -v u+w '/usr/local/$bin/${xfile##*/}';"
				remove="$remove sudo rm -fv '/usr/local/$bin/${xfile##*/}';"
			done
		fi
	done
	local others=('etc' 'include' 'lib' 'libexec' 'share')
	local other; for other in "${others[@]}"; do
		if [[ -d "$prefix/$other" ]]; then
			# local head="${other%%/*}"
			# local tail="${other##*/}"
			install="$install sudo cp -vr '$prefix/$other/'* '/usr/local/$other';"
			# install="$install sudo cp -vr '$prefix/$other/'* '/usr/local/$tail';"
			if [[ "$other" != "etc" ]]; then
				local finds=($(find "$prefix/$other" -type f))
				local ofile; for ofile in "${finds[@]}"; do
					remove="$remove sudo rm -fv '${ofile/$prefix//usr/local}';"
					# local relative="${ofile/$prefix//usr/local}"
					# remove="$remove sudo rm -fv '${relative/$other/$tail}';"
				done
			fi
		fi
	done
	echo; echo "🔴 Remove '$1'"
	echo "$remove"
	echo; echo "✅ Install '$1'"
	echo "$install"
}

function bupg-sudo() {
	local link="$(brew --prefix)/bin/$1"
	if [[ ! -f "$link" || ! -x "$link" ]]; then
		echo "🔴 Command not found -> '$link'"
		return 1
	fi
	echo "🌕 link -> '$link'"
	local cellar="$(realpath $link)"
	if [[ ! "$cellar" =~ "^$(brew --prefix).*" ]]; then
		echo "🔴 Command not found -> '$cellar'"
		return 1
	fi
	echo "🌕 cellar -> '$cellar'"
	local output="/usr/sbin/chown root:wheel $cellar; /bin/chmod u+s $cellar"
	if [[ "$link" != "$cellar" ]]; then
		output="$output; ln -sf $cellar $link; /usr/sbin/chown root:wheel $link; /bin/chmod u+s $link"
	fi
	output="sudo /usr/bin/env -i $(which -p bash) -c '$output'"
	echo "$output"
	echo " $output" | clipcopy
	echo "✅ Copied to clipboard"
}; compdef bupg-sudo=command

function bupg-node() {
	local node="$(dirname "$(realpath "$(which -p node)")")"
	local npm="$(dirname "$(realpath "$(which -p npm)")")"
	local output="ln -sf "$npm/npm-cli.js" "$node/npm"; ln -sf "$npm/npx-cli.js" "$node/npx""
	echo "$output"
	echo " $output" | clipcopy
	echo "✅ Copied to clipboard"
}

function bcupg-chrome() {
	find "$HOME/Library/LaunchAgents" -name 'com.google.*.plist' -exec launchctl unload -w {} \;
	echo "✅ Disabled launch agents"
}
