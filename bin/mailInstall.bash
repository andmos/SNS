#! /bin/bash
echo "Installing postfix and mail - services..."
sudo /vagrant/bin/postfixInstall.bash >> /var/log/install.log


echo "Done!" 
