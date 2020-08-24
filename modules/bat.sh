export BAT_PAGER="never"
export BAT_STYLE="header,grid"
export BAT_THEME="Monokai Pro"
# export BAT_CONFIG_PATH="$DOTFILES/static"

alias bat="bat --italic-text=always --decorations=always --tabs=0 --wrap=never --paging=$BAT_PAGER --theme='$BAT_THEME' --style=$BAT_STYLE"
alias batrb="bat --theme='Monokai Extended Origin' -l rb"
# alias batt="bat --style=header,grid,numbers"
# alias bbat="bat --style=header,grid,numbers"

alias b="bat"
alias bl="bat --style=grid --language"
alias bn="bat --style=header,grid,numbers"
alias bp="bat --plain"
alias bpg="bat --style=grid"

alias bb="bat --style=grid -l bash"
# alias be="bat --style=grid -l perl"
# alias bf="bat --style=grid -l ini"
alias bh="bat --style=grid -l man"
alias bk="bat --style=grid -l make"
alias bm="mdcat"
# alias bm="bat --style=grid -l nim"
alias bq="bat --style=grid -l qml"
# alias br="bat --style=grid -l ruby"
# alias bt="bat --style=grid -l strace"
alias bx="bat --style=grid -l nix"
alias by="bat --style=grid -l yml"

# alias bconf="bat -l conf"
# alias bdiff="bat -l diff"
# alias bgo="bat -l go"
# alias bhs="bat -l hs"
# alias bini="bat -l ini"
# alias bjs="bat -l js"
# alias blog="bat -l log"
# alias bman="bat -l man"
# alias bnix="bat -l nix"
# alias bpl="bat -l pl"
# alias bprops="bat -l properties"
# alias bpy="bat -l py"
# alias brb="bat -l rb"
# alias bsh="bat -l sh"
# alias btml="bat -l tml"
# alias bts="bat -l ts"
# alias bv="bat -l v"
# alias bxml="bat -l xml"
# alias byml="bat -l yml"

alias batls="bat --list-languages"

alias bathr='echo | bat --terminal-width=$(tput cols) --style=grid | head -n1'
alias batcd='cd $(command bat --config-dir)/syntaxes'
# rm -rfv \"\$(command bat --config-dir)\"/*/*;
alias batbuild="
cp $DOTFILES/themes \"\$(command bat --config-dir)\";
echo;
lch --tree \"\$(command bat --config-dir)\";
echo;
command bat cache --clear;
command bat cache --build;
echo;
l \"\$(command bat --cache-dir)\"
"

function batplist() {
	plistutil --infile "$1" | prettier --parser xml | bat --style=grid -l xml
}
alias bpl="batplist"
alias bplist="batplist"

function dotbat() {
	cat "$@" | grep --invert-match '^# ' | bat --style=grid -l sh
}

function pbat() {
	if [[ -e "$1" ]]; then
		if [[ "$#" -eq "1" ]]; then
			prettier "$1" | bat --style=grid -l "${1##*.}"
		else
			prettier --parser "$2" "$1" | bat --plain -l "$2"
		fi
	else
		prettier --parser "$@" | bat --plain -l "$@"
	fi
	# test $# -eq 1 && prettier --parser $@ | bat -p -l $@ || echo "🔴 prettier parser required"
}
alias pb="pbat"

