cd $(dirname $0)
cd ..
if pg_config &> /dev/null; then
	psql -U postgres -h localhost -p 5432 -d Profcom -W < ./backup/db_backup.sql
	if [ -z "$1" ]; then
		echo "No recovery backup specified."
		exit 1
	fi
	tar -xzvf ./backup/$1 -C /
	exit 1
else
	echo "You need to install PostgreSql"
	exit 1
fi
