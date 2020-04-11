#!/usr/bin/env zsh

[[ -e "$DOTFILES/.env" ]] && source "$DOTFILES/.env"

if [[ -d "$HOME/.nix-profile" ]]; then
	source "$HOME/.nix-profile/etc/profile.d/nix.sh"
	local nixbin="$HOME/.nix-profile/bin"
	if echo $PATH | grep --quiet --fixed-strings "$nixbin"; then
		export PATH="${PATH#$nixbin:}:$nixbin"
	fi
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



export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# zle_highlight+=(paste:bold)

source <(antibody init)
antibody bundle < "$DOTFILES/antibody/antibody.ohmyzsh.sh" < "$DOTFILES/antibody/antibody.${PLATFORM##*/}.sh" < "$DOTFILES/antibody/antibody.sh"
# eval $(starship init zsh)

eval $(dircolors -b "$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-trapd00r-SLASH-LS_COLORS/LS_COLORS")
# LS_COLORS+="di=38;5;30"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"



export HISTSIZE="10000000"
export SAVEHIST="10000000"
setopt hist_ignore_all_dups

setopt rm_star_silent
# setopt bash_auto_list
# setopt list_ambiguous

# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:manuals.*' insert-sections true
# zstyle ':completion:*:man:*' menu yes select

# export FAST_HIGHLIGHT[use_async]="0"
# export PROMPT="%(?.%F{magenta}△.%F{red}▲)%f "
# unsetopt prompt_cr prompt_sp

alias bindkey-debug="echo press key to observe key codes:; cat -v"
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
# alias rmf="rm -rf"
# alias cp="cp -v"
# alias mv="mv -v"
# alias rm="rm -v"

alias sudo="sudo "
alias e="nano"
alias mv="mv -v"
alias rm="rm -v"
alias cp="cp -rv"
alias rd="rm -rf"
alias k="killall -KILL"
alias ls="ls --color=always"
alias ll="ls -laph"
alias pwda="pwd && pwd -P"
alias pathls="echo \$PATH | sed 's/:\//\n\//g'"
alias fpathls="echo \$FPATH | sed 's/:\//\n\//g'"
alias manpathls="manpath | sed 's/:\//\n\//g'"
# alias manpathls="man --path | sed 's/:\//\n\//g'"
alias commandsls="echo \$commands | sed 's/ \//\n\//g' | sortt"
# alias commandsls="print -l \$commands | sortt"
alias rc="rclone"
alias ipc="ipcalc -b"
alias dims='echo $COLUMNS x $LINES'
alias dateiso="date --iso-8601"
alias sedbat="sed -u -r 's/\"|\x27|\#|\`//g' | batrb"
alias redis-cli="redis-cli --no-auth-warning"
alias gradlew="\$PWD/gradlew"
alias clear="printf '\033[2J\033[3J\033[1;1H'"
# alias clear="clear && printf '\e[3J'"
alias sortt="sort --ignore-case --ignore-leading-blanks --ignore-nonprinting"
alias prettier="prettier --no-color --no-editorconfig --config $HOME/.prettierrc --ignore-path $HOME/.prettierignore"
# --with-node-modules --print-width \$(tput cols)
alias archey="archey --offline"
# alias play="mkc $HOME/.playground; l"
# alias sedbat='sd "\"|\x27|\`" "" | batrb'
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"

alias zbak="sudo cp $HOME/.zsh_history $HOME/..zsh_history; sudo cp $HOME/.z $HOME/..z"
alias zcomp="rm -v $HOME/.zcomp*; exit"
alias abupd="antibody update; zcomp"
alias abautosuggestions="bat \$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.zsh --line-range=320:324" # --highlight-line=322

# export GREP_COLOR="01;31;48;5;16"
# export GREP_COLORS="ms=01;31;48;5;16:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
export GREP_COLOR="01;31"
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36"
alias grep="grep --color=always --ignore-case --extended-regexp"
alias g="grep"

test -x "$(which -p exa)" && source "$DOTFILES/modules/exa.sh"
test -x "$(which -p fd)" && source "$DOTFILES/modules/fd-find.sh"
test -x "$(which -p rg)" && source "$DOTFILES/modules/ripgrep.sh"
test -x "$(which -p bat)" && source "$DOTFILES/modules/bat.sh"
test -x "$(which -p fzf)" && source "$DOTFILES/modules/fzf.sh"

alias hist="history | tail -n $(expr $(tput lines) - 10) | bat -l sh"
alias aliasls="alias -L | sed 's/^/\n/g' | bat -l sh"
alias aliaslss="aliasls | grep --color=never"
alias dotcd="cd $DOTFILES"

# export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;30:2;30'
export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --color-output --sort-keys --tab"
alias j="json"

alias http="echo; http --verbose --ignore-stdin --pretty=all --style=monokai --timeout=5"
alias wget="wget --connect-timeout=5"
alias curl="curl --silent --show-error --connect-timeout 5"
alias curlt="curl --output /dev/null --write-out '\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n'"
function curlj() {
	curl "$@" | json
}

test -x "$(which -p rmate)" && alias st="rmate --new --force --verbose"

alias proxychains="proxychains4 -f /usr/local/etc/proxychains.conf"

# function ipcalc() { npx -q ipcalc-cli $@ | grep Net --color=never | tail -n 4 }

