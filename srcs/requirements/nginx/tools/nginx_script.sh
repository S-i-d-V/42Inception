#!/bin/bash

#nginx conf
rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
ln -s /etc/nginx/sites-available/server_conf /etc/nginx/sites-enabled/

#ssl
openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/ssl_certificate_key.key -x509 -days 365 -out /etc/ssl/certs/ssl_certificate.crt  -subj '/CN=nginx'