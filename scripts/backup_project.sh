#!/bin/bash
cd /home/sergey/operation6
mkdir ./backup
pg_dump -U postgres -d Profcom -h localhost -p 5432 -W  > ./backup/db_backup.sql
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="backup_$DATE.tar.gz"
tar -czvf ./backup/$ARCHIVE_NAME /home/sergey/operation6/Server
find ./backup/ -type f -mtime +30 -delete
