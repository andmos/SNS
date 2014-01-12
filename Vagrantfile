# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "Simple Network Server box"
# To speed up the process under testing, just comment out unwanted modules
  config.vm.box_url = "http://files.vagrantup.com/precise32.box" 
  config.vm.provision :shell, :path => "freshInstallWeb"
  config.vm.provision :shell, :path => "bin/usersSetup" 
  config.vm.provision :shell, :path => "bin/databaseSetup"
  config.vm.provision :shell, :path => "bin/mailInstall"
  config.vm.provision :shell, :path => "bin/proxySetup"
  config.vm.provision :shell, :path => "bin/vpnSetup" 
  config.vm.provision :shell, :path => "bin/pythonDependencies" 
  config.vm.provision :shell, :path => "bin/disableBoot" 
  config.vm.provision :shell, :inline => "echo All done! Run 'vagrant ssh'" 
  config.vm.forward_port 80, 8080
  config.vm.forward_port 443, 8443
  config.vm.forward_port 3306, 6612
  config.vm.forward_port 25, 2525 
  config.vm.forward_port 3128, 3128 
  config.vm.forward_port 943, 1886
end
