FROM debian:buster
EXPOSE 9000

#GET REQUIRED PACKAGES
RUN apt update && apt install -y wget php php-fpm php-mysql

#COPY DEPENDENCIES
COPY wp-config.php /tmp
COPY www.conf /tmp
COPY tools/wordpress_script.sh /tmp

CMD ["bash", "/tmp/wordpress_script.sh"]