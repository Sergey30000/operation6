#!/bin/bash
cd $(dirname $0)
cd ..
cd_dir=$(pwd -P)/Server
if [ -d "./backup" ]; then
	echo "This directory backup already exists"
else
	mkdir ./backup
fi
if command -v pg_config &> /dev/null; then
	if [ -d "./Server" ]; then
		pg_dump -U postgres -d Profcom -h localhost -p 5432 -W  > ./backup/db_backup.sql
		DATE=$(date +%Y-%m-%d_%H-%M-%S)
		ARCHIVE_NAME="backup_$DATE.tar.gz"
		echo $cd_dir
		tar -czvf ./backup/$ARCHIVE_NAME $cd_dir
		find ./backup/ -type f -mtime +30 -delete
		exit 1
	else
		echo "There ./Server is no path"
		exit 1
	fi
else
	"Install the PostgreSql for backup"
	exit 1
fi
