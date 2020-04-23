export BAT_PAGER="never"
export BAT_THEME="Monokai Pro Classic"
export BAT_FLAGS="--color=always --italic-text=always --decorations=always --tabs=0 --paging=$BAT_PAGER --wrap=never --theme='$BAT_THEME'"
# export BAT_CONFIG_PATH="$DOTFILES/static"

alias bat="bat $BAT_FLAGS --style=header,grid"
alias batrb="bat --theme='Monokai Extended Origin' -l rb"
# alias batt="bat --style=header,grid,numbers"
# alias bbat="bat --style=header,grid,numbers"
alias b="bat -l config"

alias batls="bat --list-languages"

alias bat-hr="echo | bat --terminal-width=\$(tput cols) --style=grid | head -n1"
alias bat-cd="cd \"\$(command bat --config-dir)\""
alias bat-build="rm -v \"\$(command bat --config-dir)\"/themes/*; cp $DOTFILES/tmthemes/* \"\$(command bat --config-dir)\"/themes; echo; lra \"\$(command bat --config-dir)\"; echo; command bat cache --clear; command bat cache --build; echo; l \"\$(command bat --cache-dir)\""

function batplist() {
	plistutil --infile $@ | bat -l html
}
# alias batpl="batplist"

function pbat() {
	if [[ -e $1 ]]; then
		if [[ $# -eq 1 ]]; then
			prettier $1 | bat -l ${1##*.}
		else
			prettier --parser $2 $1 | bat -p -l $2
		fi
		# echo "🌕 @ -> $@"
		# local output=$(prettier --no-color $@)
		# echo "🌕 output -> $output"
		# if echo "$output" | grep -q '^[error]'; then
		# 	bat $@
		# else
		# 	echo "$output" | bat -l ${@##*.}
		# fi
	else
		prettier --parser $@ | bat -p -l $@
	fi
	# test $# -eq 1 && prettier --parser $@ | bat -p -l $@ || echo "🔴 prettier parser required"
}

# export BAT_LANGS=('as' 'csv' 'applescript' 's' 'adoc' 'asa' 'yasm' 'awk' 'bat' 'bib' 'c' 'cs' 'cpp' 'cabal' 'clj' 'CMakeLists' 'h' 'hh' 'CMakeCache' 'cr' 'css' 'd' 'dart' 'diff' 'Dockerfile' '.env' '.env' '.env' 'ex' 'elm' 'erl' 'fs' 'fs' 'fish' 'attributes' 'COMMIT_EDITMSG' 'gitconfig' 'exclude' '.git' 'gitlog' 'git' 'go' 'dot' 'groovy' 'hs' 'hs' 'show' 'hosts' 'html' 'asp' 'html' 'yaws' 'rails' 'adp' 'twig' 'ini' 'java' 'properties' 'jsp' 'js' 'js' 'js' 'json' 'sublime' 'sublime' 'jsonnet' 'jl' 'kt' 'tex' 'less' 'lisp' 'lhs' 'lua' 'make' 'Makefile' 'man' 'md' 'matlab' 'build' 'nix' 'm' 'mm' 'ml' 'mll' 'mly' 'org' 'pas' 'pl' 'php' 'txt' 'ps1' 'proto' 'pb' 'pp' 'purs' 'py' 'Sconstruct' 'R' 'rd' 're' 'requirements' 'rst' 'robot' 'rb' 'Deliverfile' 'podspec' 'simplecov' 'haml' 'rxml' 'rs' 'sass' 'scala' 'scss' 'sql' 'erbsql' 'ssh_config' 'sshd_config' 'strace' 'swift' 'log' 'tcl' 'tf' 'sty' 'textile' 'toml' 'ts' 'tsx' 'varlink' 'v' 'vim' 'xml' 'yaml')
# export BAT_LANGS=('as' 'csv' 'applescript' 's' 'adoc' 'asa' 'yasm' 'awk' 'bat' 'bib' 'c' 'cs' 'cpp' 'cabal' 'clj' 'CMakeLists' 'h' 'hh' 'CMakeCache' 'cr' 'css')
# export BAT_LANGS=('as' 'csv' 'applescript' 's' 'adoc')
export BAT_LANGS=('ActionScript' 'Advanced CSV' 'AppleScript' 'ARM Assembly' 'AsciiDoc' 'ASP' 'Assembly (x86_64)' 'AWK' 'Batch File' 'BibTeX' 'Bourne Again Shell (bash)' 'C#' 'C' 'C++' 'Cabal' 'Clojure' 'CMake C Header' 'CMake C++ Header' 'CMake' 'CMakeCache' 'Crystal' 'CSS' 'D' 'Dart' 'Diff' 'Dockerfile' 'DotENV' 'Elixir' 'Elm' 'Erlang' 'F#' 'F#' 'friendly interactive shell (fish)' 'Git Attributes' 'Git Commit' 'Git Config' 'Git Ignore' 'Git Link' 'Git Log' 'Git Rebase Todo' 'Go' 'Graphviz (DOT)' 'Groovy' 'Haskell (improved)' 'Haskell' 'Highlight non-printables' 'hosts' 'HTML (ASP)' 'HTML (EEx)' 'HTML (Erlang)' 'HTML (Rails)' 'HTML (Tcl)' 'HTML (Twig)' 'HTML' 'INI' 'Java Properties' 'Java Server Page (JSP)' 'Java' 'JavaScript (Babel)' 'JavaScript (Rails)' 'JavaScript' 'JSON' 'jsonnet' 'Julia' 'Kotlin' 'LaTeX' 'Less' 'Lisp' 'Literate Haskell' 'Lua' 'Makefile' 'Manpage' 'Markdown' 'MATLAB' 'NAnt Build File' 'Nix' 'Objective-C' 'Objective-C++' 'OCaml' 'OCamllex' 'OCamlyacc' 'orgmode' 'Pascal' 'Perl' 'PHP' 'Plain Text' 'PowerShell' 'Protocol Buffer (TEXT)' 'Protocol Buffer' 'Puppet' 'PureScript' 'Python' 'R' 'Rd (R Documentation)' 'Regular Expression' 'requirements.txt' 'reStructuredText' 'Ruby Haml' 'Ruby on Rails' 'Ruby' 'Rust' 'Sass' 'Scala' 'SCSS' 'SQL (Rails)' 'SQL' 'SSH Config' 'SSHD Config' 'Strace' 'Swift' 'syslog' 'Tcl' 'Terraform' 'TeX' 'Textile' 'TOML' 'TypeScript' 'TypeScriptReact' 'varlink' 'Verilog' 'VimL' 'Vue Component' 'XML' 'YAML')
function bat-langs() {
	local data=$(</dev/stdin)
	for BAT_LANG in "${BAT_LANGS[@]}"; do
		echo "🌕 $BAT_LANG"
		echo $data | bat --style=header,grid,numbers --language="$BAT_LANG"
	done
}
# alias bat-langs="print -l $BAT_LANGS | fzf --preview 'bat ~/.config/emby-server/logs/embyserver.txt --color=always --italic-text=always --decorations=always --tabs=0 --paging=never --wrap=never --theme="Monokai Pro Classic" --language="{}"'"

export BAT_THEMES=('Monokai Extended Origin' 'Monokai Pro' 'Monokai Pro Classic' 'OneHalfDark')
function bat-themes() {
	if [[ $# -eq 0 ]]; then
		echo "🔴 language syntax extension required!"
		return 1
	fi
	bat-hr
	local data=$(</dev/stdin)
	for BAT_THEME in "${BAT_THEMES[@]}"; do
		echo "🌕 $BAT_THEME"
		echo $data | bat --style=grid,numbers --theme="$BAT_THEME" --language="$1"
	done
}
