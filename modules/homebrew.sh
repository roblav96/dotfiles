# export HOMEBREW_DEV_CMD_RUN="0"
# export HOMEBREW_DISPLAY_INSTALL_TIMES="1"
# export HOMEBREW_INSTALL_BADGE="🟢"
# export HOMEBREW_NO_ANALYTICS="1"
# export HOMEBREW_NO_ANALYTICS_THIS_RUN="1"
# export HOMEBREW_VERBOSE="1"
export HOMEBREW_AUTO_UPDATE_SECS="3600"
export HOMEBREW_CASK_OPTS="--require-sha --no-quarantine"
export HOMEBREW_FORCE_BREWED_CURL="1"
export HOMEBREW_NO_AUTO_UPDATE="1"
export HOMEBREW_NO_INSECURE_REDIRECT="1"
export HOMEBREW_NO_INSTALL_CLEANUP="1"

# if [[ -z "$OPENSSL_ROOT_DIR" ]]; then
# 	export OPENSSL_ROOT_DIR="$(realpath $(brew --prefix)/opt/openssl@1.1)"
# 	export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_ROOT_DIR"
# fi

alias bcl="HOMEBREW_COLOR=1 brew cleanup --verbose | lscolors"
alias bcfg="brew config | bat --plain -l yml"
alias benv="brew --env --plain | bat --plain -l yml"

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
			HOMEBREW_COLOR=1 brew upgrade --force-bottle --formula "$v" | lscolors
		done
	fi
	src
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
		HOMEBREW_COLOR=1 brew search --desc "$v" 2>&1 | rg --fixed-strings --passthru --word-regexp "$v"
		echo && echo "🟡 Searching names -> '$v'"
		HOMEBREW_COLOR=1 brew search "$v" 2>&1 | rg --fixed-strings --passthru --word-regexp "$v"
	done
} && compdef bs=command
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
		echo && echo "🟡 Installing formula -> '$v'"
		HOMEBREW_COLOR=1 brew install --force-bottle --formula "$v" | lscolors
	done
	src
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
	src
} && compdef brein=command
function bcrein() {
	local v && for v in "$@"; do
		echo && echo "🟡 Reinstalling cask -> '$v'"
		HOMEBREW_COLOR=1 brew reinstall --cask --no-quarantine --verbose "$v" | lscolors
	done
} && compdef bcrein=command

function bi() {
	local v && for v in "$@"; do
		echo && echo "🟡 Formula -> '$v'"
		brew desc "$v" && brew info "$v"
		if [[ "$PLATFORM" == "Linux" ]]; then
			echo "x86_64_linux bottle:"
			brew info --json=v1 "$v" | json '.[0].bottle.stable.files.x86_64_linux.url'
		fi
	done
} && compdef bi=command
function bci() {
	local v && for v in "$@"; do
		echo && echo "🟡 Cask -> '$v'"
		brew info --cask "$v"
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
			echo && echo "🟡 /libexec/bin -> '$v'"
			lara "$(brew --prefix)/opt/$v/libexec/bin"
		fi
		if [[ -d "$(brew --prefix)/opt/$v/bin" ]]; then
			echo && echo "🟡 /bin -> '$v'"
			lara "$(brew --prefix)/opt/$v/bin"
		fi
		if [[ -d "$(brew --prefix)/opt/$v/sbin" ]]; then
			echo && echo "🟡 /sbin -> '$v'"
			lara "$(brew --prefix)/opt/$v/sbin"
		fi
	done
} && compdef bbin=command
function bfs() {
	local v && for v in "$@"; do
		echo && echo "🟡 Files formula -> '$v'"
		lara "$(brew --prefix)/opt/$v/"
	done
} && compdef bfs=command
function bjson() {
	local v && for v in "$@"; do
		echo && echo "🟡 JSON formula -> '$v'"
		brew desc "$v" && brew info --json=v1 "$v" | json
	done
} && compdef bjson=command
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
	src
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
		echo " $output" | pbcopy
		echo "🟢 Copied to clipboard"
	} && compdef bupg-sudo=command

	function bupg-node() {
		local npmg="$(npm root --global)"
		local vnodes=("node" "node@14" "node@12" "node@10")
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

# alias bupg-deno='deno types --unstable > "$DENO_DIR/lib.deno.d.ts" && prettier --write "$DENO_DIR/lib.deno.d.ts"'
function bupg-deno() {
	local deno_dirs=("$HOME/.cache/deno" "$(npm root -g)/typescript-deno-plugin/lib" "$(npm root)/typescript-deno-plugin/lib")
	local deno_dir && for deno_dir in "${deno_dirs[@]}"; do
		if [[ -d "$deno_dir" ]]; then
			# [[ -e "$deno_dir/lib.webworker.d.ts" ]] && rm -f "$deno_dir/lib.webworker.d.ts"
			rm -f "$deno_dir"/lib.*.d.ts
			deno types --unstable >>"$deno_dir/lib.deno.d.ts"
			echo >>"$deno_dir/lib.deno.d.ts"
			curl --silent "https://raw.githubusercontent.com/denoland/deno/master/cli/dts/lib.deno.worker.d.ts" >>"$deno_dir/lib.deno.d.ts"
			cp "$deno_dir/lib.deno.d.ts" "$deno_dir/lib.deno.unstable.d.ts"
			exa -lag -TL1 --color-scale "$deno_dir"
		fi
	done
}
