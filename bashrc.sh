#!/usr/bin/env bash

export JAVA_HOME="$(/usr/libexec/java_home)"
export OPENSSL_DIR="/usr/local/opt/openssl@1.1"
export OPENSSL_ROOT_DIR="/usr/local/opt/openssl@1.1"
# export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"

export EDITOR="subl -w"
export VEDITOR="subl -w"
export BUNDLE_EDITOR="subl -w"

# local HOME=/Users/roblav96

# if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
# if [ -e $HOME/.nix-profile/etc/profile.d/nix-daemon.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix-daemon.sh; fi
# export PATH="/opt/pkg/bin:$PATH"
# export PATH="/opt/pkg/sbin:$PATH"

export RMATE_HOST="localhost"
export RMATE_PORT="52699"

# export DEBUG="*,-babel*"
# export NODE_OPTIONS="--max-old-space-size=8192"
export TS_NODE_PRETTY="true"
export YARN_CACHE_FOLDER="$HOME/.yarn"

# export MONO_GAC_PREFIX="/usr/local"
# export PATH="$JAVA_HOME/bin:$PATH"
# export PATH="$JAVA_HOME/jre/bin:$PATH"
# export M2_HOME="/usr/local/Cellar/maven/3.6.0/libexec"
# export M2="$M2_HOME/bin"
# export PATH="$M2:$PATH"

# export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"
# export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
# export PATH="/usr/local/opt/xctool/libexec/bin:$PATH"
# export PATH="/usr/local/lib/node_modules/ffprobe-binaries/bin/darwin/x64:$PATH"

# export CFLAGS="-I/usr/local/opt/icu4c/include"
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"

# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export LDFLAGS="-L/usr/local/opt/icu4c/lib:$LDFLAGS"
# export LDFLAGS="-L/usr/local/opt/sqlite/lib:$LDFLAGS"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include:$CPPFLAGS"
# export CPPFLAGS="-I/usr/local/opt/sqlite/include:$CPPFLAGS"

# export PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig"
# export PKG_CONFIG_LIBDIR="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_LIBDIR"
# export PKG_CONFIG_LIBDIR="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_LIBDIR"
# export PKG_CONFIG_LIBDIR="/usr/local/opt/readline/lib/pkgconfig:$PKG_CONFIG_LIBDIR"
# export PKG_CONFIG_LIBDIR="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_LIBDIR"

# export NODE_PATH="$HOME/.npm/fsevents"
# export PATH="$HOME/.npm-global/bin:$PATH"
# export NPM_CONFIG_PREFIX="$HOME/.npm-global"

# export PATH="/Applications/Alacritty.app/Contents/MacOS:$PATH"
# export PATH="/Applications/Google Chrome.app/Contents/MacOS:$PATH"
# export PATH="/Applications/Firefox Developer Edition.app/Contents/MacOS:$PATH"
# export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
# export PATH="/usr/local/bin:$PATH"
# export PATH="$PATH:/usr/local/bin"

export CLICOLOR="1"
# export LSCOLORS="exfxcxdxbxegedabagacad"
# export LSCOLORS="exfxfeaeBxxehehbadacea"
# export LSCOLORS="ExFxBxDxCxegedabagacad"

# alias rr-k="killall node"
# alias rr-npmi="npm install"
# alias rr-npml="npm list --depth=0"
# alias rr-npmo="npm outdated --depth=0"
# alias rr-npmp="PATH='`pwd`/node_modules/.bin:$PATH'"

alias rr-ng="cd /usr/local/etc/nginx"
alias rr-ngconfig="subl /usr/local/etc/nginx/nginx.conf"
alias rr-nglint="sudo nginx -t"
alias rr-ngrestart="sudo nginx -t && sudo brew services restart nginx"

alias rr-rdbconfig="open /usr/local/etc/redis.conf"
alias rr-rdbrestart="brew services restart redis"

alias rr-server="ssh -A -p 1337 roblav96@192.34.85.234"

