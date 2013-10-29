#! /bin/bash

#------------THIS FILE NEEDS WORKING ON, NOT FINNISHED.

pass=$(</vagrant/mysqlpw.txt)

echo "Setting up  snort-database:"

mysql -u root --password=$pass -e 'create database snort'

function setParameter(){
        sudo debconf-set-selection <<< $1
}


setParameter echo "snort-mysql snort-mysql/db_pass $password"
setParameter echo "snort-mysql snort-mysql/address_range   string  127.0.0.1/32" 
setParameter echo "snort-mysql snort-mysql/send_stats  boolean true"
setParameter echo "snort-mysql snort-mysql/please_restart_manually note"
setParameter echo "snort-mysql snort-mysql/configure_db    boolean false"

sudo apt-get install snort-mysql -y

cd /usr/share/doc/snort-mysql/

zcat create_mysql.gz | mysql -u root -h localhost --password=$pass  snort
echo "Standard Snort-mysql DB configured" 
