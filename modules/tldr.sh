if [[ -x "$(which -p tldr)" ]]; then
	export TEALDEER_CACHE_DIR="$HOME/.cache/tealdeer"
	if [[ ! -d "$TEALDEER_CACHE_DIR" ]]; then
		echo "🟡 mkdir TEALDEER_CACHE_DIR -> '$TEALDEER_CACHE_DIR'"
		mkdir -p "$TEALDEER_CACHE_DIR"
		tldr --update
	fi
	function tlsr() {
		local cache_dir_pages="$TEALDEER_CACHE_DIR/tldr-pages/pages"
		local cache_dir_os="$([[ "$PLATFORM" == "Darwin" ]] && echo "osx" || echo "linux")"
		local files=($(rg --files-with-matches --smart-case --regexp "$*" "$cache_dir_pages/common" "$cache_dir_pages/$cache_dir_os" | sort))
		local file && for file in "${files[@]}"; do
			local name="$(basename "$file" ".md")"
			echo "🟡 '$name'"
			tldr --color=always "$name" | rg --passthru --smart-case --regexp "$*"
		done
		# local lines=( ${"$(rg --files-with-matches --smart-case --fixed-strings --word-regexp "$*" "$cache_dir_pages/common" "$cache_dir_pages/$cache_dir_os")"} )
		# rg --files-with-matches --smart-case --fixed-strings --word-regexp "$*" "$cache_dir_pages/common" "$cache_dir_pages/$cache_dir_os" | rargs -p '.*/(.*).md' tldr {1} | rg --passthru --smart-case --fixed-strings --word-regexp "$*"
	}
	function tl() {
		tldr --quiet "$@" || ch "$@"
	} && compdef tl=command
	alias tlls="tldr --list | sed 's#, #\n#g'"
	alias tls="tlls | g"
fi

function how() {
	local output="$(howdoi --color --all --num-answers=5 "$@")"
	for i in "${@}"; do
		output="$(echo "$output" | rg --smart-case --fixed-strings --passthru -e "$i")"
	done
	echo "$output"
	#
	# # echo; echo "🟡 $(howdoi --all --link "$@")"; echo
	# local output=""
	# for i in {1..3}; do
	# 	output="$output\n🟡 $i $(howdoi --num-answers=3 --pos=$i --link "$@")"
	# 	output="$output\n$(howdoi --num-answers=3 --pos=$i "$@")"
	# 	output="$output\n$(howdoi --num-answers=3 --pos=$i --all "$@")"
	# done
	# echo "$output"
	#
	# local regexp="$(echo "$@" | sd ' ' '|')"
	# local regexp="($(echo "$@" | sed 's/ /|/g'))"
	# local regexp="${@//\ /|}"
	# echo "🟡 regexp -> '$regexp'"
	# howdoi --color --all "$@" | rg --color=always --ignore-case --passthru --regexp="'"$regexp"'"
}
alias hdi="howdoi --color --all"
# alias hdi='function _hdi() { howdoi --color --all $@ }; _hdi'

# alias genc="gencomp"
if [[ -n "$ZSH_COMPLETION_GENERATOR_SRCDIR" ]]; then
	function gcomp() {
		gencomp "$@" && bat -l sh "$GENCOMPL_FPATH/_$1" && wc --lines "$GENCOMPL_FPATH/_$1" && zcomp
	} && compdef gcomp=command
	compdef gencomp=command
	function man2comp() {
		man "$1" | cat | python "$ZSH_COMPLETION_GENERATOR_SRCDIR/help2comp.py" "$1" >|"$GENCOMPL_FPATH/_$1" && bat -l sh "$GENCOMPL_FPATH/_$1" && wc --lines "$GENCOMPL_FPATH/_$1" && zcomp
	} && compdef man2comp=command
	function help2comp() {
		local stdin=$(</dev/stdin)
		echo "🟡 stdin -> '$stdin'"
		if [[ -n "$stdin" ]]; then
			echo $stdin | python "$ZSH_COMPLETION_GENERATOR_SRCDIR/help2comp.py" "$1" >|"$GENCOMPL_FPATH/_$1" && bat -l sh "$GENCOMPL_FPATH/_$1" && wc --lines "$GENCOMPL_FPATH/_$1" && zcomp
		fi
	} && compdef help2comp=command
	which h2c &>/dev/null || alias h2c="help2comp"
fi

if [[ -x "$(which -p bat)" ]]; then
	function ch() {
		local lang="sh"
		# [[ -n $2 ]] && lang="$1"
		curl "http://cht.sh/$*?T" | bl $lang
	}
	function chp() {
		curl "http://cht.sh/$*?T"
	}
	function cha() {
		curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$*" | bl sh
	}
else
	function ch() {
		curl "http://cht.sh/$*"
	}
	function cha() {
		curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$*"
	}
fi
[[ ! -x "$(which -p tldr)" ]] && alias tl="ch"
alias chls="curl http://cht.sh/:list"
alias chs="chls | g"

# function cha() { test -f ~/.config/cheat/community/$@ && bat ~/.config/cheat/community/$@ -l sh || echo "Not Found!" }
alias ch-bash="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/languages/bash.sh | bl sh"
alias ch-git="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/tools/git.sh | bl sh"

function clfu() {
	local b64="$(echo -n "$*" | base64)"
	curl "http://www.commandlinefu.com/commands/matching/$*/$b64/sort-by-votes/plaintext" | bl sh
} && compdef clfu=command

function tla() {
	local vflags=${@:2}
	[[ -z "$vflags" ]] && vflags="--help"
	echo && echo "█ man $1" && man "$1"
	if [[ -x "$(which -p "$1")" ]]; then
		echo && echo "█ $1 $vflags"
		("$1" $vflags 2>&1 | bl man) && echo && echo "█ tl $1"
	fi
	tl "$1" && echo && echo "█ ch $1"
	ch "$1" && echo && echo "█ cha $1"
	cha "$1" && echo && echo "█ clfu $1"
	clfu "$1"
} && compdef tla=command
