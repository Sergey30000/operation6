cd /home/sergey/operation6/
psql -U postgres -h localhost -p 5432 -d Profcom -W < ./backup/db_backup.sql
if [ -z "$1"]; then
	echo "No recovery backup specified."
	exit 1
fi
tar -xzvf /home/sergey/operation6/backup/$1 -C /
