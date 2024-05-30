#!/bin/sh

RUNNING=$(pgrep nmtui)

if [ "$RUNNING" ]; then
	kill $RUNNING 2 /dev/null &>1
else
	/usr/bin/kitty -e '/usr/bin/nmtui'
fi
