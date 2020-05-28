#!/bin/bash

echo "🔴 csrutil enable --without dtrace"
echo "🔴 csrutil enable --without fs"

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
	if test -d "./Applications/${APPLICATION}.app"; then
		chmod 000 "./Applications/${APPLICATION}.app"
		mv -f "./Applications/${APPLICATION}.app" "./Applications/.${APPLICATION}.app"
		echo "👍 [DISABLED] Applications -> '${APPLICATION}'"
	fi
	if test -d "./System/Applications/${APPLICATION}.app"; then
		chmod 000 "./System/Applications/${APPLICATION}.app"
		mv -f "./System/Applications/${APPLICATION}.app" "./System/Applications/.${APPLICATION}.app"
		echo "👍 [DISABLED] System Applications -> '${APPLICATION}'"
	fi
done

CORE_SERVICES=(
	'MRT'
)

for CORE_SERVICE in "${CORE_SERVICES[@]}"; do
	if test -d "./System/Library/CoreServices/${CORE_SERVICE}.app"; then
		chmod 000 "./System/Library/CoreServices/${CORE_SERVICE}.app"
		mv -f "./System/Library/CoreServices/${CORE_SERVICE}.app" "./Library/Apple/System/Library/CoreServices/.${CORE_SERVICE}.app"
		echo "👍 [DISABLED] System Library CoreServices -> '${CORE_SERVICE}'"
	fi
	if test -d "./Library/Apple/System/Library/CoreServices/${CORE_SERVICE}.app"; then
		chmod 000 "./Library/Apple/System/Library/CoreServices/${CORE_SERVICE}.app"
		mv -f "./Library/Apple/System/Library/CoreServices/${CORE_SERVICE}.app" "./Library/Apple/System/Library/CoreServices/.${CORE_SERVICE}.app"
		echo "👍 [DISABLED] Library Apple System Library CoreServices -> '${CORE_SERVICE}'"
	fi
done
