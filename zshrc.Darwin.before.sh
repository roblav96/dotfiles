# declare DOTBENCH="$(date +%s%3N)"

# export RMATE_HOST="localhost"
# export RMATE_PORT="52699"

# export PASTEL_COLOR_MODE="8bit"
# export SDKROOT="macosx10.14"
# export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk"
# export MACOSX_DEPLOYMENT_TARGET="10.15"

# export JAVA_HOME="$(/usr/libexec/java_home)"
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identities id_rsa exacare_com_rsa
# zstyle :omz:plugins:ssh-agent lazy yes

# unalias run-help &>/dev/null
# autoload run-help

alias rmxattr="xattr -c -r"
alias unquarantine="xattr -v -r -d com.apple.quarantine"
