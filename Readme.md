//1 Create project
cd /home/sergey
mkdir operation6
cd /home/sergey/operation6
git clone https://github.com/Sergey30000/operation6.git
//token for github password - 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

//1 Start server
#!/bin/bash
cd /home/sergey/operation6/Server
node index.js & disown %1

//2 Adding data


//3 Backup server and db
#!/bin/bash
cd /home/sergey/operation6
mkdir ./backup
pg_dump -U postgres -d Profcom -h localhost -p 5432 -W  > ./backup/db_backup.sql
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="backup_$DATE.tar.gz"
tar -czvf ./backup/$ARCHIVE_NAME /home/sergey/operation6/Server
find ./backup/ -type f -mtime +30 -delete

//4 Delete server and db
#!/bin/bash
dropdb -U postgres -h localhost -p 5432 -W Profcom
createdb -U postgres -h localhost -p 5432 -W Profcom
rm -rf /home/sergey/operation6/Server
killall node

//5 Recovery
cd /home/sergey/operation6/
psql -U postgres -h localhost -p 5432 -d Profcom -W < ./backup/db_backup.sql
if [ -z "$1"]; then
	echo "No recovery backup specified."
	exit 1
fi
tar -xzvf /home/sergey/operation6/backup/$1 -C /

//6 Repeat start server
#!/bin/bash
cd /home/sergey/operation6/Server
node index.js & disown %1

//6 Check
#!/bin/bash
cd /home/sergey/operation6
git status
psql -U postgres -h localhost -p 5432 -d Profcom -W <<EOF
\dt
\q
EOF
