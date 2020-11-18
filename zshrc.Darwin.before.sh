# declare DOTBENCH="$(date +%s%3N)"

# export RMATE_HOST="localhost"
# export RMATE_PORT="52699"

# export PASTEL_COLOR_MODE="8bit"
# export SDKROOT="macosx10.14"
# export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"

# export JAVA_HOME="$(/usr/libexec/java_home)"
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

if [[ -d "/usr/local/opt/openssl" ]]; then
# 	export OPENSSL="/usr/local/opt/openssl"
# 	export OPENSSL_DIR="/usr/local/opt/openssl"
# 	export OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"
# 	export OPENSSL_LIB_DIR="/usr/local/opt/openssl/lib"
	export OPENSSL_ROOT_DIR="/usr/local/opt/openssl"
# 	export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl"
fi

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa
# zstyle :omz:plugins:ssh-agent identities id_rsa tunnel_rsa

# unalias run-help &>/dev/null
# autoload run-help
