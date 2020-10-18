# Docker container to Backup mysql database and minio storage to Google drive using RCLONE and CRON every 30 mins.
This docker image helps you backup/copy from a minio storage instance to Google drive.

I use it for some personal projects. Not production grade. although, it just works.
---
If you need more details on how to setup the Google drive account for backup 
Please free to create an issue

Thanks,
Zee

# Get started
clone and cd into this repo
1. `docker build . -t rclone-build`
2. `docker-compose up`

Or push it to a docker hub and run it on a server !
