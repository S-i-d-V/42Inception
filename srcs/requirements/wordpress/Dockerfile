FROM debian:buster
EXPOSE 9000

#GET REQUIRED PACKAGES
RUN apt update && apt install -y php php-fpm

#COPY DEPENDENCIES
COPY wordpress-5.9.3-fr_FR.tar.gz /tmp
COPY wordpress_script.sh /tmp/

#SETUP NGINX
RUN bash tmp/wordpress_script.sh && rm -rf wordpress_script.sh