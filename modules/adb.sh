function adb-pm-ls() {
	echo '\n🌕 Default Packages 🌕'
	echo "$(adb shell pm list packages -f)" | bat -p -l strace | bat -p -l ini
	echo '\n🌕 Disabled Packages 🌕'
	echo "$(adb shell pm list packages -f -d)" | bat -p -l strace | bat -p -l ini
	echo '\n🌕 Enabled Packages 🌕'
	echo "$(adb shell pm list packages -f -e)" | bat -p -l strace | bat -p -l ini
	echo '\n🌕 System Packages 🌕'
	echo "$(adb shell pm list packages -f -s)" | bat -p -l strace | bat -p -l ini
	echo '\n🌕 Third-Party Packages 🌕'
	echo "$(adb shell pm list packages -f -3)" | bat -p -l strace | bat -p -l ini
}

function adb-pm-f() {
	echo '\n🌕 Default Packages 🌕'
	echo "$(adb shell pm list packages -f)" | rg -uuu --passthru --smart-case --fixed-strings --color=always $@
	echo '\n🌕 Disabled Packages 🌕'
	echo "$(adb shell pm list packages -f -d)" | rg -uuu --passthru --smart-case --fixed-strings --color=always $@
	echo '\n🌕 Enabled Packages 🌕'
	echo "$(adb shell pm list packages -f -e)" | rg -uuu --passthru --smart-case --fixed-strings --color=always $@
	echo '\n🌕 System Packages 🌕'
	echo "$(adb shell pm list packages -f -s)" | rg -uuu --passthru --smart-case --fixed-strings --color=always $@
	echo '\n🌕 Third-Party Packages 🌕'
	echo "$(adb shell pm list packages -f -3)" | rg -uuu --passthru --smart-case --fixed-strings --color=always $@
}
