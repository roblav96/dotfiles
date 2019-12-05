#!/usr/bin/env bash

# Android Package Manager
# https://developer.android.com/studio/command-line/adb#pm

function adb-pm-ls() {
	echo; echo 🌕 Disabled 🌕
	echo "$(adb shell pm list packages -f -d)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Uninstalled 🌕
	echo "$(adb shell pm list packages -f -u)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Enabled 🌕
	echo "$(adb shell pm list packages -f -e)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Default 🌕
	echo "$(adb shell pm list packages -f)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 System 🌕
	echo "$(adb shell pm list packages -f -s)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
	echo; echo 🌕 Third-Party 🌕
	echo "$(adb shell pm list packages -f -3)" | sort --ignore-case | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
}

# function adb-pm-ls() {
# 	echo "$(adb shell '
# 		echo; echo 🌕 Disabled 🌕; pm list packages -f -d;
# 		echo; echo 🌕 Uninstalled 🌕; pm list packages -f -u;
# 		echo; echo 🌕 Default 🌕; pm list packages -f;
# 		echo; echo 🌕 System 🌕; pm list packages -f -s;
# 		echo; echo 🌕 Enabled 🌕; pm list packages -f -e;
# 		echo; echo 🌕 Third-Party 🌕; pm list packages -f -3;
# 	')" | sed --unbuffered --regexp-extended 's/^package://' | bat -p -l properties
# }
# alias adb-pm-f="adb-pm-ls | grep"
# alias adb-pm-f="adb-pm-ls | rg --smart-case --fixed-strings --color=always --passthru"
