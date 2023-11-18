#!/bin/bash
cd ~
if [ -d "./operation6_Moiseenko/Server" ]; then
	cd ./operation6_Moiseenko/Server
	if [ -f "index.js" ]; then
		count=$(pgrep -f node | grep -v "grep" | wc -l)
		if [ $count > 0 ]; then
			killall node
		fi
		node index.js & disown %1
	else
		echo "The file index.js does not exist"
	fi
else
	echo "There ./operation6_Moiseenko/Server is no path"
fi
