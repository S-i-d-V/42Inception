#!/bin/bash
mkdir -p var/www/
wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www
tar xfC /var/www/latest-fr_FR.tar.gz /var/www/ && rm -rf /var/www/latest-fr_FR.tar.gz
mv /tmp/wp-config.php /var/www/wordpress/
chown -R www-data /var/www/wordpress