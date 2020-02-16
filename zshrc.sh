#!/usr/bin/env zsh

test -e "$DOTFILES/.env" && source "$DOTFILES/.env"
test -d "$HOME/.nix-profile" && source "$HOME/.nix-profile/etc/profile.d/nix.sh"

export CLICOLOR="1"
export ADBLOCK="1"
export DEBUG_COLORS="1"
export DISABLE_OPENCOLLECTIVE="1"
export FORCE_COLOR="1"
export SUPPRESS_SUPPORT="1"

# export RPROMPT="%F{000}%* %F{001}%* %F{002}%* %F{003}%* %F{004}%* %F{005}%* %F{006}%* %F{007}%* %F{008}%* %F{009}%*"
# export RPROMPT="%F{008}%*"
export RPROMPT="%F{008}%*"
export PURE_PROMPT_SYMBOL="➤"
export PURE_CMD_MAX_EXEC_TIME="1"
export KEYTIMEOUT="25"
# export PROMPT_EOL_MARK="➜"
# source "$DOTFILES/modules/geometry.sh"

# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold,underline"

export TERM="xterm-256color"
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

test -x "$(which -p starship)" && eval "$(starship init zsh)"



# export ZSH="$HOME/.zinit/plugins/ohmyzsh---ohmyzsh"
# test -f "$DOTFILES/zinit/zinit.oh-my-zsh.sh" && source "$DOTFILES/zinit/zinit.oh-my-zsh.sh"
# test -f "$DOTFILES/zinit/zinit.$PLATFORM.sh" && source "$DOTFILES/zinit/zinit.$PLATFORM.sh"
# test -f "$DOTFILES/zinit/zinit.sh" && source "$DOTFILES/zinit/zinit.sh"



export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
# export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# zle_highlight+=(paste:bold)

source <(antibody init)
antibody bundle < "$DOTFILES/antibody/antibody.ohmyzsh.sh" < "$DOTFILES/antibody/antibody.${PLATFORM##*/}.sh" < "$DOTFILES/antibody/antibody.sh"
# eval $(starship init zsh)

eval $(dircolors -b "$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-trapd00r-SLASH-LS_COLORS/LS_COLORS")
# LS_COLORS+="di=38;5;30"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"



export HISTSIZE="5000000"
export SAVEHIST="1000000"
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
alias rd="rm -rf"
alias k="killall -KILL"
alias ls="ls --color=always"
alias ll="ls -laph"
alias pwd="pwd && pwd -P"
alias pathls="echo \$PATH | sed 's/:\//\n\//g'"
alias fpathls="echo \$FPATH | sed 's/:\//\n\//g'"
alias manpathls="man --path | sed 's/:\//\n\//g'"
alias commandsls="print -l \$commands"
alias rc="rclone"
alias htop="htop --delay=10"
alias procs="procs --color always --pager disable --sortd Start"
alias ipc="ipcalc -b"
alias dims="echo $COLUMNS x $LINES"
alias dateiso="date --iso-8601"
alias sedbat="sed -u -r 's/\"|\x27|\#|\`//g' | batrb"
alias zbak="sudo cp $HOME/.zsh_history $HOME/..zsh_history; sudo cp $HOME/.z $HOME/..z"
alias redis-cli="redis-cli --no-auth-warning"
alias gradlew="./gradlew"
alias clear="clear && printf '\e[3J'"
alias zcomp="rm -v $(dirname $DOTFILES)/.zcomp*; compinit; exit"
alias abupd="antibody update; zcomp"
alias sortt="sort --ignore-case --ignore-leading-blanks --ignore-nonprinting"
alias prettier="prettier --no-color --with-node-modules --no-editorconfig --config $HOME/.prettierrc --print-width \$(tput cols)"
alias play="mkc $HOME/.playground; l"
# alias sedbat='sd "\"|\x27|\`" "" | batrb'
# alias type="type -as"
# alias ll="ls -lAFhnU"
# alias man="man -P more"

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
alias dotcd="cd $DOTFILES"
alias vue="FORCE_COLOR=0 npx vue-cli-service"

# export JQ_COLORS='0;31:0;34:0;34:0;35:0;32:2;30:2;30'
export JQ_COLORS="0;31:0;36:0;36:0;35:0;32:2;37:2;37"
alias json="jq --color-output --sort-keys --tab --indent 4"
alias j="json"

