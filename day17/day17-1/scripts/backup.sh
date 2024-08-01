#!/bin/bash
BACKUP_DIR="/var/backups/mysql"
DATE=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/mysql_backup_${DATE}.sql"
DB_USER="admin"
DB_PASSWORD="admin"
DB_NAME="mydatabase"
mysqldump -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > ${BACKUP_FILE}
find ${BACKUP_DIR} -type f -name '*.sql' -mtime +7 -exec rm {} \;666
echo "Backup completed: ${BACKUP_FILE}"
