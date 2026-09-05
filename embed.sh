#!/bin/sh
IFS=""
while read a; do
	if echo "$a" | grep 'EMBED TURBOSYNTHWASM\.JS HERE' >/dev/null; then
		cat ../pmidi/web/turbosynthwasm.js
		echo "embedded = true;"
	elif echo "$a" | grep 'EMBED JSZIP\.MIN\.JS HERE' >/dev/null; then
		curl -L https://cdn.jsdelivr.net/npm/jszip@3.10.1/dist/jszip.min.js
	elif echo "$a" | grep 'EMBED AUDIOPLAYER\.JS HERE' >/dev/null; then
		cat ../pmidi/web/audioplayer.js
	elif echo "$a" | grep 'EMBED FLORESTAN.ZIP HERE' >/dev/null; then
		echo "florestanZip = \"data:application/zip;base64,`base64 -w0 ../pmidi/web/florestan.zip`\""
	else
		echo "$a"
	fi
done < turbosynth.js > turbosynth.offline.js
