
# local HOME=/Users/roblav96

# if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
# if [ -e $HOME/.nix-profile/etc/profile.d/nix-daemon.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix-daemon.sh; fi
# export PATH="/opt/pkg/bin:$PATH"
# export PATH="/opt/pkg/sbin:$PATH"

export RMATE_HOST="localhost"
export RMATE_PORT="52699"

# export DEBUG="*,-babel*"
# export NODE_OPTIONS="--max-old-space-size=8192 --require=`npm root -g`/node-env-dev"
export NODE_OPTIONS="--max-old-space-size=8192"
export TS_NODE_PRETTY="true"
# export HOMEBREW_DEV_CMD_RUN="0"

export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$JAVA_HOME/bin:$PATH"
# export PATH="$JAVA_HOME/jre/bin:$PATH"
export M2_HOME="/usr/local/Cellar/maven/3.6.0/libexec"
export M2="$M2_HOME/bin"
export PATH="$M2:$PATH"
# export ADB_LIBUSB="1"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_SDK="$ANDROID_SDK_ROOT"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export ANDROID_NDK_HOME="$ANDROID_SDK_ROOT/ndk-bundle"
export PATH="$ANDROID_SDK_ROOT/ndk-bundle:$PATH"
export PATH="$ANDROID_SDK_ROOT/tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/tools/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/build-tools/28.0.3:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export PATH="/usr/local/opt/python@2/bin:$PATH"
# export PYTHONPATH="/usr/local/lib/python2.7:/usr/local/lib/python2.7/site-packages"
# export ANDROID_VIEW_CLIENT_HOME="$HOME/Downloads/AndroidViewClient-15.5.1"
# export PYTHONPATH="$HOME/Downloads/AndroidViewClient-15.5.1"
# export PYTHONHOME="$HOME/Downloads/AndroidViewClient-15.5.1"

export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/gcc/bin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/iftop/sbin:$PATH"
export PATH="/usr/local/opt/libpcap/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openvpn/sbin:$PATH"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/tcpdump/sbin:$PATH"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export PKG_CONFIG_PATH="/usr/local/opt"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"

# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"
# export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

export PATH="/usr/local/opt/node@10/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/node@10/lib"
# export CPPFLAGS="-I/usr/local/opt/node@10/include"

# export NODE_PATH="$HOME/.npm/fsevents"
# export PATH="$HOME/.npm-global/bin:$PATH"
# export NPM_CONFIG_PREFIX="$HOME/.npm-global"

export PATH="/usr/local/opt/go/bin:$PATH"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export PATH="/usr/local/opt/glide/bin:$PATH"
export GLIDE_HOME="/usr/local/opt/glide"

export PATH="/Applications/Alacritty.app/Contents/MacOS:$PATH"
export PATH="/Applications/Google Chrome.app/Contents/MacOS:$PATH"
export PATH="/Applications/Firefox Developer Edition.app/Contents/MacOS:$PATH"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
# export PATH="/usr/local/bin:$PATH"
# export PATH="$PATH:/usr/local/bin"

export EDITOR="subl -w"
export BUNDLE_EDITOR="subl"

export CLICOLOR="true"
export LSCOLORS="exfxcxdxbxegedabagacad"
# export LSCOLORS="exfxfeaeBxxehehbadacea"
# export LSCOLORS="ExFxBxDxCxegedabagacad"

alias rr="npm run"
alias rr-k="killall node"
alias rr-npmi="npm install"
alias rr-npml="npm list --depth=0"
alias rr-npmo="npm outdated --depth=0"
alias rr-npmp="PATH='`pwd`/node_modules/.bin:$PATH'"

alias rr-ng="cd /usr/local/etc/nginx"
alias rr-ngconfig="sublime /usr/local/etc/nginx/nginx.conf"
alias rr-nglint="sudo nginx -t"
alias rr-ngrestart="sudo nginx -t && sudo brew services restart nginx"

alias rr-rdbconfig="open /usr/local/etc/redis.conf"
alias rr-rdbrestart="brew services restart redis"

alias rr-server="ssh roblav96@192.34.85.234 -p 1337 -o 'ServerAliveInterval 60'"

alias rr-gr="gradle"
alias rr-grw="./gradlew"
alias rr-htop="sudo htop"
alias rr-find="find . -iname "
alias rr-clear="clear && printf '\e[3J'"
alias rr-dstore="find . -name *.DS_Store* -type f -delete"
alias rr-kodi-logs="tail -F $HOME/Library/Logs/kodi.log"

alias rr-chrome="open -a Google\ Chrome --args"
alias rr-st3="open $HOME/Library/Application\ Support/Sublime\ Text\ 3/st3-sync.sublime-project"
alias rr-st3-packages="cd $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages"
alias rr-tvn="cd $HOME/Downloads/tvnjviewer-2.8.3-bin-gnugpl && java -jar tightvnc-jviewer.jar"
alias rr-hosts="sublime /etc/hosts"
alias rr-resolv="sublime /etc/resolv.conf"
alias rr-trash="sudo /Applications/TrashMe.app/Contents/MacOS/TrashMe"
alias rr-mpv-config="open $HOME/.config/mpv/mpv.conf"
alias rr-tibak="adb pull /sdcard/SpeedSoftware/Archives/TitaniumBackup.zip $HOME/Downloads/TitaniumBackup.zip"
alias rr-tiauth="adb pull /sdcard/SpeedSoftware/Archives/auth.zip $HOME/Downloads/gAuth.zip"

# alias rr-exercism="cd $HOME/Exercism/go"
alias rr-quarantine="sudo xattr -rd com.apple.quarantine"

alias rr-peers="arp -a"

