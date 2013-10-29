#! /bin/bash

pass=$(</vagrant/mysqlpw.txt)

echo "Importing database:"
mysql -u root --password=$pass  -e 'create database konto'
mysql -u root --password=$pass  konto < /vagrant/mysqldb.konto.sql
echo "Done, ready to be SQL-Injected!"
