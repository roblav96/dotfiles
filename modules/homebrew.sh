# export HOMEBREW_DEV_CMD_RUN="0"
# export HOMEBREW_DISPLAY_INSTALL_TIMES="1"
# export HOMEBREW_INSTALL_BADGE="✅"
# export HOMEBREW_NO_ANALYTICS="1"
# export HOMEBREW_NO_ANALYTICS_THIS_RUN="1"
# export HOMEBREW_VERBOSE="1"
export HOMEBREW_AUTO_UPDATE_SECS="3600"
export HOMEBREW_CASK_OPTS="--require-sha --no-quarantine"
export HOMEBREW_FORCE_BREWED_CURL="1"
export HOMEBREW_NO_AUTO_UPDATE="1"
export HOMEBREW_NO_INSECURE_REDIRECT="1"
export HOMEBREW_NO_INSTALL_CLEANUP="1"

alias bcl="HOMEBREW_COLOR=1 brew cleanup --verbose | lscolors"
alias bcfg="brew config | bat --plain -l yml"
alias benv="brew --env --plain | bat --plain -l yml"

function bupd() {
	echo && echo "🌕 Updating taps"
	brew update --verbose
}
function bout() {
	echo && echo "🌕 Outdated formulas"
	brew outdated --formula --verbose
	[[ "$PLATFORM" != "Linux" ]] && bcout
}
function bcout() {
	echo && echo "🌕 Outdated casks"
	brew outdated --cask --greedy --verbose | rg --invert-match 'latest'
}
function bupg() {
	if [[ $# -eq 0 ]]; then
		echo && echo "🌕 Upgrading all formulas"
		HOMEBREW_COLOR=1 brew upgrade --formula | lscolors
	else
		local v && for v in "$@"; do
			echo && echo "🌕 Upgrading formula -> '$v'"
			HOMEBREW_COLOR=1 brew upgrade --formula "$v" | lscolors
		done
	fi
	src
} && compdef bupg=command
function bcupg() {
	local v && for v in "$@"; do
		echo && echo "🌕 Upgrading cask -> '$v'"
		HOMEBREW_COLOR=1 brew upgrade --cask --no-quarantine "$v" | lscolors
	done
} && compdef bcupg=command

function bls() {
	echo && echo "🌕 List formulas"
	brew list --formula --versions
}
function blsm() {
	echo && echo "🌕 Recently modified formulas"
	lm --color=always "$(brew --prefix)/Cellar" | tail --lines="$(expr "$(tput lines)" - 10)"
}
function blsch() {
	echo && echo "🌕 Recently changed formulas"
	lch --color=always "$(brew --prefix)/Cellar" | tail --lines="$(expr "$(tput lines)" - 10)"
}
function blscr() {
	echo && echo "🌕 Recently created formulas"
	lcr --color=always "$(brew --prefix)/Cellar" | tail --lines="$(expr "$(tput lines)" - 10)"
}
alias blscd='cd "$(brew --prefix)/Cellar"'
function bcls() {
	echo && echo "🌕 List casks"
	brew list --cask --versions
}
alias blsa="bls; echo; bcls"
function bpinned() {
	echo && echo "🌕 Pinned formulas"
	brew list --formula --versions --pinned
}

function bs() {
	local v && for v in "$@"; do
		echo && echo "🌕 Searching descriptions -> '$v'"
		brew search --desc "$v" 2>/dev/null | rg --smart-case --fixed-strings --passthru --word-regexp "$v"
		echo && echo "🌕 Searching names -> '$v'"
		brew search "$v" 2>/dev/null | rg --smart-case --fixed-strings --passthru --word-regexp "$v"
	done
}
alias bscd='cd $(brew --prefix)/Homebrew'

alias blog="brew log --max-count=5"
alias blogm="brew log --max-count=10 --oneline"
alias bloga="brew log --max-count=3 --patch"
function bclog() {
	(
		cd "$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-cask"
		git log --reverse --max-count=5 --date=relative --stat "Casks/$*.rb"
	)
} && compdef bchist=command

function bin() {
	local v && for v in "$@"; do
		echo && echo "🌕 Installing formula -> '$v'"
		HOMEBREW_COLOR=1 brew install --formula "$v" | lscolors
	done
	src
}
function bcin() {
	local v && for v in "$@"; do
		echo && echo "🌕 Installing cask -> '$v'"
		HOMEBREW_COLOR=1 brew install --cask --no-quarantine --verbose "$v" | lscolors
	done
}

function brein() {
	local v && for v in "$@"; do
		echo && echo "🌕 Reinstalling formula -> '$v'"
		HOMEBREW_COLOR=1 brew reinstall --formula "$v" | lscolors
	done
	src
} && compdef brein=command
function bcrein() {
	local v && for v in "$@"; do
		echo && echo "🌕 Reinstalling cask -> '$v'"
		HOMEBREW_COLOR=1 brew reinstall --cask --no-quarantine --verbose "$v" | lscolors
	done
} && compdef bcrein=command

function bi() {
	local v && for v in "$@"; do
		echo && echo "🌕 Formula -> '$v'"
		brew desc "$v" && brew info "$v"
		if [[ "$PLATFORM" == "Linux" ]]; then
			echo "x86_64_linux bottle:"
			brew info --json=v1 "$v" | json '.[0].bottle.stable.files.x86_64_linux.url'
		fi
	done
} && compdef bi=command
function bci() {
	local v && for v in "$@"; do
		echo && echo "🌕 Cask -> '$v'"
		brew cask info "$v"
	done
} && compdef bci=command

function bmd() {
	find "$(brew --prefix)/opt/$*/" -maxdepth 1 -type f -iname '*readme*' | while read i; do
		if [[ "${i##*.}" == "md" ]]; then mdcat "$i"; else bat "$i"; fi
	done
} && compdef bmd=command

function bcd() {
	cd "$(brew --prefix)/opt/$*"
} && compdef bcd=command
function bcdcellar() {
	cd "$(realpath $(brew --prefix $*))"
} && compdef bcd=command
function bbin() {
	local v && for v in "$@"; do
		if [[ -d "$(brew --prefix)/opt/$v/libexec/bin" ]]; then
			echo && echo "🌕 /libexec/bin -> '$v'"
			lara "$(brew --prefix)/opt/$v/libexec/bin"
		fi
		if [[ -d "$(brew --prefix)/opt/$v/bin" ]]; then
			echo && echo "🌕 /bin -> '$v'"
			lara "$(brew --prefix)/opt/$v/bin"
		fi
		if [[ -d "$(brew --prefix)/opt/$v/sbin" ]]; then
			echo && echo "🌕 /sbin -> '$v'"
			lara "$(brew --prefix)/opt/$v/sbin"
		fi
	done
} && compdef bbin=command
function bfs() {
	local v && for v in "$@"; do
		echo && echo "🌕 Files formula -> '$v'"
		lara "$(brew --prefix)/opt/$v/"
	done
} && compdef bfs=command
function bjson() {
	local v && for v in "$@"; do
		echo && echo "🌕 JSON formula -> '$v'"
		brew desc "$v" && brew info --json=v1 "$v" | json
	done
} && compdef bjson=command
function bdep() {
	local v && for v in "$@"; do
		echo && echo "🌕 Dependencies formula -> '$v'"
		brew deps "$v" -n --tree
	done
} && compdef bdep=command

function bcat() {
	local v && for v in "$@"; do
		echo && echo "🌕 Cat formula -> '$v'"
		brew cat "$v" | pbat ruby
	done
} && compdef bcat=command
function bccat() {
	local v && for v in "$@"; do
		echo && echo "🌕 Cat cask -> '$v'"
		brew cask cat "$v" | pbat ruby
	done
} && compdef bccat=command

function bia() {
	local v && for v in "$@"; do
		bi "$v" && bcat "$v"
	done
} && compdef bia=command
function bcia() {
	local v && for v in "$@"; do
		bci "$v" && bccat "$v"
	done
} && compdef bcia=command

function bo() {
	local v && for v in "$@"; do
		echo && echo "🌕 Opening formula -> '$v'"
		brew home "$v"
	done
} && compdef bo=command
function bco() {
	local v && for v in "$@"; do
		echo && echo "🌕 Opening cask -> '$v'"
		brew cask home "$v"
	done
} && compdef bco=command

function brm() {
	local v && for v in "$@"; do
		# [[ "$PLATFORM" == "Linux" ]] && bin-linux "$v"
		echo && echo "🌕 Uninstalling formula -> '$v'"
		HOMEBREW_COLOR=1 brew uninstall --force --verbose "$v" | lscolors
	done
	src
} && compdef brm=command
function bcrm() {
	local v && for v in "$@"; do
		echo && echo "🌕 Zapping cask -> '$v'"
		HOMEBREW_COLOR=1 brew cask zap --force --verbose "$v" | lscolors
	done
} && compdef bcrm=command
function bcun() {
	local v && for v in "$@"; do
		echo && echo "🌕 Uninstalling cask -> '$v'"
		HOMEBREW_COLOR=1 brew cask uninstall --force --verbose "$v" | lscolors
	done
} && compdef bcun=command

if [[ "$PLATFORM" == "Darwin" ]]; then
	function bsls() {
		echo && echo "🌕 List services"
		brew services list
	}
	function bsdown() {
		local v && for v in "$@"; do
			echo && echo "🌕 Stopping service -> '$v'"
			brew services stop "$v"
		done
		echo && brew services list
	}
	function bsup() {
		local v && for v in "$@"; do
			echo && echo "🌕 Starting service -> '$v'"
			brew services restart "$v"
		done
		echo && brew services list
	}
	function bsre() {
		local v && for v in "$@"; do
			echo && echo "🌕 Restarting service -> '$v'"
			brew services restart "$v"
		done
		echo && brew services list
	}
	function bsrun() {
		local v && for v in "$@"; do
			echo && echo "🌕 Running service -> '$v'"
			brew services run "$v"
		done
		echo && brew services list
	}
fi

function bin-linux() {
	local prefix="$(brew --prefix)/opt/$*"
	[[ ! -d "$prefix" ]] && return
	prefix="$(realpath $prefix)"
	[[ "$PLATFORM" == "Linux" ]] && bfs "$*"
	local install=""
	local remove=""
	local bins=('bin' 'sbin')
	local bin && for bin in "${bins[@]}"; do
		if [[ -d "$prefix/$bin" ]]; then
			local xfile && for xfile in $prefix/$bin/*; do
				install="$install sudo cp -v '$(realpath "$xfile")' '/usr/local/$bin/${xfile##*/}' && sudo chmod -v u+w '/usr/local/$bin/${xfile##*/}';"
				remove="$remove sudo rm -fv '/usr/local/$bin/${xfile##*/}';"
			done
		fi
	done
	local others=('etc' 'include' 'lib' 'libexec' 'share')
	local other && for other in "${others[@]}"; do
		if [[ -d "$prefix/$other" ]]; then
			# local head="${other%%/*}"
			# local tail="${other##*/}"
			install="$install sudo cp -vr '$prefix/$other/'* '/usr/local/$other';"
			# install="$install sudo cp -vr '$prefix/$other/'* '/usr/local/$tail';"
			if [[ "$other" != "etc" ]]; then
				local finds=($(find "$prefix/$other" -type f))
				local ofile && for ofile in "${finds[@]}"; do
					remove="$remove sudo rm -fv '${ofile/$prefix//usr/local}';"
					# local relative="${ofile/$prefix//usr/local}"
					# remove="$remove sudo rm -fv '${relative/$other/$tail}';"
				done
			fi
		fi
	done
	echo && echo "🔴 Remove '$*'"
	echo "$remove"
	echo && echo "✅ Install '$*'"
	echo "$install"
}
unfunction bin-linux

function bupg-sudo() {
	local link="$(brew --prefix)/bin/$*"
	[[ ! -e "$link" ]] && local link="$(brew --prefix)/sbin/$*"
	if [[ ! -e "$link" || ! -x "$link" ]]; then
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
	echo " $output" | pbcopy
	echo "✅ Copied to clipboard"
} && compdef bupg-sudo=command
[[ "$PLATFORM" != "Darwin" ]] && unfunction bupg-sudo

function bupg-node() {
	local node="$(dirname "$(realpath "$(which -p node)")")"
	local npm="$(npm root -g)"
	ln -sf "$npm/npm/bin/npm-cli.js" "$node/npm"
	ln -sf "$npm/npm/bin/npx-cli.js" "$node/npx"
	[[ -x "$(which -p node-gyp)" ]] && node-gyp install
}
[[ "$PLATFORM" != "Darwin" ]] && unfunction bupg-node

function bupg-node@12() {
	brm node node@12 node@10
	HOMEBREW_COLOR=1 brew cleanup --verbose | lscolors
	bin node node@12 node@10
	bcd node@12
	mkdir libexec/bin libexec/lib
	mv bin/npm bin/npx libexec/bin
	mv lib/node_modules libexec/lib
	brew unlink node --verbose --debug
	brew link --force node@12 --verbose --debug
	bupg-node
	echo "🌕 npm i -g npm"
	echo "🌕 npm doctor"
}
[[ "$PLATFORM" != "Darwin" ]] && unfunction bupg-node@12

# alias bupg-deno='deno types --unstable > "$DENO_DIR/lib.deno.d.ts" && prettier --write "$DENO_DIR/lib.deno.d.ts"'
function bupg-deno() {
	deno types --unstable >"$DENO_DIR/lib.deno.d.ts" && chmod 644 "$DENO_DIR/lib.deno.d.ts" && prettier --write "$DENO_DIR/lib.deno.d.ts"
	deno types --unstable >"$DENO_DIR/lib.deno.unstable.d.ts" && chmod 644 "$DENO_DIR/lib.deno.unstable.d.ts" && prettier --write "$DENO_DIR/lib.deno.unstable.d.ts"
}

function bcupg-google-chrome() {
	# fd --base-directory "$HOME/Library/LaunchAgents" --absolute-path --fixed-strings 'com.google.keystone' --exec launchctl unload -w
	# find "$HOME/Library/LaunchAgents" -name 'com.google.*.plist' -exec launchctl unload -w {} \;
	fd --base-directory "$HOME/Library/LaunchAgents" --absolute-path --fixed-strings 'com.google.keystone' | while read i; do
		echo "🌕 launchctl unload -w $i" | lscolors
		launchctl unload -w "$i"
	done
	echo && echo "✅ Disabled Google Chrome's update background services"
}
[[ "$PLATFORM" != "Darwin" ]] && unfunction bcupg-google-chrome
