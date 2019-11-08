#!/bin/bash

APPS=(
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

for APP in "${APPS[@]}"; do
	if test -d "./Applications/${APP}.app"; then
		if test -d "./Applications/.${APP}.app"; then
			rm -rf "./Applications/.${APP}.app"
		fi
		chmod 000 "./Applications/${APP}.app"
		mv -f "./Applications/${APP}.app" "./Applications/.${APP}.app"
		echo
		echo "disabled Application -> ${APP}"
	fi
done

CORES=(
	'MRT'
)

for CORE in "${CORES[@]}"; do
	if test -d "./System/Library/CoreServices/${CORE}.app"; then
		if test -d "./System/Library/CoreServices/.${CORE}.app"; then
			rm -rf "./System/Library/CoreServices/.${CORE}.app"
		fi
		chmod 000 "./System/Library/CoreServices/${CORE}.app"
		mv -f "./System/Library/CoreServices/${CORE}.app" "./System/Library/CoreServices/.${CORE}.app"
		echo
		echo "disabled CoreService -> ${CORE}"
	fi
done
