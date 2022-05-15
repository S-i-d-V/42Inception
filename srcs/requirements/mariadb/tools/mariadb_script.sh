#!/bin/bash

if [ -f "/tmp/50-server.cnf" ]; then
    #Erase the orinal mariadb config to put my own
    rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf && mv /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/
    #Set the db depending on the env variable (for name, user etc...)
    sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /tmp/setup_db.sql
    sed -i "s/MYSQL_SUPER_USER/$MYSQL_SUPER_USER/g" /tmp/setup_db.sql
    sed -i "s/MYSQL_SUPER_PASSWORD/$MYSQL_SUPER_PASSWORD/g" /tmp/setup_db.sql
    sed -i "s/MYSQL_LAMBDA_USER/$MYSQL_LAMBDA_USER/g" /tmp/setup_db.sql
    sed -i "s/MYSQL_LAMBDA_PASSWORD/$MYSQL_LAMBDA_PASSWORD/g" /tmp/setup_db.sql
    sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /tmp/dump_db.sql
    #Start the mysql service and inject the sql script
    service mysql start
    mysql < tmp/setup_db.sql
    #Inject the dump of my ready-to-use wordpress database
    mysql < tmp/dump_db.sql
    #Stop mysql to load modif and it will start when CMD is executed
    service mysql stop
fi

#Exec replace the current shell by entrypoint args (CMD)
#Start mysqld_safe in the foreground
exec "$@"