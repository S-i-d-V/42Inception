#!/bin/bash
mkdir -p var/www/

#Config php
mkdir -p run/php

#Install wordpress
wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www
tar xfC /var/www/latest-fr_FR.tar.gz /var/www/
rm -rf /var/www/latest-fr_FR.tar.gz
#Install wp-cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

#Start php fpm
php-fpm7.3

exec "$@"