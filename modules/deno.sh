[[ -z "$DENO_DIR" ]] && export DENO_DIR="$HOME/.cache/deno"
[[ ! -d "$DENO_DIR" ]] && mkdir "$DENO_DIR"

function .deno-canary() {
	wget "https://dl.deno.land/canary/$(curl --silent https://dl.deno.land/canary-latest.txt)/deno-x86_64-apple-darwin.zip"
	unzip -o "deno-x86_64-apple-darwin.zip" -d "$(dirname $(realpath $(which -p deno)))"
	rm -f "deno-x86_64-apple-darwin.zip"
	deno completions --unstable zsh >"$(brew --prefix)/share/zsh/site-functions/_deno"
	deno --version | bl fstab
	bupg-deno
}

# alias deno="deno --unstable"
# alias dmm="deno run --allow-net --allow-read='.' --allow-write='deps.ts' https://deno.land/x/dmm/mod.ts"
