#!/bin/sh
IFS=""
while read a; do
	if echo "$a" | grep 'EMBED TURBOSYNTHWASM\.JS HERE' >/dev/null; then
		cat ../pmidi/web/turbosynthwasm.js
		echo "embedded = true;"
	else
		echo "$a"
	fi
done < turbosynth.js > turbosynth.offline.js
