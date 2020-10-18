#!/bin/bash
set -x
# performs synchronizations / copy
rclone $RCLONE_OPTS copy minio: gdrive:trade-healium-backup

