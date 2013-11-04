#! /bin/bash

echo "Logg files in /var/log/install.log"
sudo touch /var/log/install.log

function install() {
sudo apt-get install -y $1 >/dev/null 2>&1 
    }


    
programs="build-essential vim ssh curl htop git make traceroute tcptraceroute fail2ban screen apache2 php5 mysql-server php5-mysql php5-mysqlnd php-mdb2-driver-mysql mysql-libs " 

echo "Installing web-server essentials..."
sudo apt-get update >/dev/null 2>&1 


pass=$(</vagrant/mysqlpw.txt)
 
 sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $pass" 
 sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $pass"



for program in $programs
do 
    echo "Current package: $program" 
    install $program 

done 


echo "Symlincing /www folder to /Vagrant folder..."

rm -rf /var/www
ln -fs /vagrant /var/www 

sudo echo "Simple Network Server, v.0.1 'Glittertind'" >> /etc/motd.tail 
sudo echo "-----------MENY for server options------------"  >> /etc/motd.tail

echo "export PATH=$PATH:/vagrant/bin" >> .bashrc 

echo "All done! go 'vagrant ssh'" 
