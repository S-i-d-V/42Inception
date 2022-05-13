#!/bin/bash

rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf && mv /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/

service mysql start 

mysql -u root -e "CREATE DATABASE wp_db;"
mysql -u root -e "CREATE USER 'wp_super'@'localhost' IDENTIFIED BY '123456';"
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'wp_super'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mysql stop

exec "$@"