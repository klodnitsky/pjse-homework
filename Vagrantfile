#
# => Andrew Klodnitsky
#

Vagrant.configure("2") do |config|

  # Vagrant box
  config.vm.box = "ubuntu/bionic64"

  # VM name & memory
  config.vm.provider "virtualbox" do |v|
    v.name = "klodnitsky"
    v.memory = 3072
  end

  # VM hostname
  config.vm.hostname = "klodnitsky"

  config.vm.network :forwarded_port, guest: 80, host: 9090

  # Operating in OS
  config.vm.provision "shell", path: "vscr/init.sh"

  # Rebuild App
  config.vm.provision "shell", path: "vscr/rebuild.sh", run: "always"

end