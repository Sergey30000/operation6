//1 Create project
cd /home/sergey
mkdir operation6
cd /home/sergey/operation6
git clone https://github.com/Sergey30000/operation6.git
//token for github password - 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

//1 Start server
cd /home/sergey/operation6/Server
node index.js & disown %1

//3 Copy server and db
cd /home/sergey/operation6
mkdir ./backup
pg_dump -U postgres -d Profcom -h localhost -p 5432 -W  > ./backup/db_backup.sql
cp -r /home/sergey/operation6/Server ./backup/Server_backup

//4 Delete server and db
dropdb -U postgres -h localhost -p 5432 -W Profcom
createdb -U postgres -h localhost -p 5432 -W Profcom
rm -rf /home/sergey/operation6/Server
killall node

//5 Recovery
psql -U postgres -h localhost -p 5432 -d Profcom -W < ./backup/db_backup.sql
cd /home/sergey/operation6
cp -r ./backup/Server_backup/ /home/sergey/operation6/Server

//6 Repeat start server
cd /home/sergey/operation6/Server
node index.js & disown %1

//6 Check
cd /home/sergey/operation6
git status
psql -U postgres -h localhost -p 5432 -d Profcom -W
\dt
\q
