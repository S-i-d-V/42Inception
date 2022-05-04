FROM debian:buster
EXPOSE 9000

#GET REQUIRED PACKAGES
RUN apt update && apt install -y wget php php-fpm

#COPY DEPENDENCIES
COPY tools/wordpress_script.sh /tmp/

#SETUP WORDPRESS
RUN bash tmp/wordpress_script.sh && rm -rf tmp/wordpress_script.sh

CMD ["tail", "-f"]