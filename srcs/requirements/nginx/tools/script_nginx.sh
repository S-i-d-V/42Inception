#!/bin/bash

sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/inception.conf

#Exec replace the current shell by entrypoint args (CMD)
#Start nginx in the foreground
exec "$@"