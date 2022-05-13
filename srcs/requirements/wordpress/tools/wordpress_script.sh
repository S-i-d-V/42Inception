#!/bin/bash

#Install wordpress
unzip wordpress-5.9.1-fr_FR.zip -d /var/www/

if [ ! -f /var/www/wordpress/wp-config.php]; then
    #Manual configuration
    #sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /tmp/wp-config.php
    #sed -i "s/MYSQL_SUPER_USER/$MYSQL_SUPER_USER/g" /tmp/wp-config.php
    #sed -i "s/MYSQL_SUPER_PASSWORD/$MYSQL_SUPER_PASSWORD/g" /tmp/wp-config.php
    #mv /tmp/wp-config.php /var/www/wordpress/

    #WP-CLI configuration
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_SUPER_USER --dbpass=$MYSQL_SUPER_PASSWORD --dbhost=mariadb
    wp core install --url=$DOMAIN_NAME --title="my inception" --admin_user=$WP_SUPER_USER --admin_password=$WP_SUPER_PASSWORD --admin_email=$WP_SUPER_EMAIL
    wp user create $WP_SUPER_USER $WP_SUPER_EMAIL --user_pass=$WP_SUPER_PASSWORD
fi

#I erase the orinal php-fpm config to put my own
mkdir -p /run/php
rm -rf /etc/php/7.3/fpm/pool.d/www.conf && mv /tmp/www.conf /etc/php/7.3/fpm/pool.d/

exec "$@"
