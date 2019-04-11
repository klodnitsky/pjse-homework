#!/bin/bash

cd /srv/app

answer="Your branch is up to date with 'origin/master'."

if [[ `git status | grep "is up to date"` == $answer ]]; then
	echo "Cheked for updates"
	echo "Nothing to do..."
else
	echo "New updates availiable"
	echo "Get updates"
	sudo git pull
	echo "Building Angular example app"
	echo "Please w8 up to 5 min..."
	sudo npm run build:prod:en
	echo "Restarting nginx..."
	sudo systemctl restart nginx
fi
