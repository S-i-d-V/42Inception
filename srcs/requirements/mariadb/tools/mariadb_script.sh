#!/bin/bash

#I erase the orinal mariadb config to put my own
rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf && mv /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/

#I start the mysql service and inject my sql script
service mysql start 
mysql < tmp/setup_db.sql

#I stop mysql to load modif and it will start when CMD is executed
service mysql stop

exec "$@"