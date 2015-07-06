# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|

 config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1536",
      "--cpus", "2",
      "--ioapic", "on"
    ]
    end

  config.vm.box_url = "http://static.gender-api.com/debian-8-jessie-rc2-x64-slim.box"
  config.vm.box = "debian8"
  config.vm.hostname = "devbox"
  config.vm.network :forwarded_port, host: 10080, guest: 80
  config.vm.network :forwarded_port, host: 10081, guest: 81
  config.vm.network :forwarded_port, host: 10082, guest: 82
  config.vm.network :forwarded_port, host: 18000, guest: 8000
  config.vm.network :forwarded_port, host: 18080, guest: 8080
  config.vm.synced_folder "www", "/var/www", type: "nfs"

  # Set the Timezone to something useful
  config.vm.provision :shell, :inline => "echo \"Europe/Berlin\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.

  #config.vm.network :private_network, ip: "192.168.3.3"

  config.vm.provision :puppet do |puppet|
     puppet.facter = { "fqdn" => "local.devbox", "hostname" => "devbox" }
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path = "modules"
  end

end
