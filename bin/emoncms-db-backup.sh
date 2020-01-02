#!/usr/bin/env bash
# Backup the emoncms DB
# Restore with:
#   cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE
set -e

BACKUP_DIR=/mnt/pescennius/backups/emoncms
CONTAINER=$(docker ps | grep emoncms.*db | awk '{print $1}')
FILE_SUFFIX=".sql"
FILE_NAME=${CONTAINER}-$(date +"%Y-%m-%d")${FILE_SUFFIX}
docker exec e7017f1a4ccf /usr/bin/mysqldump -u emoncms --password=YOUR_SECURE_PASSWORD emoncms > ${BACKUP_DIR}/${FILE_NAME}

date

find ${BACKUP_DIR} -type f -mtime +0 -name '*.${FILE_SUFFIX}' -delete
