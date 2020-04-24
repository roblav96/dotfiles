export EDITOR="subl"
export VEDITOR="subl"
export VISUAL="subl"
export BUNDLE_EDITOR="subl"

# export RMATE_HOST="localhost"
# export RMATE_PORT="52699"

export PASTEL_COLOR_MODE="8bit"
export SDKROOT="macosx10.14"
# export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"

export JAVA_HOME="$(/usr/libexec/java_home)"

if [[ -d "/usr/local/opt/openssl" ]]; then
	export OPENSSL_DIR="/usr/local/opt/openssl"
	export OPENSSL_ROOT_DIR="/usr/local/opt/openssl"
fi

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa
# zstyle :omz:plugins:ssh-agent identities id_rsa tunnel_rsa
