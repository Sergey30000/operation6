#!/bin/bash
cd $(dirname $0)
cd ..
if command -v pg_config &> /dev/null; then
	dbname="Profcom"
	if psql -U postgres -h localhost -p 5432 -lqt | cut -d \| -f 1 | grep -wq "$dbname"; then
		if [ -d "./Server" ]; then
			if command -v npm &> /dev/null; then
				dropdb -U postgres -h localhost -p 5432 -W Profcom
				createdb -U postgres -h localhost -p 5432 -W Profcom
				rm -rf ./Server
				count=$(pgrep -f node | grep -v "grep" | wc -l)
				if [ $count > 0 ]; then
					killall node
				fi
				exit 1
			else
				echo "You need to install npm"
				exit 1
			fi
		else
			echo "There ./Server is no path"
			exit 1
		fi
	else
		echo "This table Profcom does not exist"
		exit 1
	fi
else
	"Install the PostgreSql for backup"
	exit 1
fi
