#!/bin/sh

if [ -n "${PS1}" ]; then
	if [ -z "${BASH}" ]; then
		if [ -x /opt/bin/bash ]; then
			exec /opt/bin/bash
		fi
	fi
fi
