#!/bin/bash
if pg_config &> /dev/null; then
	dbname=" Profcom"
	if psql -U postgres -h localhost -p 5432 -lqt | cut -d \| -f 1 | grep -wq "$dbname"; then
		cd ~
		if [ -d "./operation6_Moiseenko/Server" ]; then
			if command -v npm &> /dev/null; then
				dropdb -U postgres -h localhost -p 5432 -W Profcom
				createdb -U postgres -h localhost -p 5432 -W Profcom
				rm -rf ./operation6_Moiseenko/Server
				count=$(pgrep -f node | grep -v "grep" | wc -l)
				if [ $count > 0 ]; then
					killall node
				fi
			else
				echo "You nned to install npm"
			fi
		else
			echo "There ./operation6_Moiseenko/Server is no path"
		fi
	else
		echo "This table Profcom does not exist"
	fi
else
	"Install the PostgreSql for backup"
fi