alias rr-src-edit="st $DOTFILES"
alias rr-zsh="sublime $HOME/.zshrc"
alias rr-tldr="sublime $HOME/.tldrrc"
alias rr-source="source $HOME/.bash_profile"

alias rr-dts-gen="cd '$HOME/Sandbox/android-dts-generator/dts-generator' && l && open ' dts-generator.sublime-project' && open build.gradle"
alias rr-adb-tv="adb kill-server && adb connect 192.168.1.2:5555 && adb devices"
alias rr-adb-phone="adb kill-server && adb connect 192.168.1.5:5555 && adb devices"

alias rr-razer-start="open -a RzDeviceEngine && open -a RzUpdater"
alias rr-razer-stop="killit RzDeviceEngine && killit RzUpdater"

# alias tl="tldr"
# alias dk="docker"
# alias dkcompose="docker-compose"
# alias dkmachine="docker-machine"
# alias dkprune="docker ps -q | xargs docker stop ; docker system prune -a"
# alias dkinit="docker-machine env default && eval $(docker-machine env default) && docker-machine status && docker-machine ls && docker ps"

# alias rr-kava-ssh="ssh ubuntu@ec2-18-222-45-231.us-east-2.compute.amazonaws.com"
alias rr-kava-ssh="ssh ubuntu@ec2-3-85-49-42.compute-1.amazonaws.com"
alias rr-kava-ssh-test="ssh ubuntu@ec2-3-89-90-145.compute-1.amazonaws.com"
alias rr-kava-ssh-lnd="ssh ubuntu@ec2-34-229-219-58.compute-1.amazonaws.com"
alias rr-kava-ssh-btcd="ssh ubuntu@ec2-18-208-223-50.compute-1.amazonaws.com"
alias rr-kava-ssh-bitcoind="ssh ubuntu@ec2-34-239-110-118.compute-1.amazonaws.com"
alias rr-kava-ssh-lnd-test="ssh ubuntu@ec2-54-165-221-164.compute-1.amazonaws.com"

export PATH="/Applications/Genymotion.app/Contents/MacOS/player.app/Contents/MacOS:$PATH"
export GM_TABLET_ID="31f16f8b-6895-447e-864b-0ced4b45197c"
export GM_TABLET_NAME="Custom Tablet - 8.0 - API 26 - 1536x2048"
alias rr-gm-ls="genyshell -c 'devices list' && echo && VBoxManage list vms"
alias rr-gm-stop="player -n $GM_TABLET_ID -x && adb kill-server"
alias rr-gm-start="open -a player --args --vm-name $GM_TABLET_ID"

alias rr-telnet="echo && echo nj3nxCEBUX7BDDei && echo && telnet 192.168.1.1"
alias rr-router="ssh -p 1337 admin@192.168.50.1"
alias rr-phone="ssh -p 1337 192.168.50.168"
alias rr-phonee="ssh -p 1337 192.168.1.170"
alias rr-kodi-adb="cd $HOME/Downloads && rm -rf userdata && git clone git@github.com:roblav96/userdata.git && cd userdata && rm -rf .git .gitignore && sh _scripts/adb.push.sh && echo DONE"
alias rr-adb-shell="echo && echo 'export PATH=/data/local/tmp/busybox:\$PATH && cd sdcard' && echo && adb shell"
alias rr-adb-text="adb shell input keyboard text"

alias rr-macrandom="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"

function rr-apksign() {
	rm -f $1-signed.apk
	rm -f $1-unsigned-aligned.apk
	zipalign -v -p 4 $1-unsigned.apk $1-unsigned-aligned.apk
	apksigner sign --ks $HOME/.android/release-key.jks --out $1-signed.apk $1-unsigned-aligned.apk
	apksigner verify $1-signed.apk
}

function rr-exoplayer() { adb shell am start -a com.google.android.exoplayer.demo.action.VIEW -d $1 }
function rr-kodi() { adb shell am start -a android.intent.action.VIEW -d $1 -t video/mkv }

function rr-go-get() { go get -u $1 }

# function rr-adb-wget() { adb shell export PATH=/data/data/ru.meefik.busybox/files/bin:$PATH }

function rr-emulator { ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@"; ) }

function rr-adb-wget() {
	adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
	adb shell input keyboard text "'wget -O /dev/null $1'"
	adb shell input keyevent KEYCODE_ENTER
	sleep 15
	adb shell am force-stop com.termux
	# sleep 1
	# adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1
	# adb shell input keyboard text "'rm ./*'"
	# adb shell input keyevent KEYCODE_ENTER
	# adb shell am force-stop com.termux
}

alias rr-xposed="gradle assembleRelease && (cd build/outputs/apk/release && rr-apksign app-release && adb uninstall com.roblav96.highdpinavbarbuttonsfixed | true && adb install app-release-signed.apk && sleep 5 && adb shell \"su -c 'setprop ctl.restart zygote'\")"

function truecolor {
	awk 'BEGIN{
	    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
	    for (colnum = 0; colnum<77; colnum++) {
	        r = 255-(colnum*255/76);
	        g = (colnum*510/76);
	        b = (colnum*255/76);
	        if (g>255) g = 510-g;
	        printf "\033[48;2;%d;%d;%dm", r,g,b;
	        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
	        printf "%s\033[0m", substr(s,colnum+1,1);
	    }
	    printf "\n";
	}'
}

# 	echo 'function rr-adb-wget'
# 	#!/usr/bin/expect --
# 	spawn adb shell
# 	expect "$" {
# 		sleep 0.1
# 		send "export PATH=/data/local/tmp/busybox/:\$PATH\n"
# 	}
# 	interact
# 	# export PATH=/data/local/tmp/busybox:$PATH
# 	# adb shell "export PATH=/data/data/ru.meefik.busybox/files/bin:\$PATH && echo `pwd`"
# }


