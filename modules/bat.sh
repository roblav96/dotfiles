export BAT_PAGER="never"
export BAT_STYLE="header,grid"
export BAT_THEME="Monokai Pro"
# export BAT_CONFIG_PATH="$DOTFILES/static"

alias bat="bat --italic-text=always --decorations=always --tabs=0 --wrap=never \
--map-syntax '*.just:Bourne Again Shell (bash)' \
--map-syntax 'justfile:Bourne Again Shell (bash)' \
--paging=$BAT_PAGER --theme='$BAT_THEME' --style=$BAT_STYLE"
alias batrb="bat --theme='Monokai Extended Origin' -l rb"
# alias batt="bat --style=header,grid,numbers"
# alias bbat="bat --style=header,grid,numbers"

alias b="bat"
alias bl="bat --style=grid --language"
alias bn="bat --style=header,grid,numbers"
alias bp="bat --plain"
alias bgr="bat --style=grid"

alias bb="bat --style=grid -l sh"
alias bh="bat --style=grid -l man"
alias bj="bat --style=grid -l json"
alias bk="bat --style=grid -l make"
alias bm="mdcat"
alias bq="bat --style=grid -l qml"
alias bx="bat --style=grid -l nix"
alias by="bat --style=grid -l yml"

which bic &>/dev/null || alias bic="bat --style=grid -l config"
which bie &>/dev/null || alias bie="bat --style=grid -l erl"
which bii &>/dev/null || alias bii="bat --style=grid -l ini"
which bil &>/dev/null || alias bil="bat --style=grid -l perl"
which bim &>/dev/null || alias bim="bat --style=grid -l nim"
which bip &>/dev/null || alias bip="bat --style=grid -l properties"
which bir &>/dev/null || alias bir="bat --style=grid -l ruby"
which bit &>/dev/null || alias bit="bat --style=grid -l strace"

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
	local file="$DOTFILES/modules/$@.sh"
	[[ ! -e "$file" ]] && echo "🔴 No such file -> \$DOTFILES/modules/$@.sh" | lscolors && return 1
	cat "$file" | sed -e '/^[\s]*# /d' -e '/^$/d' | bat --file-name="$@" -l sh
} && compdef dotbat=command
alias dbat='dotbat'

function pbat() {
	if [[ -e "$1" ]]; then
		if [[ $# -eq 1 ]]; then
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
	local langs=($@)
	if [[ $# -eq 0 ]]; then
		# langs=("ActionScript" "Advanced CSV" "Apache Conf" "AppleScript" "ARM Assembly" "AsciiDoc (Asciidoctor)" "ASP" "Assembly (x86_64)" "Authorized Keys" "AWK" "Batch File" "BibTeX" "Bourne Again Shell (bash)" "C" "C#" "C++" "Cabal" "Clojure" "CMake" "CMake C Header" "CMake C++ Header" "CMakeCache" "CoffeeScript" "CpuInfo" "Crystal" "CSS" "D" "Dart" "Diff" "Dockerfile" "DotENV" "Elixir" "Elm" "Email" "Erlang" "F#" "Fortran (Fixed Form)" "Fortran (Modern)" "Fortran Namelist" "Friendly Interactive Shell (fish)" "fstab" "Generic Config" "Git Attributes" "Git Commit" "Git Config" "Git Ignore" "Git Link" "Git Log" "Git Mailmap" "Git Rebase Todo" "GLSL" "Go" "GraphQL" "Graphviz (DOT)" "Groovy" "group" "Haskell" "Highlight non-printables" "hosts" "HTML" "HTML (ASP)" "HTML (EEx)" "HTML (Erlang)" "HTML (Jinja2)" "HTML (Rails)" "HTML (Tcl)" "HTML (Twig)" "INI" "Java" "Java Properties" "Java Server Page (JSP)" "JavaScript" "JavaScript (Babel)" "JavaScript (Rails)" "JavaScriptReact" "Jinja2" "JSON" "jsonnet" "Julia" "Known Hosts" "Kotlin" "LaTeX" "Less" "Lisp" "Literate Haskell" "Lua" "Makefile" "Manpage" "Markdown" "MATLAB" "MemInfo" "NAnt Build File" "Nftables" "nginx" "Nginx Log" "Nim" "Nix" "Objective-C" "Objective-C++" "OCaml" "OCamllex" "OCamlyacc" "orgmode" "Pascal" "passwd" "Perl" "PHP" "Plain Text" "PowerShell" "Protocol Buffer" "Protocol Buffer (TEXT)" "Puppet" "PureScript" "Python" "QML" "R" "Rd (R Documentation)" "Rego" "Regular Expression" "requirements.txt" "resolv" "reStructuredText" "Robot Framework syntax highlighting" "Ruby" "Ruby Haml" "Ruby on Rails" "Rust" "Salt State (SLS)" "Sass" "Scala" "SCSS" "SML" "SQL" "SQL (Rails)" "SSH Config" "SSHD Config" "Strace" "Stylus" "Swift" "syslog" "Tcl" "Terraform" "TeX" "Textile" "TOML" "TypeScript" "TypeScriptReact" "varlink" "Verilog" "VimL" "Vue Component" "XML" "YAML")
		langs=("ActionScript" "AppleScript" "AWK" "Bourne Again Shell (bash)" "CMake" "CMakeCache" "CpuInfo" "fstab" "Erlang" "F#" "Generic Config" "Git Attributes" "Groovy" "group" "Java" "Haskell" "INI" "Julia" "Kotlin" "Lisp" "Lua" "Makefile" "Manpage" "MemInfo" "Nim" "Nix" "OCaml" "Pascal" "Perl" "Java Properties" "Python" "QML" "Ruby" "Strace" "Stylus" "Swift" "Tcl" "TOML" "TypeScriptReact" "Verilog" "VimL" "YAML")
	fi
	local data=$(</dev/stdin)
	local lang && for lang in "${langs[@]}"; do
		echo && echo $data | bat --file-name="$lang" --language="$lang"
	done
}
# alias batlangs="print -l $langs | fzf --preview 'bat ~/.config/emby-server/logs/embyserver.txt --color=always --italic-text=always --decorations=always --tabs=0 --paging=never --wrap=never --theme="Monokai Pro Classic" --language="{}"'"

function batthemes() {
	local lang="$1"
	[[ $# -eq 0 ]] && lang="Ruby"
	local themes=("Monokai Extended Origin" "Monokai Pro" "Monokai Pro Classic" "OneHalfDark")
	local data=$(</dev/stdin)
	local theme && for theme in "${themes[@]}"; do
		echo && echo $data | bat --file-name="$theme" --theme="$theme" --language="$lang"
	done
}