alias p="ps auxww | grep --invert-match grep | grep"
# function p() {
# 	ps auxww | grep -v grep | grep "$@"
# }

# test -x "$(which -p watchexec)" && alias watch="watchexec"

alias mans="man -k"
alias mansa="man -K"
alias manfs="man -w"
# function idk() {
# 	man --apropos $@ | grep "$@|$"
# }; compdef idk=man

function show() {
	if [[ -n $2 ]]; then
		echo "🔴 only 1 argument supported"
		return 1
	fi
	type -a $@
	# | bat --terminal-width=$(tput cols) --style=grid | tail -n+2
	# | bat --style=grid
	if which -w $@ | grep -q 'none$'; then
		return 1
	elif which -w $@ | grep -q 'function$'; then
		echo
		type -f $@ | bat -p -l sh
		exa --long --all --group --classify --extended "${$(type $@)/$@ is a shell function from /}"
	elif which -w $@ | grep -q 'alias$'; then
		echo
		alias -L $@ | bat -p -l sh
	fi
	local which="$(which -p $@)"
	if [[ -e "$which" ]]; then
		echo
		# bat --style=header "$which"
		exa --long --all --group --classify --extended "$which"
		if [[ "$which" != "$(readlink -f $which)" ]]; then
			exa --long --all --group --classify --extended "$(readlink -f $which)"
		fi
	fi
}; compdef show=which

# function readlinka() { echo -n "$(test -x "$(which -p $@)" && readlink -f $(which $@) || readlink -f $@)" | pbcopy; pbpaste | cat; echo }
function readlinka() {
	if [[ -x "$(which -p $@)" ]]; then
		exa --long --all --group --classify --extended "$(readlink -f $(which -p $@))"
	else
		exa --long --all --group --classify --extended "$(readlink -f $@)"
	fi
}

# function rename() {
# 	fd "$1" --no-ignore -x mv {} $2{}
# }

alias rdvpn="echo; curl https://real-debrid.com/vpn | prettier --parser html | rg --trim --after-context=15 'VPN Information' | rg --passthru --regexp='(error|success)'"
# alias ffprobe="ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams"
if [[ -x "$(which -p ffprobe)" ]]; then
	function fprobe() {
		ffprobe -pretty -loglevel quiet -print_format json -show_format -show_streams $@ | json | rg --passthru --ignore-case --regexp='".*_frame_.*"'
	}
	if [[ "$PLATFORM" == "Darwin" ]]; then
		compdef fprobe=ffprobe
	fi
fi

source "$DOTFILES/modules/disk.sh"
test -d "/usr/local/share/android-sdk" && source "$DOTFILES/modules/android.sh"
test -n "$_HUNTER_IO_API_KEY" && source "$DOTFILES/modules/email.sh"
test -x "$(which -p adb)" && source "$DOTFILES/modules/adb.sh"
test -x "$(which -p apt)" && source "$DOTFILES/modules/apt.sh"
test -x "$(which -p aws)" && source "$DOTFILES/modules/aws.sh"
test -x "$(which -p brew)" && source "$DOTFILES/modules/homebrew.sh"
test -x "$(which -p cargo)" && source "$DOTFILES/modules/cargo.sh"
test -x "$(which -p curl)" && source "$DOTFILES/modules/ipinfo.sh"
test -x "$(which -p curl)" && source "$DOTFILES/modules/tldr.sh"
test -x "$(which -p diff)" && source "$DOTFILES/modules/diff.sh"
test -x "$(which -p dotnet)" && source "$DOTFILES/modules/dotnet.sh"
test -x "$(which -p ffsend)" && source "$DOTFILES/modules/ffsend.sh"
test -x "$(which -p gem)" && source "$DOTFILES/modules/gem.sh"
test -x "$(which -p git)" && source "$DOTFILES/modules/git.sh"
test -x "$(which -p go)" && source "$DOTFILES/modules/go.sh"
test -x "$(which -p htop)" && source "$DOTFILES/modules/htop.sh"
test -x "$(which -p ip)" && source "$DOTFILES/modules/ip.sh"
test -x "$(which -p launchctl)" && source "$DOTFILES/modules/launchctl.sh"
test -x "$(which -p navi)" && source "$DOTFILES/modules/navi.sh"
test -x "$(which -p nix)" && source "$DOTFILES/modules/nix.sh"
test -x "$(which -p npm)" && source "$DOTFILES/modules/npm.sh"
test -x "$(which -p osascript)" && source "$DOTFILES/modules/osascript.sh"
test -x "$(which -p php)" && source "$DOTFILES/modules/php.sh"
test -x "$(which -p pip)" && source "$DOTFILES/modules/pip.sh"
test -x "$(which -p python)" && source "$DOTFILES/modules/python.sh"
test -x "$(which -p rustup)" && source "$DOTFILES/modules/rustup.sh"
test -x "$(which -p tar)" && source "$DOTFILES/modules/tar.sh"
test -x "$(which -p tc)" && source "$DOTFILES/modules/tc.sh"
test -x "$(which -p wget)" && source "$DOTFILES/modules/speed-test.sh"
test -x "$(which -p youtube-dl)" && source "$DOTFILES/modules/youtube-dl.sh"

autoload -U compinit && compinit
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
