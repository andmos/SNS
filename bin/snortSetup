#! /bin/bash

#------------THIS FILE NEEDS WORKING ON, NOT FINNISHED.

pass=$(</vagrant/mysqlpw.txt)

SNORTIP=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2| cut -d' ' -f1)

echo "Setting up  snort-database:"


mysql -u root --password=$pass -e 'create database snort'

sudo apt-get install snort-mysql -y

cd /usr/share/doc/snort-mysql/
zcat create_mysql.gz | mysql -u root -h localhost --password=$pass  snort

echo "Standard Snort-mysql DB configured" 
