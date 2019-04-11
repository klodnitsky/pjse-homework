#!/bin/bash

cd /srv/app

if [[ `git status --porcelain` ]]; then
	echo "New updates availiable"
	echo "Get updates"
	sudo git pull
	echo "Building Angular example app"
	echo "Please w8 up to 5 min..."
	sudo npm run build:prod:en
	echo "Restarting nginx..."
	sudo systemctl restart nginx
else
	echo "Cheked for updates"
	echo "Nothing to do..."
fi
