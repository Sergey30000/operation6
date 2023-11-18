cd ~
if [ -d "./operation6_Moiseenko" ]; then
	cd ./operation6_Moiseenko
	if pg_config &> /dev/null; then
		psql -U postgres -h localhost -p 5432 -d Profcom -W < ./backup/db_backup.sql
		if [ -z "$1" ]; then
			echo "No recovery backup specified."
			exit 1
		fi
		tar -xzvf ./backup/$1 -C /
	else
		echo "You need to install PostgreSql"
	fi
else
	echo "There ./operation6_Moiseenko is no path"
fi
