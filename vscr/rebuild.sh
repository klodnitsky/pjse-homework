#!/bin/bash

cd /srv/app
sudo git pull 2>&1 | tee /tmp/git.log

answer=`cat /tmp/git.log`

if [ $answer != "Already up to date." ]; then
	echo New updates availiable
	echo Building Angular example app
	echo Please w8 up to 5 min...
	sudo npm run build:prod:en

	echo Restarting nginx...
	sudo systemctl restart nginx
else
	echo Already up to date
	echo Nothing to do...
fi

sudo rm /tmp/git.log
