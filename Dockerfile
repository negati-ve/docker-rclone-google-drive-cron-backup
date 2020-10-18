FROM rclone/rclone
USER root
ENV STORAGECRON="*/30 * * * *"
ENV DBCRON="0 */6 * * *"
RUN apk -U add ca-certificates fuse wget tzdata bash curl mariadb-client\
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY storage-backup-script.sh /storage-backup-script.sh
RUN chmod +x /storage-backup-script.sh

COPY db-backup-script.sh /db-backup-script.sh
RUN chmod +x /db-backup-script.sh

COPY ./config /config/rclone/
ENTRYPOINT ["/entrypoint.sh"]