#! /bin/bash
echo "Importing database:"
mysql -u root --password=Glittertind  -e 'create database konto'
mysql -u root --password=Glittertind  konto < /vagrant/mysqldb.konto.sql
echo "Done, ready to be SQL-Injected!"
