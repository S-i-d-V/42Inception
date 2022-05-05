#!/bin/bash
mkdir -p var/www/

#Config php
mkdir -p run/php
rm -rf etc/php/7.3/fpm/pool.d/www.conf && mv /tmp/www.conf etc/php/7.3/fpm/pool.d/

#Install wordpress
wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www
tar xfC /var/www/latest-fr_FR.tar.gz /var/www/
rm -rf /var/www/latest-fr_FR.tar.gz

#Config wordpress
mv /tmp/wp-config.php /var/www/wordpress/
rm -rf /var/www/wordpress/wp-config-sample.php

#Start php fpm
php-fpm7.3

tail -f