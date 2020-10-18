#!/bin/bash
set -x
rm -rf ~/db-backup
mkdir ~/db-backup
mysqldump -h127.0.0.1 -uroot -ptoor IDS3 > ~/db-backup/IDS3-$(date +%F).sql
mysqldump -h127.0.0.1 -uroot -ptoor IDS3-test-1 > ~/db-backup/IDS3-test-1-$(date +%F).sql
rclone copy ~/db-backup/IDS3-$(date +%F).sql instadukan-backup:test
rclone copy ~/db-backup/IDS3-test-1-$(date +%F).sql instadukan-backup:test