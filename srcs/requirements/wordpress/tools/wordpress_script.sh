#!/bin/bash

#Install wordpress
unzip wordpress-5.9.1-fr_FR.zip -d /var/www/

if [ -f "/tmp/wp-config.php" ]; then
    #Set the config depending on the env variable (for name, user etc...)
    sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /tmp/wp-config.php
    sed -i "s/MYSQL_SUPER_USER/$MYSQL_SUPER_USER/g" /tmp/wp-config.php
    sed -i "s/MYSQL_SUPER_PASSWORD/$MYSQL_SUPER_PASSWORD/g" /tmp/wp-config.php
    mv /tmp/wp-config.php /var/www/wordpress/
fi

mkdir -p /run/php
if [ -f "/tmp/www.conf" ]; then
    #I erase the orinal php-fpm config to put my own
    rm -rf /etc/php/7.3/fpm/pool.d/www.conf && mv /tmp/www.conf /etc/php/7.3/fpm/pool.d/
fi

#Exec replace the current shell by entrypoint args (CMD)
#Start php-fpm in the foreground
exec "$@"
