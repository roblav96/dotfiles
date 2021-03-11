if [[ ! -d "$DENO_DIR" ]]; then
	export DENO_DIR="$HOME/.cache/deno"
	mkdir -p "$DENO_DIR"
fi

alias .deno-v8-flags="deno run --unstable --v8-flags=--help | sed -e 's/^  --/\n  --/' -e 's/  default: /\n        default: /' | bl yml"

function .deno-node_modules() {
	mkdir -p "node_modules/.cache"
	rm -f "node_modules/.cache/deno"
	ln -sf "$DENO_DIR" "node_modules/.cache/deno"
	lr "node_modules/.cache/deno"
	npm install --no-save "typescript" "typescript-deno-plugin"
	.deno-libs "$(npm root)/typescript-deno-plugin/lib"
	fd --exclude="node_modules" --type=file --extension=ts --exclude='*.d.ts' --exec deno cache --unstable --no-check
}

function .deno-libs() {
	local lib_dir && for lib_dir in "$@"; do
		[[ ! -d "$lib_dir" ]] && continue
		# [[ -e "$lib_dir/lib.webworker.d.ts" ]] && rm -f "$lib_dir/lib.webworker.d.ts"
		rm -f "$lib_dir"/lib.*.d.ts
		deno types --unstable --quiet >"$lib_dir/lib.deno.d.ts"
		deno types --unstable --quiet >"$lib_dir/lib.deno.unstable.d.ts"
		curl --silent "https://raw.githubusercontent.com/denoland/deno/master/cli/dts/lib.deno.worker.d.ts" -o "$lib_dir/lib.webworker.d.ts"
		lr "$lib_dir"
	done
}

alias .deno-canary='wget --quiet "https://dl.deno.land/canary/$(curl --silent "https://dl.deno.land/canary-latest.txt")/deno-x86_64-apple-darwin.zip" && .deno-install'
alias .deno-release='wget --quiet "https://github.com/denoland/deno/releases/download/$(curl --silent "https://dl.deno.land/release-latest.txt")/deno-x86_64-apple-darwin.zip" && .deno-install'
function .deno-install() {
	local zipfile="${1:-deno-x86_64-apple-darwin.zip}"
	if [[ ! -e "$zipfile" ]]; then
		echo "🔴 ! -e '"$zipfile"'"
		return 1
	fi
	local denobin="$(realpath $(which -p deno))"
	unzip -o "$zipfile" -d "$(dirname "$denobin")"
	chmod 555 "$denobin"
	rm -f "$zipfile"
	deno completions --unstable zsh >"$(brew --prefix)/share/zsh/site-functions/_deno"
	deno --version | bl fstab
	bupg-deno
}

# alias deno="deno --unstable"
# alias dmm="deno run --allow-net --allow-read='.' --allow-write='deps.ts' https://deno.land/x/dmm/mod.ts"