alias http="echo; http --verbose --ignore-stdin --pretty=all --style=monokai --timeout=10"
alias wget="wget --connect-timeout=10"
alias curl="curl --silent --show-error --connect-timeout 10"
alias curlt="curl --output /dev/null --write-out '\n%{time_namelookup} DNS Lookup \n%{time_connect} Connect \n%{time_appconnect} App Connect \n%{time_pretransfer} Init Transfer \n%{time_starttransfer} Start Transfer \n%{time_total} Total\n'"
function curlj() {
	curl "$@" | json
}

test -x "$(which -p rmate)" && alias st="rmate --force --verbose"

alias proxychains="proxychains4 -f /usr/local/etc/proxychains.conf"

# function ipcalc() { npx -q ipcalc-cli $@ | grep Net --color=never | tail -n 4 }

alias p="ps auxww | grep --invert-match grep | grep"
# function p() {
# 	ps auxww | grep -v grep | grep "$@"
# }

# test -x "$(which -p watchexec)" && alias watch="watchexec"
# test -x "$(which -p procs)" && alias procs="sudo procs"

function idk() {
	man --apropos $@ | grep "$@|$"
}; compdef idk=man

function show() {
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

# function rl() { echo -n "$(test -x "$(which -p $@)" && readlink -f $(which $@) || readlink -f $@)" | pbcopy; pbpaste | cat; echo }
function rl() {
	if [[ -x "$(which -p $@)" ]]; then
		exa --long --all --group --classify --extended "$(readlink -f $(which -p $@))"
	else
		exa --long --all --group --classify --extended "$(readlink -f $@)"
	fi
}

alias tl="tldr"
function ch() {
	local lang="sh"
	if [[ $# -gt 1 ]]; then
		lang="$1"
	fi
	curl "https://cht.sh/$*?T" | bat -l $lang
}
function cha() {
	curl "https://raw.githubusercontent.com/cheat/cheatsheets/master/$1" | bat -l sh
}
# function cha() { test -f ~/.config/cheat/community/$@ && bat ~/.config/cheat/community/$@ -l sh || echo "Not Found!" }
alias ch-bash="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/languages/bash.sh | bat -l sh"
alias ch-git="curl https://raw.githubusercontent.com/LeCoupa/awesome-cheatsheets/master/tools/git.sh | bat -l sh"

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

# test -d "/usr/local/opt/wireguard-tools/etc/bash_completion.d" && source /usr/local/opt/wireguard-tools/etc/bash_completion.d/*
source "$DOTFILES/modules/disk.sh"
test -d "/usr/local/share/android-sdk" && source "$DOTFILES/modules/android.sh"
test -n "$__HUNTER_IO_API_KEY" && source "$DOTFILES/modules/email.sh"
test -x "$(which -p adb)" && source "$DOTFILES/modules/adb.sh"
test -x "$(which -p apt)" && source "$DOTFILES/modules/apt.sh"
test -x "$(which -p cargo)" && source "$DOTFILES/modules/cargo.sh"
test -x "$(which -p curl)" && source "$DOTFILES/modules/ipinfo.sh"
test -x "$(which -p diff)" && source "$DOTFILES/modules/diff.sh"
test -x "$(which -p dotnet)" && source "$DOTFILES/modules/dotnet.sh"
test -x "$(which -p ffsend)" && source "$DOTFILES/modules/ffsend.sh"
test -x "$(which -p git)" && source "$DOTFILES/modules/git.sh"
test -x "$(which -p go)" && source "$DOTFILES/modules/go.sh"
test -x "$(which -p ip)" && source "$DOTFILES/modules/ip.sh"
test -x "$(which -p launchctl)" && source "$DOTFILES/modules/launchctl.sh"
test -x "$(which -p nix)" && source "$DOTFILES/modules/nix.sh"
test -x "$(which -p npm)" && source "$DOTFILES/modules/npm.sh"
test -x "$(which -p osascript)" && source "$DOTFILES/modules/osascript.sh"
test -x "$(which -p pip)" && source "$DOTFILES/modules/pip.sh"
test -x "$(which -p rustup)" && source "$DOTFILES/modules/rustup.sh"
test -x "$(which -p tar)" && source "$DOTFILES/modules/tar.sh"
test -x "$(which -p tc)" && source "$DOTFILES/modules/tc.sh"
test -x "$(which -p wget)" && source "$DOTFILES/modules/speed-test.sh"

autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# autoload -U promptinit; promptinit
# autoload -U compinit && compinit
# source $ZSH/oh-my-zsh.sh
# source <(npm completion)
# source <(pm2 completion)
# source <(tns completion)

# zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
# zstyle ':completion:*' insert-tab pending
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
