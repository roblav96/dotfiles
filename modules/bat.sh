export BAT_FLAGS="--color=always --italic-text=always --decorations=always --tabs=4 --paging=never --wrap=never --theme='Monokai Extended Origin'"
# export BAT_CONFIG_PATH="$DOTFILES/static"

alias bat="bat $BAT_FLAGS --style=header,grid"
alias batt="command bat $BAT_FLAGS --style=header,grid,numbers"
alias b="bat"
alias bb="batt"

alias bat-hr="echo | bat --terminal-width=$(tput cols) --style=grid | head -n1"

function batplist() {
	plistutil --infile $@ | bat -l html
}; compdef batplist=cat
alias batpl="batplist"

# export BAT_LANGS=('as' 'csv' 'applescript' 's' 'adoc')
export BAT_LANGS=('as' 'csv' 'applescript' 's' 'adoc' 'asa' 'yasm' 'awk' 'bat' 'bib' 'sh' '.bash_logout' '.zshrc' 'c' 'cs' 'cpp' 'cabal' 'clj' 'CMakeLists' 'h' 'hh' 'CMakeCache' 'cr' 'css' 'd' 'dart' 'diff' 'Dockerfile' '.env' '.env' '.env' 'ex' 'elm' 'erl' 'fs' 'fs' 'fish' 'attributes' 'COMMIT_EDITMSG' 'gitconfig' 'exclude' '.git' 'gitlog' 'git' 'go' 'dot' 'groovy' 'hs' 'hs' 'show' 'hosts' 'html' 'asp' 'html' 'yaws' 'rails' 'adp' 'twig' 'ini' 'java' 'properties' 'jsp' 'js' 'js' 'js' 'json' 'sublime' 'sublime' 'jsonnet' 'jl' 'kt' 'tex' 'less' 'lisp' 'lhs' 'lua' 'make' 'Makefile' 'man' 'md' 'matlab' 'build' 'nix' 'm' 'mm' 'ml' 'mll' 'mly' 'org' 'pas' 'pl' 'php' 'txt' 'ps1' 'proto' 'pb' 'pp' 'purs' 'py' 'Sconstruct' 'R' 'rd' 're' 'requirements' 'rst' 'robot' 'rb' 'Deliverfile' 'podspec' 'simplecov' 'haml' 'rxml' 'rs' 'sass' 'scala' 'scss' 'sql' 'erbsql' 'ssh_config' 'sshd_config' 'strace' 'swift' 'log' 'tcl' 'tf' 'sty' 'textile' 'toml' 'ts' 'tsx' 'varlink' 'v' 'vim' 'xml' 'yaml')
function batlangs() {
	local data=$(</dev/stdin)
	for BAT_LANG in "${BAT_LANGS[@]}"; do
		echo "🌕 $BAT_LANG"
		echo $data | bat --style=header,grid,numbers -l "$BAT_LANG"
	done
}
