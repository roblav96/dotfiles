if [[ ! -d "$DENO_DIR" ]]; then
	export DENO_DIR="$HOME/.cache/deno"
	mkdir -p "$DENO_DIR"
fi

alias .deno-v8-flags="deno run --unstable --v8-flags=--help | sed -e 's/^  --/\n  --/' -e 's/  default: /\n        default: /' | bl yml"

alias denoeval="NO_COLOR=1 deno eval --unstable --ts --no-check --print"

function .deno-node_modules() {
	mkdir -p node_modules/.cache
	rm -f node_modules/.cache/deno
	ln -sf "$DENO_DIR" node_modules/.cache/deno
	lr node_modules/.cache/deno
	npm install --no-save typescript typescript-deno-plugin
	# svn export --depth=files --force https://github.com/denoland/deno/trunk/cli/dts "$(npm root)/typescript-deno-plugin/lib"
	.deno-libs "$(npm root)/typescript-deno-plugin/lib"
	fd --exclude=node_modules --type=file --extension=ts --exclude='*.d.ts' --exec-batch deno cache --unstable --no-check --reload || true
}

function .deno-libs() {
	local lib_dir && for lib_dir in "$@"; do
		[[ ! -d "$lib_dir" ]] && continue
		# [[ -e "$lib_dir/lib.webworker.d.ts" ]] && rm -f "$lib_dir/lib.webworker.d.ts"
		rm -f "$lib_dir"/lib.*.d.ts
		# svn export --depth=files "https://github.com/denoland/deno/trunk/cli/dts" "$lib_dir"
		deno types --unstable >"$lib_dir/lib.deno.d.ts"
		deno types --unstable >"$lib_dir/lib.deno.unstable.d.ts"
		curl --silent https://raw.githubusercontent.com/denoland/deno/main/cli/dts/lib.deno.worker.d.ts -o "$lib_dir/lib.webworker.d.ts"
		lr "$lib_dir"
	done
}

alias .deno-canary='wget --quiet "https://dl.deno.land/canary/$(curl --silent "https://dl.deno.land/canary-latest.txt")/deno-x86_64-apple-darwin.zip" && .deno-install'
alias .deno-release='wget --quiet "https://github.com/denoland/deno/releases/download/$(curl --silent "https://dl.deno.land/release-latest.txt")/deno-x86_64-apple-darwin.zip" && .deno-install'
function .deno-install() {
	if [[ ! -e deno-x86_64-apple-darwin.zip ]]; then
		echo "🔴 ! -e 'deno-x86_64-apple-darwin.zip'"
		return 1
	fi
	local denobin="$(realpath $(which -p deno))"
	unzip -o deno-x86_64-apple-darwin.zip -d "$(dirname "$denobin")"
	chmod 555 "$denobin"
	rm -f deno-x86_64-apple-darwin.zip
	deno completions --unstable zsh >"$(brew --prefix)/share/zsh/site-functions/_deno"
	deno --version | bl fstab
	.deno-upgrade
}

function .deno-upgrade() {
	local deno_dir="${DENO_DIR:-$HOME/.cache/deno}"
	if [[ -d "$deno_dir" ]]; then
		find "$deno_dir" -mindepth 1 -maxdepth 1 -type d -print -exec rm -r -f '{}' \;
	fi
	.deno-libs "$deno_dir" "$(npm root --global)/typescript-deno-plugin/lib"
}

# alias deno="deno --unstable"
# alias dmm="deno run --allow-net --allow-read='.' --allow-write='deps.ts' https://deno.land/x/dmm/mod.ts"
