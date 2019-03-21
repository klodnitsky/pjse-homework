#
# => Andrew Klodnitsky
#

Vagrant.configure("2") do |config|

  # Vagrant box
  config.vm.box = "ubuntu/bionic64"

  # VM name & memory
  config.vm.provider "virtualbox" do |v|
    v.name = "klodnitsky"
    v.memory = 1024
  end

  # VM hostname
  config.vm.hostname = "klodnitsky"

  # IP addres
  config.vm.network "public_network", ip: "192.168.43.77"

  # Route to private network
  config.vm.provision "shell",
    run: "always",
    inline: "route add default gw 192.168.43.1"

  # Operating in OS
  config.vm.provision "shell", inline: <<-SHELL

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

    echo Stopping firewall...
    systemctl stop ufw

    echo Restarting nginx...
    systemctl restart nginx

    echo Cloning Angular example app...
    cd /srv
    sudo git clone https://github.com/Ismaestro/angular7-example-app.git
    sudo mv angular7-example-app app
    cd app
    sudo chown -R vagrant /srv/app
    npm i --unsafe-perm

    echo Starting Angular example app in background...
    nohup npm start 0<&- &>/dev/null &

  SHELL

end