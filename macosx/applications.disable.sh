#!/usr/bin/env bash

echo "🌕 csrutil enable --without dtrace"

APPLICATIONS=(
	'Calendar'
	'Chess'
	'Contacts'
	'DVD Player'
	'FaceTime'
	'iBooks'
	'iTunes'
	'Mail'
	'Maps'
	'Messages'
	'Notes'
	'Photo Booth'
	'Photos'
	'QuickTime Player'
	'Reminders'
	'Safari'
	'Siri'
	'Stickies'
	'TextEdit'
)

for APPLICATION in "${APPLICATIONS[@]}"; do
	if test -d "./Applications/${APPLICATION}.app"; then
		if test -d "./Applications/.${APPLICATION}.app"; then
			rm -rf "./Applications/.${APPLICATION}.app"
		fi
		chmod 000 "./Applications/${APPLICATION}.app"
		mv -f "./Applications/${APPLICATION}.app" "./Applications/.${APPLICATION}.app"
		echo "👍 [DISABLED] Application -> '${APPLICATION}'"
	fi
done

CORE_SERVICES=(
	'MRT'
)

for CORE_SERVICE in "${CORE_SERVICES[@]}"; do
	if test -d "./System/Library/CoreServices/${CORE_SERVICE}.app"; then
		if test -d "./System/Library/CoreServices/.${CORE_SERVICE}.app"; then
			rm -rf "./System/Library/CoreServices/.${CORE_SERVICE}.app"
		fi
		chmod 000 "./System/Library/CoreServices/${CORE_SERVICE}.app"
		mv -f "./System/Library/CoreServices/${CORE_SERVICE}.app" "./System/Library/CoreServices/.${CORE_SERVICE}.app"
		echo "👍 [DISABLED] System Library CoreService -> '${CORE_SERVICE}'"
	fi
done
