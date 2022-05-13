#!/bin/bash

#I erase the orinal mariadb config to put my own
rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf && mv /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/

#I will set my db depending on the env variable (for name, user etc...)
sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /tmp/setup_db.sql
sed -i "s/MYSQL_SUPER_USER/$MYSQL_SUPER_USER/g" /tmp/setup_db.sql
sed -i "s/MYSQL_SUPER_PASSWORD/$MYSQL_SUPER_PASSWORD/g" /tmp/setup_db.sql
sed -i "s/MYSQL_LAMBDA_USER/$MYSQL_LAMBDA_USER/g" /tmp/setup_db.sql
sed -i "s/MYSQL_LAMBDA_PASSWORD/$MYSQL_LAMBDA_PASSWORD/g" /tmp/setup_db.sql

#I start the mysql service and inject my sql script
service mysql start 
mysql < tmp/setup_db.sql

#I stop mysql to load modif and it will start when CMD is executed
service mysql stop

exec "$@"