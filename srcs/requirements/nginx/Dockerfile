#BUILD FROM DEBIAN:BUSTER
FROM    debian:buster

#Install required packages
RUN     apt update && apt install -y nginx openssl

#Erase the nginx default config to put my own
COPY    conf/inception.conf /etc/nginx/sites-available/
RUN     sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/inception.conf
RUN     rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
RUN     ln -s /etc/nginx/sites-available/inception.conf /etc/nginx/sites-enabled/

#Setup the ssl keys for nginx
RUN     openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/ssl_certificate_key.key \
        -x509 -days 365 -out /etc/ssl/certs/ssl_certificate.crt  -subj '/CN=ugtheven.42.fr'

#Start nginx in the foreground
CMD     ["nginx", "-g", "daemon off;"]
