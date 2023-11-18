#!/bin/bash
cd ~
if [ -d "./operation6_Moiseenko/Server" ]; then
	cd ./operation6_Moiseenko/Server
	if [ -f ".env" ]; then
		file_path=".env"
		line_number=4
		new_value="DB_PASSWORD=$1"
		sed -i "${line_number}s/.*/${new_value}/" "$file_path"
		echo "Password changed successfully"
	else
		echo "The file .env does not exist"
	fi
else
	echo "There ./operation6_Moiseenko/Server is no path"
fi
