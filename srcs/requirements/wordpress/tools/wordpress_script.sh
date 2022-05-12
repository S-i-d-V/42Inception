#!/bin/bash

mkdir -p var/www/
mkdir -p run/php

#Install wordpress
#if [! -f "/var/www/wordpress"]; then
    wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www
    tar xfC /var/www/latest-fr_FR.tar.gz /var/www/
    rm -rf /var/www/latest-fr_FR.tar.gz
    mv /tmp/wp-config.php /var/www/wordpress
#fi

#Install wp-cli
#wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#chmod +x wp-cli.phar
#sudo mv wp-cli.phar /usr/local/bin/wp


#Start php fpm
php-fpm7.3

exec "$@"