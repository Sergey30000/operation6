#!/bin/bash
cd $(dirname $0)
cd ..
if [ -d "./Server" ]; then
	cd ./Server
	if [ -f ".env" ]; then
		file_path=".env"
		line_number=4
		new_value="DB_PASSWORD=$1"
		sed -i "${line_number}s/.*/${new_value}/" "$file_path"
		echo "Password changed successfully"
		exit 1
	else
		echo "The file .env does not exist"
		exit 1
	fi
else
	echo "There ./Server is no path"
	exit 1
fi
