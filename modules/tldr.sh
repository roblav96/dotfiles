alias tl="tldr"
alias tlupd="tldr --update"
alias tlls="tldr --list"
alias tls="tldr --list | sed --unbuffered --regexp-extended 's/, /\n/g' | grep"

function how() {
	local output="$(howdoi --color --all --num-answers=3 "$@")"
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

function ch() {
	local lang="sh"
	[[ -n $2 ]] && lang="$1"
	curl "https://cht.sh/$*?T" | bat -l $lang
}
function cha() {
	curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$1" | bat -l sh
}
# function cha() { test -f ~/.config/cheat/community/$@ && bat ~/.config/cheat/community/$@ -l sh || echo "Not Found!" }
alias ch-bash="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/languages/bash.sh | bat -l sh"
alias ch-git="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/tools/git.sh | bat -l sh"

