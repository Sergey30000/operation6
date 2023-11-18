//1.1 Create project on Linux Ubuntu
cd /home/$USER
mkdir operation6_Moiseenko
cd ./operation6_Moiseenko
sudo apt install git
git clone https://github.com/Sergey30000/operation6.git
cd scripts

//1.2 init project
#!/bin/bash
sudo apt install npm
cd ~
cd ./operation6_Moiseenko/Server
sudo apt install curl
npm install
sudo apt install postgresql
createdb -U postgres -h localhost -p 5432 -W Profcom

//1.3 Start server
#!/bin/bash
cd /home/sergey/operation6/Server
node index.js & disown %1

//2 Adding data
#!/bin/bash
url1="http://localhost:3001/api/feedback/req";
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Andrey","commentatorSurname":"Andreev","comment":"comment 1","estimation":5}' $url1;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Timur","commentatorSurname":"Timurov","comment":"comment 2","estimation":5}' $url1;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Vasiliy","commentatorSurname":"Vasiliev","comment":"comment 3","estimation":5}' $url1;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Oleg","commentatorSurname":"Olegov","comment":"comment 4","estimation":5}' $url1;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Egor","commentatorSurname":"Egorov","comment":"comment 5","estimation":5}' $url1;

url2="http://localhost:3001/api/guestRequest/volunteer/req";
curl -X POST -H "Content-Type: application/json" -d '{"surname":"Andreev","name":"Andrey","patronymic":"Andreevich","phone":"+78007006052","commentGuest":"commentGuest 1"}' $url2;
curl -X POST -H "Content-Type: application/json" -d '{"surname":"Timurov","name":"Timur","patronymic":"Timurovich","phone":"+78007006053","commentGuest":"commentGuest 2"}' $url2;
curl -X POST -H "Content-Type: application/json" -d '{"surname":"Vasiliev","name":"Vasiliy","patronymic":"Vasilievich","phone":"+78007006054","commentGuest":"commentGuest 3"}' $url2;
curl -X POST -H "Content-Type: application/json" -d '{"surname":"Olegov","name":"Oleg","patronymic":"Olegovich","phone":"+78007006055","commentGuest":"commentGuest 4"}' $url2;
curl -X POST -H "Content-Type: application/json" -d '{"surname":"Egorov","name":"Egor","patronymic":"Egorovich","phone":"+78007006056","commentGuest":"commentGuest 5"}' $url2;

url3="http://localhost:3001/api/commentingApplication/";
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":1}' $url3;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":2}' $url3;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":3}' $url3;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":4}' $url3;
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":5}' $url3;

//2 Reading data
#!/bin/bash
url1="http://localhost:3001/api/user/admin/req";
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url1;

url2="http://localhost:3001/api/credential/";
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url2;

url3="http://localhost:3001/api/feedback/";
curl -X GET -H "Content-Type: application/json" $url3;

url4="http://localhost:3001/api/guestRequest/admin/statusStatistics";
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url4;

url5="http://localhost:3001/api/commentingApplication/";
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url5;

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