function batlangs() {
	# local langs=('as' 'csv' 'applescript' 's' 'adoc' 'asa' 'yasm' 'awk' 'bat' 'bib' 'c' 'cs' 'cpp' 'cabal' 'clj' 'CMakeLists' 'h' 'hh' 'CMakeCache' 'cr' 'css' 'd' 'dart' 'diff' 'Dockerfile' '.env' '.env' '.env' 'ex' 'elm' 'erl' 'fs' 'fs' 'fish' 'attributes' 'COMMIT_EDITMSG' 'gitconfig' 'exclude' '.git' 'gitlog' 'git' 'go' 'dot' 'groovy' 'hs' 'hs' 'show' 'hosts' 'html' 'asp' 'html' 'yaws' 'rails' 'adp' 'twig' 'ini' 'java' 'properties' 'jsp' 'js' 'js' 'js' 'json' 'sublime' 'sublime' 'jsonnet' 'jl' 'kt' 'tex' 'less' 'lisp' 'lhs' 'lua' 'make' 'Makefile' 'man' 'md' 'matlab' 'build' 'nix' 'm' 'mm' 'ml' 'mll' 'mly' 'org' 'pas' 'pl' 'php' 'txt' 'ps1' 'proto' 'pb' 'pp' 'purs' 'py' 'Sconstruct' 'R' 'rd' 're' 'requirements' 'rst' 'robot' 'rb' 'Deliverfile' 'podspec' 'simplecov' 'haml' 'rxml' 'rs' 'sass' 'scala' 'scss' 'sql' 'erbsql' 'ssh_config' 'sshd_config' 'strace' 'swift' 'log' 'tcl' 'tf' 'sty' 'textile' 'toml' 'ts' 'tsx' 'varlink' 'v' 'vim' 'xml' 'yaml')
	# local langs=('as' 'csv' 'applescript' 's' 'adoc' 'asa' 'yasm' 'awk' 'bat' 'bib' 'c' 'cs' 'cpp' 'cabal' 'clj' 'CMakeLists' 'h' 'hh' 'CMakeCache' 'cr' 'css')
	# local langs=('as' 'csv' 'applescript' 's' 'adoc')
	# local langs=('ActionScript' 'Advanced CSV' 'AppleScript' 'ARM Assembly' 'AsciiDoc' 'ASP' 'Assembly (x86_64)' 'AWK' 'Batch File' 'BibTeX' 'Bourne Again Shell (bash)' 'C#' 'C' 'C++' 'Cabal' 'Clojure' 'CMake C Header' 'CMake C++ Header' 'CMake' 'CMakeCache' 'Crystal' 'CSS' 'D' 'Dart' 'Diff' 'Dockerfile' 'DotENV' 'Elixir' 'Elm' 'Erlang' 'F#' 'F#' 'friendly interactive shell (fish)' 'Git Attributes' 'Git Commit' 'Git Config' 'Git Ignore' 'Git Link' 'Git Log' 'Git Rebase Todo' 'Go' 'Graphviz (DOT)' 'Groovy' 'Haskell (improved)' 'Haskell' 'Highlight non-printables' 'hosts' 'HTML (ASP)' 'HTML (EEx)' 'HTML (Erlang)' 'HTML (Rails)' 'HTML (Tcl)' 'HTML (Twig)' 'HTML' 'INI' 'Java Properties' 'Java Server Page (JSP)' 'Java' 'JavaScript (Babel)' 'JavaScript (Rails)' 'JavaScript' 'JSON' 'jsonnet' 'Julia' 'Kotlin' 'LaTeX' 'Less' 'Lisp' 'Literate Haskell' 'Lua' 'Makefile' 'Manpage' 'Markdown' 'MATLAB' 'NAnt Build File' 'Nix' 'Objective-C' 'Objective-C++' 'OCaml' 'OCamllex' 'OCamlyacc' 'orgmode' 'Pascal' 'Perl' 'PHP' 'Plain Text' 'PowerShell' 'Protocol Buffer (TEXT)' 'Protocol Buffer' 'Puppet' 'PureScript' 'Python' 'R' 'Rd (R Documentation)' 'Regular Expression' 'requirements.txt' 'reStructuredText' 'Ruby Haml' 'Ruby on Rails' 'Ruby' 'Rust' 'Sass' 'Scala' 'SCSS' 'SQL (Rails)' 'SQL' 'SSH Config' 'SSHD Config' 'Strace' 'Swift' 'syslog' 'Tcl' 'Terraform' 'TeX' 'Textile' 'TOML' 'TypeScript' 'TypeScriptReact' 'varlink' 'Verilog' 'VimL' 'Vue Component' 'XML' 'YAML')
	# local langs=('ActionScript' 'Advanced CSV' 'AppleScript' 'ARM Assembly' 'AsciiDoc' 'ASP' 'Assembly (x86_64)' 'Authorized Keys' 'AWK' 'Batch File' 'BibTeX' 'Bourne Again Shell (bash)' 'C' 'C#' 'C++' 'Cabal' 'Clojure' 'CMake' 'CMake C Header' 'CMake C++ Header' 'CMakeCache' 'CoffeeScript' 'CpuInfo' 'Crystal' 'CSS' 'D' 'Dart' 'Diff' 'Dockerfile' 'DotENV' 'Elixir' 'Elm' 'Email' 'Erlang' 'F#' 'Fortran (Fixed Form)' 'Fortran (Modern)' 'Fortran Namelist' 'Friendly Interactive Shell (fish)' 'fstab' 'Generic Config' 'Git Attributes' 'Git Commit' 'Git Config' 'Git Ignore' 'Git Link' 'Git Log' 'Git Mailmap' 'Git Rebase Todo' 'Go' 'GraphQL' 'Graphviz (DOT)' 'Groovy' 'group' 'Haskell' 'Highlight non-printables' 'hosts' 'HTML' 'HTML (ASP)' 'HTML (EEx)' 'HTML (Erlang)' 'HTML (Jinja2)' 'HTML (Rails)' 'HTML (Tcl)' 'HTML (Twig)' 'INI' 'Java' 'Java Properties' 'Java Server Page (JSP)' 'JavaScript' 'JavaScript (Babel)' 'JavaScript (Rails)' 'Jinja2' 'JSON' 'jsonnet' 'Julia' 'Known Hosts' 'Kotlin' 'LaTeX' 'Less' 'Lisp' 'Literate Haskell' 'Lua' 'Makefile' 'Manpage' 'Markdown' 'MATLAB' 'MemInfo' 'NAnt Build File' 'Nftables' 'Nim' 'Nix' 'Objective-C' 'Objective-C++' 'OCaml' 'OCamllex' 'OCamlyacc' 'orgmode' 'Pascal' 'passwd' 'Perl' 'PHP' 'Plain Text' 'PowerShell' 'Protocol Buffer' 'Protocol Buffer (TEXT)' 'Puppet' 'PureScript' 'Python' 'QML' 'R' 'Rd (R Documentation)' 'Rego' 'Regular Expression' 'requirements.txt' 'resolv' 'reStructuredText' 'Ruby' 'Ruby Haml' 'Ruby on Rails' 'Rust' 'Salt State (SLS)' 'Sass' 'Scala' 'SCSS' 'SML' 'SQL' 'SQL (Rails)' 'SSH Config' 'SSHD Config' 'Strace' 'Stylus' 'Swift' 'syslog' 'Tcl' 'Terraform' 'TeX' 'Textile' 'TOML' 'TypeScript' 'TypeScriptReact' 'varlink' 'Verilog' 'VimL' 'Vue Component' 'XML' 'YAML')
	local langs=('ActionScript' 'AppleScript' 'AWK' 'Bourne Again Shell (bash)' 'CMake' 'Erlang' 'F#' 'Generic Config' 'Haskell' 'INI' 'Julia' 'Kotlin' 'Lisp' 'Lua' 'Makefile' 'Manpage' 'Nim' 'Nix' 'OCaml' 'Pascal' 'Perl' 'Java Properties' 'Python' 'QML' 'Ruby' 'Strace' 'Stylus' 'Swift' 'Tcl' 'TOML' 'Verilog' 'YAML')
	local data=$(</dev/stdin)
	local lang; for lang in "${langs[@]}"; do
		echo "🌕 $lang"
		echo $data | bat --style=grid --language="$lang"
	done
}
# alias batlangs="print -l $langs | fzf --preview 'bat ~/.config/emby-server/logs/embyserver.txt --color=always --italic-text=always --decorations=always --tabs=0 --paging=never --wrap=never --theme="Monokai Pro Classic" --language="{}"'"

function batthemes() {
	if [[ $# -eq 0 ]]; then
		echo "🔴 language syntax extension required!"
		return 1
	fi
	local themes=('Monokai Extended Origin' 'Monokai Pro' 'Monokai Pro Classic' 'OneHalfDark')
	local data=$(</dev/stdin)
	for theme in "${themes[@]}"; do
		echo "🌕 $theme"
		echo $data | bat --style=grid,numbers --theme="$theme" --language="$1"
	done
}