alias rr-gr="gradle"
alias rr-grw="./gradlew"
alias rr-htop="sudo htop"
alias rr-find="find . -iname "
alias rr-kodi-logs="tail -F $HOME/Library/Logs/kodi.log"

alias rr-chrome="open -a Google\ Chrome --args"
alias rr-tvn="cd $HOME/Downloads/tvnjviewer-2.8.3-bin-gnugpl && java -jar tightvnc-jviewer.jar"
alias rr-resolv="subl /etc/resolv.conf"
alias rr-trashme="sudo /Applications/TrashMe.app/Contents/MacOS/TrashMe"
alias rr-mpv-config="open $HOME/.config/mpv/mpv.conf"
alias rr-tibak="adb pull /sdcard/SpeedSoftware/Archives/TitaniumBackup.zip $HOME/Downloads/TitaniumBackup.zip"
alias rr-tiauth="adb pull /sdcard/SpeedSoftware/Archives/auth.zip $HOME/Downloads/gAuth.zip"

# alias rr-exercism="cd $HOME/Exercism/go"

alias rr-peers="arp -a"

alias rr-src-edit="subl $DOTFILES"
alias rr-zsh="subl $HOME/.zshrc"
alias rr-tldr="subl $HOME/.tldrrc"
alias rr-source="source $HOME/.bash_profile"

alias rr-dts-gen="cd '$HOME/Sandbox/android-dts-generator/dts-generator' && l && open ' dts-generator.sublime-project' && open build.gradle"
alias rr-adb-tv="adb kill-server && adb connect 192.168.1.2:5555 && adb devices"
alias rr-adb-phone="adb kill-server && adb connect 192.168.1.5:5555 && adb devices"

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

# export PATH="/Applications/Genymotion.app/Contents/MacOS/player.app/Contents/MacOS:$PATH"
# export GM_GOOGLE_PIXEL_3="689122f5-b8d6-435c-87ee-43d7f3e13957"
# alias rr-gm-ls="genyshell -c 'devices list' && echo && VBoxManage list vms"
# alias rr-gm-stop="player -n $GM_GOOGLE_PIXEL_3 -x && adb kill-server"
# alias rr-gm-start="open -a player --args --vm-name $GM_GOOGLE_PIXEL_3"

alias gmls='genyshell -c "devices list"; echo; VBoxManage list vms'
# alias gmdown='osascript -e "quit app player"'
alias gmup2='open -a player --args --vm-name a990e3c6-3d08-4b15-bbf7-206bf949d9c3'
alias gmup3='open -a player --args --vm-name d8d8934a-1727-4127-b9a7-a0bb35866e8d'
alias gmnet='adb shell settings put global http_proxy localhost:4200; adb reverse tcp:4200 tcp:4200'
# gmdown() {
# 	echo "\n👎 Stop Genymotion '$@'"
# 	osascript -e 'quit app "player"'
# 	adb kill-server
# 	# player -x -n $@; adb kill-server
# }
# gmup() {
# 	echo "\n👍 Start Genymotion '$@'"
# 	open -a player --args --vm-name $@
# }

alias rr-macrandom="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"
alias rr-telnet="echo && echo nj3nxCEBUX7BDDei && echo && telnet 192.168.1.1"
alias rr-router="ssh -p 1337 admin@192.168.50.1"
alias rr-phone="ssh -p 1337 192.168.50.168"
alias rr-phonee="ssh -p 1337 192.168.1.170"
alias rr-kodi-adb="cd $HOME/Downloads && rm -rf userdata && git clone git@github.com:roblav96/userdata.git && cd userdata && rm -rf .git .gitignore && sh _scripts/adb.push.sh && echo DONE"

# function rr-emulator() { ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@"; ) }

alias rr-xposed="gradle assembleRelease && (cd build/outputs/apk/release && rr-apksign app-release && adb uninstall com.roblav96.highdpinavbarbuttonsfixed | true && adb install app-release-signed.apk && sleep 5 && adb shell \"su -c 'setprop ctl.restart zygote'\")"

function truecolor() {
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


