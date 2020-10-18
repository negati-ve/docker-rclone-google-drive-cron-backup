#!/bin/bash
set -x
echo "$STORAGECRON /bin/sh /storage-backup-script.sh" > /etc/crontab
echo "$DBCRON /bin/sh /db-backup-script.sh" >> /etc/crontab
crontab /etc/crontab
crond -f