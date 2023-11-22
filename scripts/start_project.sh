#!/bin/bash
cd $(dirname $0)
cd ..
if [ -d "./Server" ]; then
	cd ./Server
	if [ -f "index.js" ]; then
		count=$(pgrep -f node | grep -v "grep" | wc -l)
		if [ $count > 0 ]; then
			killall node
		fi
		node index.js & disown %1
		exit 1
	else
		echo "The file index.js does not exist"
		exit 1
	fi
else
	echo "There ./Server is no path"
	exit 1
fi
