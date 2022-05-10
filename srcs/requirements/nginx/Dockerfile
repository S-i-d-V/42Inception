#I use Debian as OS
FROM debian:buster

#Install required packages
RUN     apt update && apt install -y nginx openssl

#Erase default config and brind mine
RUN     rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
COPY    default /etc/nginx/sites-available/
RUN     ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
#Generate SSL key and certif
RUN     openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/ssl_certificate_key.key \
        -x509 -days 365 -out /etc/ssl/certs/ssl_certificate.crt  -subj '/CN=ugtheven.42.fr'

#Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]