#!/usr/bin/env bash
# Backup LXC containers.  Recreate them with:
#     lxc image import TARBALL --alias my-export
#     lxc init my-export NEW-CONTAINER
set -ex

BACKUP_DIR=/mnt/pescennius/backups/lxc
HOSTS=($(lxc list -c n --format csv))

for HOST in "${HOSTS[@]}"
do
    BACKUP_NAME=${HOST}-$(date +"%Y-%m-%d")

    lxc snapshot ${HOST} auto-backup
    lxc publish ${HOST}/auto-backup --alias ${BACKUP_NAME}
    lxc image export ${BACKUP_NAME} ${BACKUP_DIR}/${BACKUP_NAME}.tar.gz
    lxc image delete ${BACKUP_NAME}
    lxc delete ${HOST}/auto-backup
done
