#!/bin/bash

cd /srv/app

echo Building Angular example app
echo Please w8 up to 5 min...
sudo npm run build:prod:en

echo Restarting nginx...
systemctl restart nginx