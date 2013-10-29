#! /bin/bash

pass=$(</vagrant/mysqlpw.txt)

echo "Setting up database:"
mysql -u root --password=$pass -e 'create database snort'
cd /usr/share/doc/snort-mysql/
zcat create_mysql.gz | mysql -u <user> -h localhost --password=$pass  snort
echo "Standard Snort-mysql DB configured" 
