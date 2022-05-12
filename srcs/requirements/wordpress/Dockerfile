FROM debian:buster
#EXPOSE 9000

#GET REQUIRED PACKAGES
RUN apt update && apt install -y wget php php-fpm php-mysql curl

#COPY DEPENDENCIES
COPY tools/wordpress_script.sh /tmp
COPY wp-config.php /tmp

#SETUP AND START THE SERVICE
ENTRYPOINT ["bash", "/tmp/wordpress_script.sh"]
CMD ["php-fpm7", "--nodaemonize"]