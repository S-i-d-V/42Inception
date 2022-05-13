#!/bin/bash

#Install the 
unzip latest-fr_FR.zip
mv index.php wordpress/
mv wordpress /var/www/
mv /tmp/wp-config.php /var/www/wordpress/

#I erase the orinal php-fpm config to put my own
mkdir -p /run/php
rm -rf /etc/php/7.3/fpm/pool.d/www.conf && mv /tmp/www.conf /etc/php/7.3/fpm/pool.d/

exec "$@"
