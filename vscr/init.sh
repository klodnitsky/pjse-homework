#!/bin/bash

echo Installing development tools...
sudo apt-get -y install gcc g++ make

echo Installin nginx...
sudo apt-get -y install nginx

echo Configure nginx default...
cat /vagrant/vscr/default > /etc/nginx/sites-available/default

echo Configure nginx logrotate...
cat /vagrant/vscr/nginx > /etc/logrotate.d/nginx

echo Installing nodejs...
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get -y install nodejs

echo Allow nginx in firewall...
sudo ufw allow 'Nginx HTTP'
systemctl restart ufw

echo Cloning Angular example app...
cd /srv
sudo git clone https://github.com/Ismaestro/angular7-example-app.git
sudo mv angular7-example-app app
cd app

echo Installing Angular example app
echo Please w8 up to 5 min...
sudo npm i

echo Check and write cronjobs to mycron file
sudo crontab -l > mycron

echo Adding rebuild.sh to cronjobs
sudo echo "0 * * * * sh /vagrant/vscr/rebuild.sh" >> mycron

echo Installing new cron file
sudo crontab mycron

echo Remove mycron tmp file
sudo rm mycron
