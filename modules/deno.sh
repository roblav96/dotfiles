[[ -z "$DENO_DIR" ]] && export DENO_DIR="$HOME/.cache/deno"
[[ ! -d "$DENO_DIR" ]] && mkdir "$DENO_DIR"

function .denoupg() { (
	wget "https://dl.deno.land/canary/$(curl https://dl.deno.land/canary-latest.txt)/deno-x86_64-apple-darwin.zip"
	unzip "deno-x86_64-apple-darwin.zip"
	cp --force "deno" "$(realpath $(which -p deno))"
	rm "deno-x86_64-apple-darwin.zip" "deno"
	bupg-deno
	deno --version | bl fstab
	deno completions zsh > "/usr/local/share/zsh/site-functions/_deno"
	zcomp
); }

# alias deno="deno --unstable"
# alias dmm="deno run --allow-net --allow-read='.' --allow-write='deps.ts' https://deno.land/x/dmm/mod.ts"
