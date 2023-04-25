#!/usr/bin/env zsh

# SKIP_DIRS+=

[[ -e "$DOTFILES/configs/.env" ]] && source "$DOTFILES/configs/.env"
if [[ -x "$(which -p direnv)" ]]; then
	export DIRENV_LOG_FORMAT=""
	eval "$(direnv hook zsh)"
fi

[[ -x "$(which -p pico)" ]] && export EDITOR="pico"
[[ -x "$(which -p nano)" ]] && export EDITOR="nano"
[[ -x "$(which -p micro)" ]] && export EDITOR="micro"
export VEDITOR="$EDITOR"
export VISUAL="$EDITOR"

[[ -z "$HOME" ]] && export HOME="$(dirname $DOTFILES)"
export ZSH_COMPDUMP_EXISTS="$(echo $HOME/.zcomp*)" 2>/dev/null

if [[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
	source "$HOME/.nix-profile/etc/profile.d/nix.sh"
	# if echo "$PATH" | grep --quiet --fixed-strings "$HOME/.nix-profile/bin"; then
	# 	export PATH="${PATH#$HOME/.nix-profile/bin:}"
	# 	export PATH="${PATH#$HOME/.nix-profile/bin:}:$HOME/.nix-profile/bin"
	# fi
fi

[[ -x "$(which -p tabs)" ]] && tabs -4

# export CLICOLOR="1"
export ADBLOCK="1"
# export DEBUG_COLORS="1"
export DISABLE_OPENCOLLECTIVE="1"
# export FORCE_COLOR="1"
export SUPPRESS_SUPPORT="1"

# export RPROMPT="%F{000}%* %F{001}%* %F{002}%* %F{003}%* %F{004}%* %F{005}%* %F{006}%* %F{007}%* %F{008}%* %F{009}%*"
# export RPROMPT="%F{008}%*"
# export RPROMPT="%F{008}%*"
# export PURE_PROMPT_SYMBOL="➤"
# export PURE_CMD_MAX_EXEC_TIME="1"
export KEYTIMEOUT="10"
# export PROMPT_EOL_MARK="➜"
# source "$DOTFILES/modules/geometry.sh"

# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold,underline"

[[ -z "$LANG" ]] && export LANG="en_US.UTF-8"
[[ -z "$LANGUAGE" ]] && export LANGUAGE="en_US.UTF-8"
[[ -z "$LC_ALL" ]] && export LC_ALL="en_US.UTF-8"
[[ -z "$TERM" ]] && export TERM="xterm-256color"

export PAGER="cat"
# export TERM="xterm-256color"
# export LANG="en_US.UTF-8"
# export LANGUAGE="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
# export LESS="--raw-control-chars --quit-on-intr --squeeze-blank-lines --ignore-case --hilite-search --LONG-PROMPT --jump-target=.5"
# export LESSCHARSET="utf-8"
# export LESSCHARDEF="utf-8"
# export PAGER="less"
# export MANPAGER="$PAGER"
# export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | command bat -p -l man --pager \"less $LESS\"'"
export MANOPT="--encoding=ascii --no-hyphenation --no-justification"
export MANPAGER="sh -c 'sed s/.\\\\x08//g | bat --color=always --decorations=always --style=grid --language=man'"
if [[ -x "$(which -p col)" ]]; then
	export MANPAGER="sh -c 'col -bx | bat --color=always --decorations=always --style=grid --language=man'"
	if [[ -x "$(which -p ansifilter)" ]]; then
		export MANPAGER="sh -c 'ansifilter | col -bx | bat --color=always --decorations=always --style=grid --language=man'"
	fi
fi
if [[ -x "$(which -p groff)" ]]; then
	export MANROFFOPT="-c"
fi
# export MAN_KEEP_FORMATTING="1"
# export MANOPT="--no-hyphenation"

export DISABLE_AUTO_UPDATE="true"
# export CASE_SENSITIVE="true"

# if [ $ITERM_SESSION_ID ]; then
# 	export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'
# fi

[[ -x "$(which -p starship)" ]] && eval "$(starship init zsh)"



# ████  zinit  ████
# export ZSH="$HOME/.zinit/plugins/ohmyzsh---ohmyzsh"
# [[ -e "$DOTFILES/zinit/zinit.oh-my-zsh.sh" ]] && source "$DOTFILES/zinit/zinit.oh-my-zsh.sh"
# [[ -e "$DOTFILES/zinit/zinit.$PLATFORM.sh" ]] && source "$DOTFILES/zinit/zinit.$PLATFORM.sh"
# [[ -e "$DOTFILES/zinit/zinit.sh" ]] && source "$DOTFILES/zinit/zinit.sh"



export GENCOMPL_FPATH="$HOME/.cache/gencomp"
[[ ! -d "$GENCOMPL_FPATH" ]] && mkdir -pv "$GENCOMPL_FPATH"
zstyle :plugin:zsh-completion-generator programs ""
fpath=($GENCOMPL_FPATH $fpath)

if [[ -e "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh" ]]; then
	source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
	export ZSH="$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
	# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
	# zle_highlight+=('paste')

	source <(antidote init)
	antidote bundle < "$DOTFILES/antidote/antidote.ohmyzsh.sh" < "$DOTFILES/antidote/antidote.$PLATFORM.sh" < "$DOTFILES/antidote/antidote.sh"

	eval "$(dircolors --bourne-shell "$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-trapd00r-SLASH-LS_COLORS/LS_COLORS")"
	# vivid -m 8-bit generate molokai | sed -e 's|:|\n|g' -e 's|=[0,1,2,3,4];|\t\t|g' -e 's|=|\t|g' > "$TMPDIR/LS_COLORS"
	if [[ -x "$(which -p vivid)" ]]; then
		LS_COLORS="$LS_COLORS$(vivid -m 8-bit generate molokai):$LS_COLORS"
	fi
	LS_COLORS="$LS_COLORS*-=38;5;241:*~=38;5;241:*.jsx=38;5;074;1:*.svelte=0;38;5;185:*.vue=0;38;5;48:*.ttc=38;5;66:"
	# echo "🟡 LS_COLORS -> '$LS_COLORS'"
	# echo "🟡 LS_COLORS -> $(echo $LS_COLORS | sed -e 's|:|\n|g')"
	zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

	# local sitefns="${fpath[2]}"
	# unset fpath[2]
	# local fns="${fpath[2]}"
	# unset fpath[2]
	# echo "fpath -> '$fpath'"
fi



# function accept-line() {
# 	# default zsh behaviour locally
# 	emulate -L zsh
# 	# with extendedglob for ## (= ERE +) below
# 	set -o extendedglob
# 	# remove leading blanks
# 	BUFFER=${BUFFER##[[:blank:]]##}
# 	# remove blanks after newlines in case a multiline buffer is accepted
# 	# for instance after a safe-paste or a newline entered with <Alt+Ret>
# 	BUFFER=${BUFFER//$'\n'[[:blank:]]##/$'\n'}
# 	# call original accept-line
# 	zle .$WIDGET
# }
# zle -N accept-line



# export ZSH_COMPDEF="$(which -w compdef | grep -q 'function$' && echo 1)"

# [[ -n "$ITERM_SESSION_ID" ]] && export WORDCHARS="-+\~_."
export WORDCHARS=""

export HISTSIZE="999999999"
export SAVEHIST="999999999"
setopt hist_ignore_all_dups
setopt share_history

# unset zle_bracketed_paste
# setopt rm_star_silent
# setopt bash_auto_list
# setopt list_ambiguous

# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:manuals.*' insert-sections true
# zstyle ':completion:*:man:*' menu yes select

# export FAST_HIGHLIGHT[use_async]="0"
# export PROMPT="%(?.%F{magenta}△.%F{red}▲)%f "
# unsetopt prompt_cr prompt_sp

alias bindkey-ls="bindkey -L"
alias bindkey-debug="echo press key to observe key codes; echo; cat --show-nonprinting"
bindkey '^[[5C' forward-word
bindkey '^[[5D' backward-word
# bindkey '^E' sk --ansi -i -c 'rg --color=always --line-number "{}"'
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

unalias diff &>/dev/null
unalias grep &>/dev/null
unalias la &>/dev/null
unalias ls &>/dev/null
unalias lsa &>/dev/null
unalias md &>/dev/null
unalias path &>/dev/null
unalias pip &>/dev/null
unalias rd &>/dev/null
unfunction d &>/dev/null

[[ ! -x "$(which -p lscolors)" ]] && alias lscolors="cat"
alias lsc="lscolors"

# alias fo="forever "
# alias rma="rm -rf"
# alias rmd="rm -rf"
# alias cp="cp -v"
# alias mv="mv -v"
# alias rm="rm -v"

alias e="$EDITOR"
alias ln="ln -v"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -v"
alias ..rm=" $(which -p rm) -rf"
# alias tar="tar -v"
alias rmdir="rmdir -v"
alias mkdir="mkdir -pv"
alias shred="shred -v"
alias shredrm="shred -f --remove"
alias chown="chown -v -c"
alias chmod="chmod -v -c"
alias chmodx="chmod a+x"
alias rename="rename -v"
alias unz="unzip"
# alias unzip="unzip -v" &&
alias unz="unzip"
alias sanitize="rename --subst-all '#' '_' --subst-all '[' '_' --subst-all ']' '_' --nows --noctrl --nometa --trim"
alias mc="micro"
alias rp="realpath"
alias killall="killall -v" && compdef killall=pgrep
alias k="killall -KILL"
alias {.k,kk}=" killall -KILL"
alias ls="ls --color=auto"
alias ll="ls -lAFhN"
alias diff="diff -u -x '.git' -x 'node_modules'"
alias tree="tree -N -a -I '.git'"
alias pwda="pwd && pwd -P && realpath ."
alias pathls="echo \$PATH | sed 's#:/#\n/#g'"
# alias pathls="echo \$PATH | sed -e 's#:/#\n/#g' -e 's#:~#\n~#g'"
alias fpathls="echo \$FPATH | sed 's#:/#\n/#g'"
alias manpathls="man --path | sed 's#:/#\n/#g'"
alias envls="printenv | sed -e '/^LS_COLORS/d' -e '/^FPATH/d' -e '/^PATH/d' -e '/^ZLS_COLORS/d'"
alias declarels="declare | sortt | sed -e '/^LS_COLORS/d' -e '/^FPATH/d' -e '/^PATH/d' -e '/^ZLS_COLORS/d'"
alias wcl="wc -l"
alias dims='echo $(tput cols) x $(tput lines)'
alias pos="osascript -e 'tell application \"iTerm\"' -e 'get position of front window' -e 'end tell' | sed 's/, / x /g'"
alias day='date +"%c"'
alias dateiso="date --iso-8601"
alias sedlog="sed -u -e 's/^$(date +%Y)/\n$(date +%Y)/' -e 's/^\[$(date +%Y)/\n\[$(date +%Y)/' -e 's/^$(date +%H):/\n$(date +%H):/' -e 's/^$(date -u +%H):/\n$(date -u +%H):/' -e 's/\"//g' -e 's/\x27//g' -e 's/\#//g' -e 's/\`//g' -e 's/*\/*/*/g'"
alias sedbat="sedlog | batrb"
alias sedby="sed -u -e 's/\b = /: /' -e 's/\b=/: /' | t2 | bl yml"
alias redis-cli="redis-cli --no-auth-warning"
# alias cl='printf "\ec\e[3J"'
# alias cl='printf "\x1b[2J\x1b[3J\x1b[1;1H"'
alias clr="tput clear"
# alias cl='clear && printf "\e[3J"'
# alias cl='printf "\033[2J\033[3J\033[1;1H"'
alias sortt="LC_ALL='C' sort -bfi"
alias prettier="prettier --no-editorconfig --config ~/.prettierrc --config-precedence cli-override --ignore-unknown"
# --ignore-path $HOME/.prettierignore --with-node-modules --print-width \$(tput cols)
alias hyperfine="hyperfine --shell=$(which -p bash)"
# alias hyperfine="hyperfine --shell=${SHELL:-$(which -p zsh)}"
alias hors="hors --all --engine google --number-answers 3 --paging never"
alias shellcheck="shellcheck --external-sources"
alias shc="shellcheck --shell=bash --severity=warning"
alias ipcalc="ipcalc --nobinary"
alias sipcalc="sipcalc --all"
alias en="trans -engine bing -brief"
alias lsd="lsd --color=auto --icon=never --date=relative --size=short --header -lAF --ignore-glob=.git --ignore-glob=.DS_Store"
alias lsdr="lsd --ignore-glob=node_modules --tree --depth=2"
alias lsdra="lsd --ignore-glob=node_modules --tree"
alias uuid8="uuid | head -c8"
alias bingrep='bingrep --demangle --color --truncate $(expr $(tput cols) - 75)'
alias mdcat="mdcat --local --no-pager"
alias cpanm="cpanm --notest"
alias zenith="zenith --disable-history"
alias lsof="lsof -P"
alias dfc="dfc -q name -d -f -T -m -l"
alias duu="du -ah -d1 | sort --human-numeric-sort"
alias psql="psql -U postgres"
which sl &>/dev/null || alias sl="sleep"
which sl0 &>/dev/null || alias sl0="sleep 0.1"
which sl1 &>/dev/null || alias sl1="sleep 1"
which sl2 &>/dev/null || alias sl2="sleep 2"
which sl3 &>/dev/null || alias sl3="sleep 3"
which tf &>/dev/null || alias tf="tail -f -n100"
which ct &>/dev/null || alias ct="column -t"
which t0 &>/dev/null || alias t0="truncate -s0"
which t1 &>/dev/null || alias t1="unexpand -t1 --first-only"
which t2 &>/dev/null || alias t2="unexpand -t2 --first-only"
which ty &>/dev/null || alias ty='expr $(tput lines) - 10'
which ty2 &>/dev/null || alias ty2='expr $(ty) / 2'
which ty4 &>/dev/null || alias ty4='expr $(ty) / 4'
which np &>/dev/null || alias np="nproc"
which np2 &>/dev/null || alias np2='expr $(nproc) / 2'
which np4 &>/dev/null || alias np4='expr $(nproc) / 4'
which bat &>/dev/null || alias bhr="echo"
which calc &>/dev/null && alias calc="calc -p"
# alias play="mkc $HOME/.playground; l"
# alias type="type -as"
# alias ll="ls -lAFhNnU"
# alias man="man -P more"

[[ "$PLATFORM" == "Linux" ]] && alias tstamp='echo -e "\n\n$(date +%c)\n\n" | sudo tee -a'
[[ "$PLATFORM" != "Linux" ]] && alias tstamp='echo -e "\n\n$(date +%c)\n\n" | tee -a'

# export GREP_COLOR="01;31;48;5;16"
# export GREP_COLORS="ms=01;31;48;5;16:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
export GREP_COLOR="01;31"
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
alias grep="grep --color=auto" # --ignore-case --extended-regexp"
alias g="grep"

if [[ ! -d "$HOME/.Trash" ]]; then
	mkdir "$HOME/.Trash"
	chmod 700 "$HOME/.Trash"
fi
alias rd="$(which -p mv) -v -f -t \$($(which -p mktemp) -d -p '$HOME/.Trash')"
alias .rm=" $(which -p mv) -f -t \$($(which -p mktemp) -d -p '$HOME/.Trash')"
alias .shredrm=" $(which -p shred) -f --remove"
alias ltrash="lm --tree --level=2 $HOME/.Trash"
alias rmtrash="ltrash; echo; read -s -q '?🔴 Empty Trash? ' || return; echo; fd --hidden --no-ignore --max-depth=1 --base-directory=$HOME/.Trash --exec rm -rf; echo; ltrash; echo; dfc"
alias {emp,empty}='echo; fd -uu -d1; echo; read -s -q "?🟠 Move to Trash? " || return; echo; echo; fd -uu -d1 -X mv -v -f -t $(mktemp -d -p "$HOME/.Trash")'

alias src="exec ${SHELL:-$(which -p zsh)}"
alias zcomp="rm -fv $HOME/.zcomp* && src"
# alias .zbak="sudo cp $HOME/.zsh_history $HOME/..zsh_history; sudo cp $HOME/.z $HOME/..z"
alias dotcd="cd $DOTFILES"
alias dotsrc="zsh $DOTFILES/install.zsh.sh && zcomp"
alias abupd="antidote update && zcomp"
function abfixpaste() {
	(
		local file="$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.zsh"
		local line="$(command grep --fixed-strings --line-number 'POSTDISPLAY="$orig_postdisplay"' "$file" | head -c3)"
		$EDITOR +$line "$file"
	)
	(
		local file="$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/safe-paste/safe-paste.plugin.zsh"
		local line="$(command grep --fixed-strings --line-number 'Load bracketed-paste-magic' "$file" | head -c2)"
		$EDITOR +$line "$file"
	)
	(
		local file="$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/theme-and-appearance.zsh"
		local line="$(command grep --fixed-strings --line-number 'if command diff' "$file" | head -c2)"
		$EDITOR +$line "$file"
	)
}

function __clear-and-accept-line() { clr && zle .reset-prompt && zle -R && zle accept-line -w }
zle -N __clear-and-accept-line
bindkey '^[k' __clear-and-accept-line
function __clear-and-accept-and-hold() { clr && zle .reset-prompt && zle -R && zle accept-and-hold -w }
zle -N __clear-and-accept-and-hold
bindkey '^[K' __clear-and-accept-and-hold
bindkey '^[[K' accept-and-hold

alias dr="deno run --unstable --no-check --allow-all"
alias we="watchexec --shell=$(which -p bash) --restart --clear"
alias dotwatch="watchexec --postpone --clear --restart --watch='$DOTFILES/deno' --exts=ts --ignore='*.d.ts' --shell=$(which -p bash) -- \
'echo -e \"█ \$WATCHEXEC_COMMON_PATH/\$WATCHEXEC_WRITTEN_PATH\n\" && $(echo $aliases[dr]) \$WATCHEXEC_COMMON_PATH/\$WATCHEXEC_WRITTEN_PATH'"

test -x "$(which -p exa)" && source "$DOTFILES/modules/exa.sh"
test -x "$(which -p fd)" && source "$DOTFILES/modules/fdfind.sh"
test -x "$(which -p rg)" && source "$DOTFILES/modules/ripgrep.sh"
test -x "$(which -p bat)" && source "$DOTFILES/modules/bat.sh"
test -x "$(which -p fzf)" && source "$DOTFILES/modules/fzf.sh"
test -x "$(which -p sk)" && source "$DOTFILES/modules/sk.sh"

alias cdp="cd ~/.playground"
alias bak='[[ -d ~/.playground/"$(basename "$PWD")" ]] && rd ~/.playground/"$(basename "$PWD")"; mkdir ~/.playground/"$(basename "$PWD")" && f --no-ignore -d1 -X cp -r -t ~/.playground/"$(basename "$PWD")"'

alias cmdls="printf '%s\n' \$commands | sortt --unique"
function cmdf() {
	cmdls | g "$*" | lscolors
} && compdef cmdf=command
function cmdfs() {
	# cmdf "$*" | while read i; do (echo && echo "█ $i" && show "$i"); done
	cmdls | g "$*" | while read i; do
		local base="$(basename "$i")"
		echo && echo "█ $base" && show "$base"
	done
} && compdef cmdfs=command

function zdebug() {
	zsh -lixc : 2>&1 | g "$@" | sed 's#^+#\n#' | bl fish
} && compdef zdebug=env

alias aliasls="alias | sortt | sed 's#^#\n#'"
function aliasf() {
	aliasls | g "$@" | bl sh
} && compdef aliasf=command

# if [[ -x "$(which -p sd)" ]]; then
# 	function .zsd() {
# 		[[ "$#" != "2" ]] && echo "🔴 number of args '$#' != '2' -> '$*'" && return
# 		rg --no-line-number --fixed-strings ":0;$1 "
# 		sd --string-mode ":0;$1 " ":0;$2 " "$HOME/.playground/zsh_history.zsh"
# 		rg --no-line-number --fixed-strings ":0;$2 "
# 		# sd --string-mode --flags=cw "$1" "$2" "$HOME/.playground/zsh_history.zsh"
# 		# rg --no-line-number --fixed-strings --case-sensitive --word-regexp "$2"
# 	} && compdef .zsd=which
# fi

alias jj="just"
function jjb() {
	if [[ $# -eq 0 ]]; then
		just --dump | sed '/^[\s]*# /d' | bl make
	else
		just --dry-run --no-highlight "$@" 2>&1 | bl sh
	fi
} && compdef jjb=just

alias gron="gron --monochrome"
export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --sort-keys --tab" && alias j="json"
# alias {json,j}="jq --sort-keys --tab"

alias scp="scp -4 -p -r"
alias rsync="rsync --ipv4 --verbose --human-readable --progress --recursive" # --archive --compress"
alias xh="xh --ipv4 --follow --timeout=5 --verbose --ignore-stdin"
alias xhh="xh --print=h"
alias xhb="xh --print=b"
alias xhp="xh --print=b --pretty=none"
alias http="http --verbose --ignore-stdin --follow --pretty=all --style=monokai --timeout=5"
alias axel="axel --ipv4 --no-clobber --alternate --timeout=5"
alias aria2dl="aria2c --console-log-level=warn --download-result=full --summary-interval=0 --file-allocation=none \
--disable-ipv6 --timeout=5 --split=4 --max-concurrent-downloads=4 --max-connection-per-server=4 --min-split-size=1M \
--auto-save-interval=0 --always-resume=false --continue=false --save-session=/dev/null --remove-control-file=true --allow-overwrite=true"
if [[ -x "$(which -p wget2)" ]]; then
	alias wget="wget2 --verbose --content-disposition --no-use-server-timestamps --progress=bar --timeout=5 --restrict-file-names=unix"
else
	alias wget="wget --quiet --content-disposition --no-iri --show-progress --connect-timeout=5 --restrict-file-names=unix"
fi
alias curl="curl --silent --show-error --fail-early --location --connect-timeout 5"
alias curlt='curl --output /dev/null --write-out "
Effective URL: %{url_effective}
Content Type: %{content_type}
Status Code: %{http_code}
Connect Code: %{http_connect}
Connects: %{num_connects}
Redirects: %{num_redirects}
Redirect URL: %{redirect_url}
Size Download: %{size_download}
Size Upload: %{size_upload}
SSL Verify: %{ssl_verify_result}

%{time_appconnect}: Handshake
%{time_connect}: Connect
%{time_namelookup}: DNS Lookup Time
%{time_pretransfer}: Pretransfer
%{time_redirect}: Redirect
%{time_starttransfer}: Start Transfer
%{time_total}: Total

"'
# alias curlt="curl --output /dev/null --write-out '\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n'"
which cl &>/dev/null || alias cl="curl"
function curlj() {
	curl "$@" | json
} && compdef curlj=curl
which clj &>/dev/null || alias clj="curlj"
function curljy() {
	curl "$@" | oq -i json -o yaml --sort-keys | t2 | bl yml
} && compdef curljy=curl
which cljy &>/dev/null || alias cljy="curljy"
function curlxy() {
	curl "$@" | oq -i xml -o yaml --sort-keys | t2 | bl yml
} && compdef curlxy=curl
which clxy &>/dev/null || alias clxy="curlxy"

if [[ -x "$(which -p rmate)" ]]; then
	which st &>/dev/null || alias st="rmate -f"
	which subl &>/dev/null || alias subl="rmate -f"
fi

alias rdvpn="echo; curl https://real-debrid.com/vpn | prettier --parser html | rg --trim --after-context=15 'VPN Information' | rg --passthru --regexp='(error|success)'"

alias mins='miniserve --verbose --interfaces=127.0.0.1 --port=$(porthash)'
alias pubserve='miniserve --verbose --interfaces=$(getip) --port=8080 --auth=admin: "$HOME/Public"'
alias pubget='wget --http-user=admin --http-password='
# test -x "$(which -p watchexec)" && alias watch="watchexec"

if [[ -x "$(which -p rustscan)" ]]; then
	alias rustscan="rustscan --top --timeout 300 --ulimit 65535 --batch-size 65535 --addresses"
fi

# alias upiso='dateadd $(dateiso) -$(uptime | rargs -p "up (\d+) days" echo "{1}")d | sd -s "-" "/"'
# alias upiso="node -p 'new Date(Date.now() - (os.uptime() * 1000)).toISOString().split(\"T\")[0].replace(/-/g, \"/\")'"
function upiso() {
	node --print '
		let d = new Date(Date.now() - (os.uptime() * 1000))
		let p = new Intl.DateTimeFormat("en-US", { year: "numeric", month: "2-digit", day: "2-digit", calendar: "iso8601" }).format(d).split("/")
		p[2] + "/" + p[0] + "/" + p[1] + " " + d.toTimeString().slice(0, 5)
	'
}
if [[ "$PLATFORM" == "Darwin" ]]; then
	alias pcsa='procs --nor "$(upiso | head -c-3)" "/Google Chrome.app/" "/iTerm" "/usr/sbin/distnoted "'
	alias pcs='pcsa "/System/Library/" "/usr/libexec/"'
	alias pst="pstree -wg3"
fi
if [[ "$PLATFORM" == "Linux" ]]; then
	alias pcsa='procs --nor "$(upiso | head -c-3)" "kworker/"'
	alias pcs='pcsa "jfsCommit" "jfsIO" "jfsSync" "xfs" "/bin/rmate "'
	alias pst="pstree --arguments --compact-not --highlight-all --long --show-parents"
fi

alias ulimitls='ulimit -S -a | bat --file-name="Soft limits" -l yml; ulimit -H -a | bat --file-name="Hard limits" -l yml'
alias htop="htop --delay=1 --highlight-changes=10"
alias psa="ps auxww"
# alias p="ps auxww | rg --fixed-strings --case-sensitive --invert-match ' rg ' | rg --fixed-strings --invert-match '/Google Chrome.app/' | rg --smart-case --fixed-strings"
function p() {
	psa | rg --fixed-strings --case-sensitive --invert-match ' rg ' | rg --fixed-strings --case-sensitive --invert-match '/Google Chrome.app/' | rg --fixed-strings --smart-case "$*" | sed 's/^/\n/' | bat --plain -l nix
} && compdef p=command
if [[ -x "$(which -p xproc)" ]]; then
	function pe() {
		pgrep "$*" | while read pid; do
			# bhr
			# echo "🟡 [exe]"
			# xproc | rg --color=never -e ": $pid, exe: (.+)" -or '$1'
			# echo
			# echo "🟡 [cmd]"
			# xproc | rg --color=never -e ": $pid, cmd\[\d+\]: (.+)" -or '$1'
			# echo
			# echo "🟡 [env]" && echo -n $(xproc | rg --color=never -e ": $pid, exe: (.+)" -or '$1')
			echo && bhr && echo "🟡 [$pid]"
			xproc | rg --color=never -e ": $pid, env\[\d+\]: (.+)" -or '$1'
		done
	} && compdef pe=pgrep
else
	function pe() {
		pgrep "$*" | while read pid; do
			# echo "🟡 pid -> '$pid'"
			echo && ps -ww -o user,pid,ppid,%cpu,%mem,time,start,command -p $pid
			local command="$(ps -ww -o command= -p $pid)"
			# echo "🟡 command -> '$command'"
			local environment="$(ps -ww -o command= -E -p $pid)"
			if [[ "${#command}" != "${#environment}" ]]; then
				environment="${environment#$command }"
				echo $environment | sed -E 's# (\w+)=#\n\1=#g' | sed -e '/^LS_COLORS/d' -e '/^FPATH/d' -e '/^ZLS_COLORS/d' | sortt | bat --plain -l ini
			fi
			# echo $environment | sd ' (\w+)=' '\n$1='
			# ps -ww -E -p $pid | tr ' ' '\n' | rg --fixed-strings --case-sensitive '=' | sortt | bat --plain -l properties
		done
	} && compdef pe=pgrep
fi
# alias pt="pst | rg --invert-match ' rg ' | rg --invert-match '/Google Chrome.app/' | rg --smart-case --fixed-strings"
# function p() {
# 	ps auxww | grep -v grep | grep "$@"
# }
function lof() {
	lsof -c "$@" | bl nix
} && compdef lof=pgrep

alias esh="/usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM SHELL=/bin/sh /bin/sh"
alias ebash="/usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM SHELL=$(which -p bash) $(which -p bash)"

function init.daemonize() {
	daemonize -v -c "$PWD" /usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM SHELL=$(which -p bash) $(which -p bash) -l -c "$*"
} && compdef init.daemonize=command
function init.daemonize.log() {
	local cmd="$(basename "$1")"
	daemonize -v -c "$PWD" -e "$HOME/.daemonize/$cmd.log" -o "$HOME/.daemonize/$cmd.log" /usr/bin/env -i HOME=$HOME USER=$USER LANG=$LANG LC_ALL=$LC_ALL TERM=$TERM SHELL=$(which -p bash) $(which -p bash) -l -c "$*"
} && compdef init.daemonize.log=command

alias .pueued='killall pueued && sleep 1; init.daemonize "trap \"fd -uu --search-path ~/Library/Application\ Support/pueue --search-path ~/Library/Preferences/pueue --search-path ~/.local/share/pueue -tf -ts -x rm -f\" EXIT; pueued" && sleep 1 && pueue parallel $(np4) && echo && pueue status'

# bindkey '^[H' man
# bindkey '^[h' man
function mans() {
	fd $(printf '--search-path %s ' $(man --path | tr ':/' ' /')) \
		--ignore-case --follow --type=file --type=symlink --exclude=man3 "$@" \
		| rg --ignore-case --fixed-strings --passthru "$(echo "${@: -1}" | tr -cd '[a-zA-Z0-9]:._-')"
} && compdef mans=command
function mansb() {
	mans "$@" | while read i; do
		echo && bhr && echo "█ $i"
		man "$(basename "$i")"
	done
} && compdef mansb=command
# alias mansr="man --global-apropos"
function mansr() {
	rg --follow --files-with-matches --glob='!man3' "$@" $(man --path | tr ':/' ' /')
} && compdef mansr=env
function mansrb() {
	rg --follow --files-with-matches --glob='!man3' "$@" $(man --path | tr ':/' ' /') | while read i; do
		echo "█ $i"
		man "$i"
	done
} && compdef mansrb=env
alias manfs="man -wa"
function manfzf() {
    man --apropos . | fzf --prompt='man ' | awk '{print $1}' | xargs -r man
}
# function idk() {
# 	man --apropos $@ | grep "$@|$"
# } && compdef idk=man

alias sttyls="stty -a | sed -e 's/; /\n/g' -e 's/;$//'"

function show() {
	type -a "$1" | bat --style=grid -l sh || return 1
	# | bat --terminal-width=$(tput cols) --style=grid | tail -n+2
	# | bat --style=grid
	if which -w "$1" | grep -q 'none$'; then
		return 1
	elif which -w "$1" | grep -q 'function$'; then
		echo
		type -f "$1" | bat -p -l sh
		exa --long --all --group --classify --extended "${$(type "$1")/"$1" is a shell function from /}"
	elif which -w "$1" | grep -q 'alias$'; then
		echo
		alias -L "$1" | bat -p -l sh
	fi
	local which="$(which -p "$1")"
	if [[ -e "$which" ]]; then
		# bat --style=header "$which"
		echo
		exa --long --all --group --classify --extended "$which"
		if [[ "$which" != "$(readlink -f $which)" ]]; then
			exa --long --all --group --classify --extended "$(readlink -f $which)"
		fi
	fi
} && compdef show=which
which s &>/dev/null || alias s="show"

function showv() {
	if ! which -ap "$1" &>/dev/null; then
		bhr && echo "🔴 not found -> '$1'" && bhr
		return 1
	fi
	which -ap "$1" | bat --style=grid -l sh
	local vflags=${@:2}
	[[ -z "$vflags" ]] && vflags="--version"
	which -ap "$1" | while read i; do
		echo -n "🟡 "
		exa "$i"
		local ii="$(realpath "$i")"
		echo -n "   " && b3sum --no-names --length=16 "$ii"
		echo -n "   " && diskus --apparent-size "$ii"
		echo "$ii $vflags" | bat --plain -l sh
		eval "$i $vflags"
		bhr
	done
} && compdef showv=command
which sv &>/dev/null || alias sv="showv"

# function readlinka() { echo -n "$(test -x "$(which -p $1)" && readlink -f $(which $1) || readlink -f $1)" | pbcopy; pbpaste | cat; echo }
function readlinka() {
	if [[ -x "$(which -p $1)" ]]; then
		exa --long --all --group --classify --extended "$(readlink -f $(which -p $1))"
	else
		exa --long --all --group --classify --extended "$(readlink -f $1)"
	fi
}

# function rename() {
# 	fd "$1" --no-ignore -x mv {} $2{}
# }

source "$DOTFILES/modules/chars.sh"
source "$DOTFILES/modules/history.sh"
test -d "$ANDROID_HOME" && source "$DOTFILES/modules/android.sh"
test -n "$HUNTER_IO_API_KEY" && source "$DOTFILES/modules/email.sh"
test -x "$(which -p adb)" && source "$DOTFILES/modules/adb.sh"
test -x "$(which -p apt)" && [[ "$PLATFORM" != "Darwin" ]] && source "$DOTFILES/modules/apt.sh"
test -x "$(which -p aws)" && source "$DOTFILES/modules/aws.sh"
test -x "$(which -p brew)" && source "$DOTFILES/modules/homebrew.sh"
test -x "$(which -p cargo)" && source "$DOTFILES/modules/cargo.sh"
test -x "$(which -p cod)" && source "$DOTFILES/modules/cod.sh"
test -x "$(which -p curl)" && source "$DOTFILES/modules/ipinfo.sh"
test -x "$(which -p curl)" && source "$DOTFILES/modules/tldr.sh"
test -x "$(which -p defaults)" && source "$DOTFILES/modules/defaults.sh"
test -x "$(which -p deno)" && source "$DOTFILES/modules/deno.sh"
test -x "$(which -p diff)" && source "$DOTFILES/modules/diff.sh"
test -x "$(which -p dotnet)" && source "$DOTFILES/modules/dotnet.sh"
test -x "$(which -p dust)" && source "$DOTFILES/modules/disk.sh"
test -x "$(which -p ffmpeg)" && source "$DOTFILES/modules/ffmpeg.sh"
test -x "$(which -p ffsend)" && source "$DOTFILES/modules/ffsend.sh"
test -x "$(which -p flutter)" && source "$DOTFILES/modules/flutter.sh"
test -x "$(which -p gem)" && source "$DOTFILES/modules/gem.sh"
test -x "$(which -p git)" && source "$DOTFILES/modules/git.sh"
test -x "$(which -p go)" && source "$DOTFILES/modules/go.sh"
test -x "$(which -p ip)" && [[ "$PLATFORM" != "Darwin" ]] && source "$DOTFILES/modules/iproute2.sh"
test -x "$(which -p joker)" && source "$DOTFILES/modules/joker.sh"
test -x "$(which -p launchctl)" && source "$DOTFILES/modules/launchctl.sh"
test -x "$(which -p navi)" && source "$DOTFILES/modules/navi.sh"
test -x "$(which -p nix)" && source "$DOTFILES/modules/nix.sh"
test -x "$(which -p nomad)" && source "$DOTFILES/modules/nomad.sh"
test -x "$(which -p npm)" && source "$DOTFILES/modules/npm.sh"
test -x "$(which -p osascript)" && source "$DOTFILES/modules/osascript.sh"
test -x "$(which -p php)" && source "$DOTFILES/modules/php.sh"
test -x "$(which -p pkg-config)" && source "$DOTFILES/modules/pkg-config.sh"
test -x "$(which -p port)" && source "$DOTFILES/modules/macports.sh"
test -x "$(which -p python3)" && source "$DOTFILES/modules/python.sh"
test -x "$(which -p rclone)" && source "$DOTFILES/modules/rclone.sh"
test -x "$(which -p rustup)" && source "$DOTFILES/modules/rustup.sh"
test -x "$(which -p tar)" && source "$DOTFILES/modules/tar.sh"
test -x "$(which -p wget)" && source "$DOTFILES/modules/speedtest.sh"
test -x "$(which -p yt-dlp)" && source "$DOTFILES/modules/youtube-dl.sh"

function dotcompinit() {
	# echo "🟡 dotcompinit"
	# echo "🟡 ZSH_COMPDUMP_EXISTS -> '$ZSH_COMPDUMP_EXISTS'"
	[[ ! -z "$ZSH_COMPDUMP_EXISTS" ]] && return 0
	local zcompdump_metadata="$(command grep '^#omz' "$ZSH_COMPDUMP" 2>/dev/null)"
	compinit -d "${ZSH_COMPDUMP}"
	echo "\n$zcompdump_metadata" >>! "$ZSH_COMPDUMP"
	echo; echo "🟢 ZSH compinit"
}

# compinit -d "${ZSH_COMPDUMP}"
# autoload -U compinit && compinit
# autoload -U bashcompinit && bashcompinit

# autoload -U promptinit; promptinit
# autoload -U compinit && compinit
# source $ZSH/oh-my-zsh.sh
# source <(npm completion)
# source <(pm2 completion)
# source <(tns completion)

# zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
# zstyle ':completion:*' insert-tab pending
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
