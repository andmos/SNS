#! /bin/bash

#------------THIS FILE NEEDS WORKING ON, NOT FINNISHED.

pass=$(</vagrant/mysqlpw.txt)
SNORTIP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2| cut -d' ' -f1)

echo "Setting up  snort-database:"

 
mysql -u root --password=$pass -e 'create database snort'

echo snort-mysql snort-mysql/address_range  string  $SNORTIP/32 | sudo debconf-set-selections
echo snort-mysql snort-mysql/configure_db    boolean false | sudo debconf-set-selections
echo snort-mysql snort-mysql/db_host string localhost | sudo debconf-set-selections
echo snort-mysql snort-mysql/db_user string root | sudo debconf-set-selection


sudo apt-get install snort-mysql -y

cd /usr/share/doc/snort-mysql/

zcat create_mysql.gz | mysql -u root -h localhost --password=$pass  snort
echo "Standard Snort-mysql DB configured" 
