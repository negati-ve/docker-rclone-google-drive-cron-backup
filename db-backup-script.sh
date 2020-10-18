#!/bin/bash
set -x
rm -rf ~/db-backup
mkdir ~/db-backup
mysqldump -hsrv-captain--healium-db -uroot --password=$DB_PASSWORD main-healium-io > ~/db-backup/backup1-$(date +%F).sql
mysqldump -hsrv-captain--healium-db -uroot --password=$DB_PASSWORD trade-healium-io > ~/db-backup/backup2-$(date +%F).sql
rclone copy ~/db-backup/backup-$(date +%F).sql instadukan-backup:backup
rclone copy ~/db-backup/backup2-$(date +%F).sql instadukan-backup:backup