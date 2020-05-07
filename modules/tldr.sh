if [[ -x "$(which -p tldr)" ]]; then
	export TEALDEER_CACHE_DIR="$HOME/.cache/tealdeer"
	if [[ ! -d "$TEALDEER_CACHE_DIR" ]]; then
		echo "🌕 mkdir -> '$TEALDEER_CACHE_DIR'"
		mkdir -p "$TEALDEER_CACHE_DIR"
		tldr --update
	fi
	function tl() {
		tldr --quiet "$1" || ch "$1"
	}; compdef tl=which
	alias tlls="tldr --list | sed 's/, /\n/g'"
	alias tls="tldr --list | sed 's/, /\n/g' | grep"
	# function tlsr() {
	# 	rg --files-with-matches --smart-case --fixed-strings "$@"
	# }
fi

function how() {
	local output="$(howdoi --color --all --num-answers=5 "$@")"
	for i in "${@}"; do
		output="$(echo "$output" | rgp "$i")"
	done
	echo "$output"
	#
	# # echo; echo "🌕 $(howdoi --all --link "$@")"; echo
	# local output=""
	# for i in {1..3}; do
	# 	output="$output\n🌕 $i $(howdoi --num-answers=3 --pos=$i --link "$@")"
	# 	output="$output\n$(howdoi --num-answers=3 --pos=$i "$@")"
	# 	output="$output\n$(howdoi --num-answers=3 --pos=$i --all "$@")"
	# done
	# echo "$output"
	#
	# local regexp="$(echo "$@" | sd ' ' '|')"
	# local regexp="($(echo "$@" | sed 's/ /|/g'))"
	# local regexp="${@//\\s/|}"
	# echo "🌕 regexp -> '$regexp'"
	# howdoi --color --all "$@" | rg --color=always --ignore-case --passthru --regexp="'"$regexp"'"
}
alias hdi="howdoi --color --all"
# alias hdi='function _hdi() { howdoi --color --all $@ }; _hdi'

# alias genc="gencomp"
compdef gencomp=which

if [[ -x "$(which -p bat)" ]]; then
	function ch() {
		local lang="sh"
		[[ -n $2 ]] && lang="$1"
		curl "http://cht.sh/$*?T" | bat --style=grid -l $lang
	}
	function chp() {
		curl "http://cht.sh/$*?T"
	}
	function cha() {
		curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$1" | bat --style=grid -l sh
	}
else
	function ch() {
		curl "http://cht.sh/$*"
	}
	function cha() {
		curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$@"
	}
fi
[[ ! -x "$(which -p tldr)" ]] && alias tl="ch"
alias chls="curl http://cht.sh/:list"
alias chs="curl http://cht.sh/:list | grep"

# function cha() { test -f ~/.config/cheat/community/$@ && bat ~/.config/cheat/community/$@ -l sh || echo "Not Found!" }
alias ch-bash="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/languages/bash.sh | bat --style=grid -l sh"
alias ch-git="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/tools/git.sh | bat --style=grid -l sh"

