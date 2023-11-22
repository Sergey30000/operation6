#!/bin/bash
cd $(dirname $0)
cd ..
if command -v npm &> /dev/null; then
	echo "npm is installed"
else
	sudo apt install npm
fi
if command -v curl &> /dev/null; then
	echo "curl is installed"
else
	sudo apt install curl
fi
if [ -d "./Server" ]; then
	if [ -d "./Server/node_modules" ]; then
		echo "This directory ./Server already exists"
	else
		cd ./Server
		npm install
	fi
else
	echo "There ./Server is no path"
fi
if pg_config &> /dev/null; then
	echo "PostgreSQL is installed"
else
	sudo apt install postgresql
fi
dbname=" Profcom"
if psql -U postgres -h localhost -p 5432 -lqt | cut -d \| -f 1 | grep -wq "$dbname"; then
	echo "This table Profcom already exists"
else
	createdb -U postgres -h localhost -p 5432 -W Profcom
fi
