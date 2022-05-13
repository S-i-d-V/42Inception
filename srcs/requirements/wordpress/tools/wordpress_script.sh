#!/bin/bash

date -u

mkdir -p /run/php

unzip latest-fr_FR.zip
mv index.php wordpress/
mv wordpress /var/www/
mv /tmp/wp-config.php /var/www/wordpress/

rm -rf /etc/php/7.3/fpm/pool.d/www.conf && mv /tmp/www.conf /etc/php/7.3/fpm/pool.d/

exec "$@"
