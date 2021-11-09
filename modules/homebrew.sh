# [[ -n "$SDKROOT" ]] && export HOMEBREW_SDKROOT="$SDKROOT"
# export HOMEBREW_DEV_CMD_RUN=0
# export HOMEBREW_DEVELOPER=1
# export HOMEBREW_DISPLAY_INSTALL_TIMES=1
# export HOMEBREW_FORCE_BREWED_CURL=1
# export HOMEBREW_FORCE_BREWED_GIT=1
# export HOMEBREW_INSTALL_BADGE="🟢"
# export HOMEBREW_NO_ANALYTICS=1
# export HOMEBREW_NO_ANALYTICS_THIS_RUN=1
# export HOMEBREW_VERBOSE=1

export HOMEBREW_AUTO_UPDATE_SECS=3600
export HOMEBREW_BOOTSNAP=1
export HOMEBREW_CASK_OPTS="--require-sha --no-quarantine"
export HOMEBREW_COLOR=0
export HOMEBREW_CURL_RETRIES=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

alias bclr="HOMEBREW_COLOR=1 brew cleanup --verbose | lscolors"
alias bcfg="brew config | sortt"
alias benv="brew --env --plain | sortt"

function bupd() {
	echo && echo "🟡 Updating taps"
	brew update --verbose && bout
}
function bout() {
	echo && echo "🟡 Outdated formulas"
	brew outdated --formula
	[[ "$PLATFORM" != "Linux" ]] && bcout
}
function bcout() {
	echo && echo "🟡 Outdated casks"
	brew outdated --cask --greedy --verbose | rg --fixed-strings --invert-match '(latest)'
}
function bupg() {
	if [[ $# -eq 0 ]]; then
		echo && echo "🟡 Upgrading all formulas"
		HOMEBREW_COLOR=1 brew upgrade --force-bottle --formula | lscolors
	else
		local v && for v in "$@"; do
			echo && echo "🟡 Upgrading formula -> '$v'"
			HOMEBREW_COLOR=1 brew upgrade --formula --verbose "$v" | lscolors
		done
	fi
} && compdef bupg=command
function bcupg() {
	local v && for v in "$@"; do
		echo && echo "🟡 Upgrading cask -> '$v'"
		HOMEBREW_COLOR=1 brew upgrade --cask --no-quarantine "$v" | lscolors
	done
} && compdef bcupg=command

function bls() {
	echo && echo "🟡 List formulas"
	brew list --formula --versions
}
function blsp() {
	echo && echo "🟡 Pinned formulas"
	brew list --formula --versions --pinned
}
function blsm() {
	echo && echo "🟡 Recently modified formulas"
	lm --color=always "$(brew --prefix)/Cellar" | tail --lines=$(ty)
}
function blsch() {
	echo && echo "🟡 Recently changed formulas"
	lch --color=always "$(brew --prefix)/Cellar" | tail --lines=$(ty)
}
function blscr() {
	echo && echo "🟡 Recently created formulas"
	lcr --color=always "$(brew --prefix)/Cellar" | tail --lines=$(ty)
}
alias blscd='cd "$(brew --prefix)/Cellar"'
function bcls() {
	echo && echo "🟡 List casks"
	brew list --cask --versions
}
alias blsa="bls; echo; bcls"

function bs() {
	local v && for v in "$@"; do
		echo && echo "🟡 Searching descriptions -> '$v'"
		HOMEBREW_COLOR=1 brew search --desc "$v" 2>&1 | rg --fixed-strings --passthru "$v"
		echo && echo "🟡 Searching names -> '$v'"
		HOMEBREW_COLOR=1 brew search "$v" 2>&1 | rg --fixed-strings --passthru "$v"
	done
} && compdef bs=command
alias bscd='cd "$(brew --prefix)/Homebrew/Library/Taps"'

function blog() {
	(
		local dir="$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core/Formula"
		echo && echo "🟡 Formula git log -> '$*'" && echo
		cd "$dir"
		git log --reverse --date=relative --stat --max-count=5 "$*.rb"
	)
} && compdef blog=command
function bclog() {
	(
		local dir="$(dirname "$(find "$(brew --prefix)/Homebrew/Library/Taps/homebrew" -name "$*.rb" -not -path '*/homebrew-core/*')")"
		echo && echo "🟡 Cask git log -> '$*'" && echo
		cd "$dir"
		git log --reverse --date=relative --stat --max-count=5 "$*.rb"
	)
} && compdef bclog=command

function bin() {
	local v && for v in "$@"; do
		echo && echo "🟡 Installing formula -> '$v'"
		HOMEBREW_COLOR=1 brew install --force-bottle --formula "$v" | lscolors
	done
}
function binsrc() {
	local v && for v in "$@"; do
		echo && echo "🟡 Installing formula from source -> '$v'"
		if [[ "$(brew info --json "$v" | jq --raw-output '.[0].versions.head')" == "HEAD" ]]; then
			brew unlink --verbose "$v"
			HOMEBREW_COLOR=1 brew install --build-from-source --HEAD --verbose --formula "$v"
		else
			HOMEBREW_COLOR=1 brew install --build-from-source --verbose --formula "$v"
		fi

	done
}
function bcin() {
	local v && for v in "$@"; do
		echo && echo "🟡 Installing cask -> '$v'"
		HOMEBREW_COLOR=1 brew install --cask --no-quarantine --verbose "$v" | lscolors
	done
}

function brein() {
	local v && for v in "$@"; do
		echo && echo "🟡 Reinstalling formula -> '$v'"
		HOMEBREW_COLOR=1 brew reinstall --force-bottle --formula "$v" | lscolors
	done
} && compdef brein=command
function breinsrc() {
	local v && for v in "$@"; do
		echo && echo "🟡 Reinstalling formula from source -> '$v'"
		HOMEBREW_COLOR=1 brew reinstall --build-from-source --verbose --formula "$v"
	done
} && compdef breinsrc=command
function bcrein() {
	local v && for v in "$@"; do
		echo && echo "🟡 Reinstalling cask -> '$v'"
		HOMEBREW_COLOR=1 brew reinstall --cask --no-quarantine --verbose "$v" | lscolors
	done
} && compdef bcrein=command

function bi() {
	local v && for v in "$@"; do
		echo && echo "🟡 Formula -> '$v'"
		brew desc "$v"
		brew info "$v"
		if [[ $? -eq 0 && "$PLATFORM" == "Linux" ]]; then
			echo && echo "x86_64_linux bottle:"
			brew info --json "$v" | json '.[0].bottle.stable.files.x86_64_linux.url'
		fi
	done
} && compdef bi=command
function bij() {
	local v && for v in "$@"; do
		echo && echo "🟡 Formula json -> '$v'"
		brew desc "$v" && brew info --json "$v" | json
	done
} && compdef bij=command
function bci() {
	local v && for v in "$@"; do
		echo && echo "🟡 Cask -> '$v'"
		brew info --cask "$v"
	done
} && compdef bci=command

function bmd() {
	find "$(brew --prefix)/opt/$*/" -maxdepth 1 -iname '*readme*' | while read i; do
		[[ "${i##*.}" == "md" ]] && mdcat "$i" || bat "$i"
	done
} && compdef bmd=command

function bld() {
	local v && for v in "$@"; do
		echo && echo "🟡 Formula .dylib/.so linkage -> '$v'"
		brew linkage "$v" | bl yml
	done
} && compdef bld=command

function blink() {
	local v && for v in "$@"; do
		echo && echo "🟡 Formula link -> '$v'"
		brew link --force --overwrite --verbose "$v"
	done
} && compdef blink=command
function bunlink() {
	local v && for v in "$@"; do
		echo && echo "🟡 Formula unlink -> '$v'"
		brew unlink --verbose "$v"
	done
} && compdef bunlink=command
function brelink() {
	local v && for v in "$@"; do
		bunlink "$v"
		blink "$v"
	done
} && compdef brelink=command

function brp() {
	realpath "$(brew --prefix)/opt/$@"
} && compdef brp=command
function bcd() {
	cd "$(brew --prefix)/opt/$@"
} && compdef bcd=command

function bbin() {
	local v && for v in "$@"; do
		if [[ -d "$(brew --prefix)/opt/$v/libexec/bin" ]]; then
			echo && echo "🟡 $v/libexec/bin"
			lra "$(brew --prefix)/opt/$v/libexec/bin"
		fi
		if [[ -d "$(brew --prefix)/opt/$v/bin" ]]; then
			echo && echo "🟡 $v/bin"
			lra "$(brew --prefix)/opt/$v/bin"
		fi
		if [[ -d "$(brew --prefix)/opt/$v/sbin" ]]; then
			echo && echo "🟡 $v/sbin"
			lra "$(brew --prefix)/opt/$v/sbin"
		fi
	done
} && compdef bbin=command
function bfs() {
	local v && for v in "$@"; do
		echo && echo "🟡 Files formula -> '$v'"
		lra --ignore-glob=".git|.DS_Store|node_modules|site-packages" "$(brew --prefix)/opt/$v/"
	done
} && compdef bfs=command
function bdep() {
	local v && for v in "$@"; do
		echo && echo "🟡 Dependencies formula -> '$v'"
		brew deps "$v" -n --tree
	done
} && compdef bdep=command

function bcat() {
	local v && for v in "$@"; do
		echo && echo "🟡 Cat formula -> '$v'"
		brew cat "$v" | pbat ruby
	done
} && compdef bcat=command
function bccat() {
	local v && for v in "$@"; do
		echo && echo "🟡 Cat cask -> '$v'"
		brew cat --cask "$v" | pbat ruby
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
		echo && echo "🟡 Opening formula -> '$v'"
		brew home "$v"
	done
} && compdef bo=command
function bco() {
	local v && for v in "$@"; do
		echo && echo "🟡 Opening cask -> '$v'"
		brew home "$v"
	done
} && compdef bco=command

function brm() {
	local v && for v in "$@"; do
		# [[ "$PLATFORM" == "Linux" ]] && bin-linux "$v"
		echo && echo "🟡 Uninstalling formula -> '$v'"
		HOMEBREW_COLOR=1 brew uninstall --force --verbose "$v" | lscolors
	done
} && compdef brm=command
function bcrm() {
	local v && for v in "$@"; do
		echo && echo "🟡 Zapping cask -> '$v'"
		HOMEBREW_COLOR=1 brew uninstall --cask --zap --force --verbose "$v" | lscolors
	done
} && compdef bcrm=command
function bcun() {
	local v && for v in "$@"; do
		echo && echo "🟡 Uninstalling cask -> '$v'"
		HOMEBREW_COLOR=1 brew uninstall --cask --force --verbose "$v" | lscolors
	done
} && compdef bcun=command

if [[ "$PLATFORM" == "Darwin" ]]; then
	function bsls() {
		echo && echo "🟡 List services"
		brew services list
	}
	function bsdown() {
		[[ $# -eq 0 ]] && brew services stop --all
		local v && for v in "$@"; do
			echo && echo "🟡 Stopping service -> '$v'"
			brew services stop "$v"
		done
		echo && brew services list
	}
	function bsup() {
		local v && for v in "$@"; do
			echo && echo "🟡 Starting service -> '$v'"
			brew services restart "$v"
		done
		echo && brew services list
	}
	function bsre() {
		local v && for v in "$@"; do
			echo && echo "🟡 Restarting service -> '$v'"
			brew services restart "$v"
		done
		echo && brew services list
	}
	function bsrun() {
		local v && for v in "$@"; do
			echo && echo "🟡 Running service -> '$v'"
			brew services run "$v"
		done
		echo && brew services list
	}

	function bupg-sudo() {
		local link="$(brew --prefix)/bin/$*"
		[[ ! -e "$link" ]] && local link="$(brew --prefix)/sbin/$*"
		if [[ ! -e "$link" || ! -x "$link" ]]; then
			echo "🔴 Command not found -> '$link'"
			return 1
		fi
		echo "🟡 link -> '$link'"
		local cellar="$(realpath $link)"
		if [[ ! "$cellar" =~ "^$(brew --prefix).*" ]]; then
			echo "🔴 Command not found -> '$cellar'"
			return 1
		fi
		echo "🟡 cellar -> '$cellar'"
		local output="/usr/sbin/chown root:wheel $cellar; /bin/chmod u+s $cellar"
		if [[ "$link" != "$cellar" ]]; then
			output="$output; ln -sf $cellar $link; /usr/sbin/chown root:wheel $link; /bin/chmod u+s $link"
		fi
		output="sudo /usr/bin/env -i $(which -p bash) -c '$output'"
		echo "$output"
		echo " $output" | tr -d '\n' | pbcopy
		echo "🟢 Copied to clipboard"
	} && compdef bupg-sudo=command

	function bupg-node() {
		local npmg="$(npm root --global)"
		local vnodes=("node" "node@16" "node@14" "node@12" "node@10")
		local vnode && for vnode in "${vnodes[@]}"; do
			local node="$(realpath "$(brew --prefix)/opt/$vnode")"
			ln -sf "$npmg/npm/bin/npm-cli.js" "$node/bin/npm"
			ln -sf "$npmg/npm/bin/npx-cli.js" "$node/bin/npx"
		done
		[[ -x "$(which -p node-gyp)" ]] && node-gyp install
	}

	function bcupg-google-chrome() {
		# fd --base-directory "$HOME/Library/LaunchAgents" --absolute-path --fixed-strings 'com.google.keystone' --exec launchctl unload -w
		# find "$HOME/Library/LaunchAgents" -name 'com.google.*.plist' -exec launchctl unload -w {} \;
		fd --base-directory "$HOME/Library/LaunchAgents" --absolute-path --fixed-strings 'com.google.keystone' | while read i; do
			echo "🟡 launchctl unload -w $i" | lscolors
			launchctl unload -w "$i"
		done
		echo && echo "🟢 Disabled Google Chrome's keystone background update services"
	}
fi

alias bupg-deno=".deno-upgrade"

# rmdir /usr/local/share/flutter/bin/cache/downloads
# rmdir /usr/local/share/flutter/.pub-cache/_temp
# rmdir /usr/local/share/flutter/.git/refs/tags
# rmdir /usr/local/share/flutter/.git/objects/info
# rmdir /usr/local/lib/ruby/gems/2.7.0/build_info
# rmdir /usr/local/lib/node_modules/typescript-deno-plugin/lib/node_modules/.cache/deno/gen
# rmdir /usr/local/lib/node_modules/typescript-deno-plugin/lib/node_modules/.cache/deno
# rmdir /usr/local/lib/node_modules/typescript-deno-plugin/lib/node_modules/.cache
# rmdir /usr/local/lib/node_modules/typescript-deno-plugin/lib/node_modules
# rmdir /usr/local/etc/libressl/certs
