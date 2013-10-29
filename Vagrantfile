# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "SNMTestingBox"

  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provision :shell, :path => "freshInstallWeb.bash"
  config.vm.provision :shell, :path => "bin/databaseSetup.bash"
  config.vm.forward_port 80, 8080
  config.vm.forward_port 443, 8443
  config.vm.forward_port 3306, 6612 

end
