#!/bin/bash

#Install wordpress and change the default config by mine
unzip latest-fr_FR.zip -d /var/www/
sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /tmp/wp-config.php
sed -i "s/MYSQL_USER/$MYSQL_USER/g" /tmp/wp-config.php
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /tmp/wp-config.php
mv /tmp/wp-config.php /var/www/wordpress/

#I erase the orinal php-fpm config to put my own
mkdir -p /run/php
rm -rf /etc/php/7.3/fpm/pool.d/www.conf && mv /tmp/www.conf /etc/php/7.3/fpm/pool.d/

exec "$@"
