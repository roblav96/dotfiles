[[ -z "$DENO_DIR" ]] && export DENO_DIR="$HOME/.cache/deno"
[[ ! -d "$DENO_DIR" ]] && command mkdir -p "$DENO_DIR"

# alias deno="deno --unstable"
# alias dmm="deno run --allow-net --allow-read='.' --allow-write='deps.ts' https://deno.land/x/dmm/mod.ts"
