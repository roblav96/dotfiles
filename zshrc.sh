#!/usr/bin/env zsh

# SKIP_DIRS+=

[[ -e "$DOTFILES/.env" ]] && source "$DOTFILES/.env"

if [[ -x "$(which -p nano)" ]]; then
	export EDITOR="nano"
	export VEDITOR="nano"
	export VISUAL="nano"
fi

[[ -z "$HOME" ]] && export HOME="$(dirname $DOTFILES)"
export ZSH_COMPDUMP_EXISTS="$(echo $HOME/.zcomp*)" 2>/dev/null

if [[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
	source "$HOME/.nix-profile/etc/profile.d/nix.sh"
	# if echo "$PATH" | grep --quiet --fixed-strings "$HOME/.nix-profile/bin"; then
	# 	export PATH="${PATH#$HOME/.nix-profile/bin:}"
	# 	export PATH="${PATH#$HOME/.nix-profile/bin:}:$HOME/.nix-profile/bin"
	# fi
fi

[[ -x "$(which -p tabs)" ]] && tabs -4

export CLICOLOR="1"
export ADBLOCK="1"
export DEBUG_COLORS="1"
export DISABLE_OPENCOLLECTIVE="1"
export FORCE_COLOR="1"
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

# export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
export LESS="--raw-control-chars --quit-on-intr --squeeze-blank-lines --ignore-case --hilite-search --LONG-PROMPT --jump-target=.5"
export LESSCHARSET="utf-8"
# export LESSCHARDEF="utf-8"
# export PAGER="less"
# export MANPAGER="$PAGER"
# export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | command bat -p -l man --pager \"less $LESS\"'"
export MANOPT="--encoding=ascii"
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
# [[ -f "$DOTFILES/zinit/zinit.oh-my-zsh.sh" ]] && source "$DOTFILES/zinit/zinit.oh-my-zsh.sh"
# [[ -f "$DOTFILES/zinit/zinit.$PLATFORM.sh" ]] && source "$DOTFILES/zinit/zinit.$PLATFORM.sh"
# [[ -f "$DOTFILES/zinit/zinit.sh" ]] && source "$DOTFILES/zinit/zinit.sh"



local GENCOMPL_FPATH="$HOME/.cache/gencomp"
[[ ! -d "$GENCOMPL_FPATH" ]] && mkdir -pv "$GENCOMPL_FPATH"
zstyle :plugin:zsh-completion-generator programs ""
fpath=($GENCOMPL_FPATH $fpath)

if [[ -x "$(which -p antibody)" ]]; then
	export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
	# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
	# zle_highlight+=(paste:bold)

	source <(antibody init)
	antibody bundle < "$DOTFILES/antibody/antibody.ohmyzsh.sh" < "$DOTFILES/antibody/antibody.$PLATFORM.sh" < "$DOTFILES/antibody/antibody.sh"

	eval "$(dircolors --bourne-shell "$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-trapd00r-SLASH-LS_COLORS/LS_COLORS")"
	LS_COLORS+="*-=38;5;241:*~=38;5;241:"
	zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

	# local sitefns="${fpath[2]}"
	# unset fpath[2]
	# local fns="${fpath[2]}"
	# unset fpath[2]
	# echo "fpath -> '$fpath'"
fi



# export ZSH_COMPDEF="$(which -w compdef | grep -q 'function$' && echo 1)"

export HISTSIZE="999999999"
export SAVEHIST="999999999"
setopt hist_ignore_all_dups

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

unalias grep &>/dev/null
unalias la &>/dev/null
unalias ls &>/dev/null
unalias path &>/dev/null
unalias pip &>/dev/null

# alias fo="forever "
# alias rma="rm -rf"
# alias rmd="rm -rf"
# alias cp="cp -v"
# alias mv="mv -v"
# alias rm="rm -v"

alias sudo="sudo "
# compdef sudo=which

alias e="nano"
alias ln="ln -v"
alias mv="mv -v"
alias cp="cp -vr"
alias rm="rm -v"
alias shred="shred -v"
alias chown="chown -v"
alias chmod="chmod -v"
alias chmodx="chmod a+x"
alias rp="realpath"
alias k="killall -KILL"
alias ls="ls --color=always"
alias ll="ls -laph"
alias pwda="pwd && pwd -P"
alias hist="cat $HOME/.zsh_history | sed 's#^.*:0;##g'"
alias pathls="echo \$PATH | sed 's#:/#\n/#g'"
# alias pathls="echo \$PATH | sed -e 's#:/#\n/#g' -e 's#:~#\n~#g'"
alias fpath-ls="echo \$FPATH | sed 's#:/#\n/#g'"
alias manpathls="man --path | sed 's#:/#\n/#g'"
alias aliasls="alias -L | sed 's#^#\n#g'"
alias commandsls='printf "%s\n" $commands | sortt'
alias envls="env | sortt"
alias rc="rclone"
alias dims='echo $(tput cols) x $(tput lines)'
alias pos="osascript -e 'tell application \"Terminal\"' -e 'get position of front window' -e 'end tell' | sed 's/, / x /g'"
alias dateiso="date --iso-8601"
alias sedlog="sed -u -r 's/\"|\x27|\#|\`//g'"
alias sedbat="sedlog | batrb"
alias redis-cli="redis-cli --no-auth-warning"
alias clear="printf '\033[2J\033[3J\033[1;1H'"
alias cl="clear"
# alias clear="clear && printf '\e[3J'"
alias sortt="sort --ignore-case --ignore-leading-blanks --ignore-nonprinting"
alias prettier="prettier --no-color --no-editorconfig --config $HOME/.prettierrc" # --ignore-path $HOME/.prettierignore --with-node-modules --print-width \$(tput cols)
alias hyperfine="hyperfine --shell=$SHELL"
alias ipcalc="ipcalc --nobinary"
alias chars="echo; bat --plain $DOTFILES/static/emoji-chars.conf"
# alias play="mkc $HOME/.playground; l"
# alias sedbat='sd "\"|\x27|\`" "" | batrb'
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"

if [[ ! -d "$HOME/.Trash" ]]; then
	mkdir "$HOME/.Trash"
	chmod 700 "$HOME/.Trash"
fi
alias rd="$(which -p mv) -v -f -t \$($(which -p mktemp) -d -p $HOME/.Trash)"
alias rmf="$(which -p mv) -f -t \$($(which -p mktemp) -d -p $HOME/.Trash)"
alias ltrash="lr $HOME/.Trash"
alias rmtrash="ltrash; echo; read -q '?Empty Trash? ' && return 1; fd --hidden --no-ignore --max-depth=1 --base-directory=$HOME/.Trash --exec-batch rm -rf; echo; ltrash"

alias src="exec ${SHELL:-$(which -p zsh)}"
alias zcomp="rm -fv $HOME/.zcomp* && src"
alias zbak="sudo cp $HOME/.zsh_history $HOME/..zsh_history; sudo cp $HOME/.z $HOME/..z"
alias dotcd="cd $DOTFILES"
alias dotsrc="zsh $DOTFILES/install.zsh && zcomp"
alias abupd="antibody update && zcomp"
function abfixpaste() {
	local file="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.zsh"
	local line="$(command grep --fixed-strings --line-number 'POSTDISPLAY="$orig_postdisplay"' "$file" | head -c3)"
	nano +$line "$file"
}

function __clear-and-accept-line() { clear && zle accept-line -w }
zle -N __clear-and-accept-line
bindkey '^[k' __clear-and-accept-line
function __clear-and-accept-and-hold() { clear && zle accept-and-hold -w }
zle -N __clear-and-accept-and-hold
bindkey '^[K' __clear-and-accept-and-hold

# export GREP_COLOR="01;31;48;5;16"
# export GREP_COLORS="ms=01;31;48;5;16:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
export GREP_COLOR="01;31"
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
alias grep="grep --color=always --ignore-case --extended-regexp"
alias g="grep"

test -x "$(which -p exa)" && source "$DOTFILES/modules/exa.sh"
test -x "$(which -p fd)" && source "$DOTFILES/modules/fdfind.sh"
test -x "$(which -p rg)" && source "$DOTFILES/modules/ripgrep.sh"
test -x "$(which -p bat)" && source "$DOTFILES/modules/bat.sh"
test -x "$(which -p fzf)" && source "$DOTFILES/modules/fzf.sh"
test -x "$(which -p sk)" && source "$DOTFILES/modules/sk.sh"

# if [[ -x "$(which -p sd)" ]]; then
# 	function .zsd() {
# 		[[ "$#" != "2" ]] && echo "🔴 number of args '$#' != '2' -> '$*'" && return
# 		rg --no-line-number --fixed-strings ":0;$1 "
# 		sd --string-mode ":0;$1 " ":0;$2 " "$HOME/.playground/zsh_history.zsh"
# 		rg --no-line-number --fixed-strings ":0;$2 "
# 		# sd --string-mode --flags=cw "$1" "$2" "$HOME/.playground/zsh_history.zsh"
# 		# rg --no-line-number --fixed-strings --case-sensitive --word-regexp "$2"
# 	}; compdef .zsd=which
# fi

export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --sort-keys --tab"
alias j="json"

# alias http="echo; $(test -x "$(which -p https)" && echo "https" || echo "http") --verbose --ignore-stdin --follow --pretty=all --style=monokai --timeout=5"
alias http="echo; http --verbose --ignore-stdin --follow --pretty=all --style=monokai --timeout=5"
alias axel="axel --alternate --timeout=5"
alias wget="wget --quiet --show-progress --connect-timeout=5"
alias curl="curl --silent --show-error --fail-early --location --connect-timeout 5"
alias curlt='curl --output /dev/null --write-out "
	Effective URL = %{url_effective}
	Content Type = %{content_type}
	Status Code = %{http_code}
	Connect Code = %{http_connect}
	Connects = %{num_connects}
	Redirects = %{num_redirects}
	Redirect URL = %{redirect_url}
	Size Download = %{size_download}
	Size Upload = %{size_upload}
	SSL Verify = %{ssl_verify_result}

	%{time_appconnect} Handshake
	%{time_connect} Connect
	%{time_namelookup} DNS Lookup Time
	%{time_pretransfer} Pretransfer
	%{time_redirect} Redirect
	%{time_starttransfer} Start Transfer
	%{time_total} = Total
"'
# alias curlt="curl --output /dev/null --write-out '\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n'"
function curlj() {
	curl "$*" | json
}

if [[ -x "$(which -p rmate)" ]]; then
	alias st="rmate"
	alias subl="rmate"
fi

alias proxychains="proxychains4 -f /usr/local/etc/proxychains.conf"
alias rdvpn="echo; curl https://real-debrid.com/vpn | prettier --parser html | rg --trim --after-context=15 'VPN Information' | rg --passthru --regexp='(error|success)'"

alias serve="miniserve --no-symlinks --verbose --port=8888"
alias pubserve="serve --auth=admin: $HOME/Public"
alias pubget="wget --http-user=admin --http-password="

alias pa="ps auxww"
alias p="pa | rg --fixed-strings --invert-match ' rg ' | rg --fixed-strings --invert-match '/Google Chrome.app/' | rg --smart-case --fixed-strings"
[[ "$PLATFORM" == "Darwin" ]] && alias pst="pstree -wg3"
[[ "$PLATFORM" == "Linux" ]] && alias pst="pstree --arguments --compact-not --highlight-all --long --show-parents"
alias pt="pst | rg --invert-match ' rg ' | rg --invert-match '/Google Chrome.app/' | rg --smart-case --fixed-strings"
# function p() {
# 	ps auxww | grep -v grep | grep "$@"
# }

# test -x "$(which -p watchexec)" && alias watch="watchexec"

function mans() {
	man -k "$*" | rgp "$*"
}; compdef mans=man
alias mansr="man -K"
alias manfs="man -w"
function manf() {
    man -k . | fzf --prompt='man ' | awk '{print $1}' | xargs -r man
}
# function idk() {
# 	man --apropos $@ | grep "$@|$"
# }; compdef idk=man

function show() {
	[[ -z $1 ]] && return 1
	type -a $1
	[[ $? != 0 ]] && return 1
	# | bat --terminal-width=$(tput cols) --style=grid | tail -n+2
	# | bat --style=grid
	if which -w $1 | grep -q 'none$'; then
		return 1
	elif which -w $1 | grep -q 'function$'; then
		echo
		type -f $1 | bat -p -l sh
		exa --long --all --group --classify --extended "${$(type $1)/$1 is a shell function from /}"
	elif which -w $1 | grep -q 'alias$'; then
		echo
		alias -L $1 | bat -p -l sh
	fi
	local which="$(which -p $1)"
	if [[ -e "$which" ]]; then
		echo
		# bat --style=header "$which"
		exa --long --all --group --classify --extended "$which"
		if [[ "$which" != "$(readlink -f $which)" ]]; then
			exa --long --all --group --classify --extended "$(readlink -f $which)"
		fi
	fi
}; compdef show=which

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

# alias fprobe="ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams"
if [[ -x "$(which -p ffprobe)" ]]; then
	function fprobe() {
		ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams "$*" | json --color-output | rg --passthru --ignore-case --regexp='".*_frame_.*"'
	}
	# which -w _ffprobe | grep -qv 'none$' && compdef fprobe=ffprobe
fi
if [[ -x "$(which -p ffmpeg)" ]]; then
	function ffmp3() {
		local file; for file in "$@"; do
			if [[ -f "$file" ]]; then
				ffmpeg -i "$file" -vn -b:a 320k "$file.mp3"
			fi
		done
	}
fi

source "$DOTFILES/modules/disk.sh"
test -d "$HOME/Library/Android/sdk" && source "$DOTFILES/modules/android.sh"
test -n "$_HUNTER_IO_API_KEY" && source "$DOTFILES/modules/email.sh"
test -x "$(which -p adb)" && source "$DOTFILES/modules/adb.sh"
test -x "$(which -p apt)" && [[ "$PLATFORM" != "Darwin" ]] && source "$DOTFILES/modules/apt.sh"
test -x "$(which -p aws)" && source "$DOTFILES/modules/aws.sh"
test -x "$(which -p brew)" && source "$DOTFILES/modules/homebrew.sh"
test -x "$(which -p cod)" && source "$DOTFILES/modules/cod.sh"
test -x "$(which -p curl)" && source "$DOTFILES/modules/ipinfo.sh"
test -x "$(which -p curl)" && source "$DOTFILES/modules/tldr.sh"
test -x "$(which -p defaults)" && source "$DOTFILES/modules/defaults.sh"
test -x "$(which -p diff)" && source "$DOTFILES/modules/diff.sh"
test -x "$(which -p direnv)" && source "$DOTFILES/modules/direnv.sh"
test -x "$(which -p dotnet)" && source "$DOTFILES/modules/dotnet.sh"
test -x "$(which -p ffsend)" && source "$DOTFILES/modules/ffsend.sh"
test -x "$(which -p git)" && source "$DOTFILES/modules/git.sh"
test -x "$(which -p go)" && source "$DOTFILES/modules/go.sh"
test -x "$(which -p htop)" && source "$DOTFILES/modules/processes.sh"
test -x "$(which -p ip)" && [[ "$PLATFORM" != "Darwin" ]] && source "$DOTFILES/modules/iproute2.sh"
test -x "$(which -p launchctl)" && source "$DOTFILES/modules/launchctl.sh"
test -x "$(which -p navi)" && source "$DOTFILES/modules/navi.sh"
test -x "$(which -p nix)" && source "$DOTFILES/modules/nix.sh"
test -x "$(which -p npm)" && source "$DOTFILES/modules/npm.sh"
test -x "$(which -p osascript)" && source "$DOTFILES/modules/osascript.sh"
test -x "$(which -p php)" && source "$DOTFILES/modules/php.sh"
test -x "$(which -p python)" && source "$DOTFILES/modules/python.sh"
test -x "$(which -p ruby)" && source "$DOTFILES/modules/ruby.sh"
test -x "$(which -p rustup)" && source "$DOTFILES/modules/rust.sh"
test -x "$(which -p tar)" && source "$DOTFILES/modules/tar.sh"
test -x "$(which -p wget)" && source "$DOTFILES/modules/speedtest.sh"
test -x "$(which -p youtube-dl)" && source "$DOTFILES/modules/youtubedl.sh"

function dotcompinit() {
	# echo "🌕 dotcompinit"
	# echo "🌕 ZSH_COMPDUMP_EXISTS -> '$ZSH_COMPDUMP_EXISTS'"
	[[ ! -z "$ZSH_COMPDUMP_EXISTS" ]] && return 0
	local zcompdump_metadata="$(command grep '^#omz' "$ZSH_COMPDUMP" 2>/dev/null)"
	compinit -d "${ZSH_COMPDUMP}"
	echo "\n$zcompdump_metadata" >>! "$ZSH_COMPDUMP"
	echo; echo "✅ ZSH compinit"
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
