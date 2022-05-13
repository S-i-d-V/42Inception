#BUILD FROM DEBIAN:BUSTER
FROM    debian:buster

#Install required packages
RUN     apt update && apt install -y nginx openssl

#Copy needed files from host to the container
COPY    conf/default /etc/nginx/sites-enabled/default
#RUN     sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-enabled/default

#Setup the ssl keys for nginx
RUN     openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/ssl_certificate_key.key \
        -x509 -days 365 -out /etc/ssl/certs/ssl_certificate.crt  -subj '/CN=ugtheven.42.fr'

#Start nginx in the foreground
CMD     ["nginx", "-g", "daemon off;"]
