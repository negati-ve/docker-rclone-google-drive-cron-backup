# Here's how you can get free backup service for your database and sto

Running on a single machine and want to backup your database and file storage for free?

Here's how you can do it for free!

what you need

- Google Drive

Goto [https://console.cloud.google.com/](https://console.cloud.google.com/?pli=1)

create a new project 

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled.png)

Once your new projected is ready, 

view your project page

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%201.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%201.png)

Now from your navigation, visit APIs & Service → library

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%202.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%202.png)

We're looking for the drive api, so type in "Drive" in the search bar

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%203.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%203.png)

Click on Google Drive API and enable it for your newly created application

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%204.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%204.png)

Once enabled,

go to credentials and click on "Manage service accounts"

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%205.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Untitled%205.png)

Enter the service account details and click on "CREATE"

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.35.27_AM.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.35.27_AM.png)

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.35.41_AM.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.35.41_AM.png)

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.36.17_AM.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.36.17_AM.png)

Once the Service Account is ready, click on Create Key to generate a key that will be used to access your GDrive

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.36.36_AM.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.36.36_AM.png)

Download and keep this service account JSON key safe. 

![Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.36.44_AM.png](Here's%20how%20you%20can%20get%20free%20backup%20service%20for%20you%209f9d38f550214443b655476242133618/Screenshot_2020-10-18_at_11.36.44_AM.png)

We will now use this key to access Gdrive using RCLONE

# INSTALL RCLONE

[https://rclone.org/downloads/](https://rclone.org/downloads/)

# ACCESS GDRIVE USING RCLONE

once you have RCLONE installed and ready to use, 

time to use the gdrive service account json to access google drive

Note that this google drive account is only accessible through commandline and you will not be able to access it like regular google drive through your browser.

In your terminal/cli run the following command to find where your rclone config file resides

```jsx
rclone config file
```

this should output the path to your config file

Now edit the config file and add the following content

```jsx
[instadukan-main-backup]
type = drive
scope = drive
service_account_file = path-to-service-account-json-private-key/Users/zed/.service-accounts/wide-approach-test.json
auth_owner_only = false
```

I prefer to keep my service accounts under ~/.service-accounts

# MKDIR in your Google Drive

just to make sure that everything works, let's make a directory in our new google drive

run the following command to make a new directory

```jsx
rclone mkdir instadukan-main-backup:test
```

and the following command to list directories in your google drive 

```jsx
rclone lsd instadukan-main-backup:
```

 If you see test folder has been created, then everything is going well so far

Now that Rclone and Google drive is ready, 

# DOCKER

you can use this docker backup image to quickly setup a rclone and google drive based backup strategy

[https://github.com/negati-ve/docker-rclone-google-drive-cron-backup](https://github.com/negati-ve/docker-rclone-google-drive-cron-backup)

# CONFIG

place your rclone config file under /config/rclone.conf

place your service account file in the config folder too and update it's location in your rclone config file

Place your database dump and backup script as [db-backup-script.sh](http://db-backup-script.sh/)

Place your storage backup script as [storage-backup-script.sh](http://storage-backup-script.sh/)

Build your docker image and deploy it!

```jsx
docker build . -t rclone-backup 
```

This docker image will run the db-[backup-script.sh storage-backup-script.sh](http://storage-backup-script.sh/) every 30 mins

# Running without Docker

The above setup can be run without docker as well by simply setting STORAGECRON and DBCRON environment variables and running entrypoint script