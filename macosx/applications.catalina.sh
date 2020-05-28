#!/bin/bash

# echo "🔴 csrutil enable --without debug --without dtrace --without fs"

APPLICATIONS=(
	'Books'
	'Calendar'
	'Chess'
	'Contacts'
	'DVD Player'
	'FaceTime'
	'FindMy'
	'Home'
	'iBooks'
	'iTunes'
	'Mail'
	'Maps'
	'Messages'
	'Music'
	'News'
	'Notes'
	'Photo Booth'
	'Photos'
	'Podcasts'
	'QuickTime Player'
	'Reminders'
	'Safari'
	'Siri'
	'Stickies'
	'Stocks'
	'TV'
	'VoiceMemos'
)
for APPLICATION in "${APPLICATIONS[@]}"; do
	if test -e "./System/Applications/${APPLICATION}.app"; then
		chmod 000 "./System/Applications/${APPLICATION}.app"
		mv -f "./System/Applications/${APPLICATION}.app" "./System/Applications/.${APPLICATION}.app"
		echo "👍 [DISABLED] System Applications -> '${APPLICATION}'"
	fi
	if test -e "./Applications/${APPLICATION}.app"; then
		chmod 000 "./Applications/${APPLICATION}.app"
		mv -f "./Applications/${APPLICATION}.app" "./Applications/.${APPLICATION}.app"
		echo "👍 [DISABLED] Applications -> '${APPLICATION}'"
	fi
done

# CORE_SERVICES=(
# 	'MRT'
# )
# for CORE_SERVICE in "${CORE_SERVICES[@]}"; do
# 	if test -e "./Library/Apple/System/Library/CoreServices/${CORE_SERVICE}.app"; then
# 		chmod 000 "./Library/Apple/System/Library/CoreServices/${CORE_SERVICE}.app"
# 		mv -f "./Library/Apple/System/Library/CoreServices/${CORE_SERVICE}.app" "./Library/Apple/System/Library/CoreServices/.${CORE_SERVICE}.app"
# 		echo "👍 [DISABLED] Library Apple System Library CoreServices -> '${CORE_SERVICE}'"
# 	fi
# 	if test -e "./System/Library/CoreServices/${CORE_SERVICE}.app"; then
# 		chmod 000 "./System/Library/CoreServices/${CORE_SERVICE}.app"
# 		mv -f "./System/Library/CoreServices/${CORE_SERVICE}.app" "./System/Library/CoreServices/.${CORE_SERVICE}.app"
# 		echo "👍 [DISABLED] System Library CoreServices -> '${CORE_SERVICE}'"
# 	fi
# done
