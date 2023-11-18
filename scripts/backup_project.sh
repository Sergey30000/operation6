#!/bin/bash
cd ~
if [ -d "./operation6_Moiseenko" ]; then
	cd ./operation6_Moiseenko
	if [ -d "./backup" ]; then
		echo "This directory backup already exists"
	else
		mkdir ./backup
	fi
	if pg_config &> /dev/null; then
		pg_dump -U postgres -d Profcom -h localhost -p 5432 -W  > ./backup/db_backup.sql
		DATE=$(date +%Y-%m-%d_%H-%M-%S)
		ARCHIVE_NAME="backup_$DATE.tar.gz"
		tar -czvf ./backup/$ARCHIVE_NAME /home/$USER/operation6_Moiseenko/Server
		find ./backup/ -type f -mtime +30 -delete
	else
		"Install the PostgreSql for backup"
	fi
	
else
	echo "There ./operation6_Moiseenko is no path"
fi
