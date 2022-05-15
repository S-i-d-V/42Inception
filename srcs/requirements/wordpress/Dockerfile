#BUILD FROM DEBIAN:BUSTER
FROM        debian:buster

#Install required packages
RUN         apt update && apt install -y wget unzip php php-fpm php-mysql
RUN         wget https://fr.wordpress.org/wordpress-5.9.1-fr_FR.zip

#Copy needed files from host to the container
COPY        tools/wordpress_script.sh /tmp
COPY        conf/wp-config.php /tmp
COPY        conf/www.conf /tmp

#Setup the wordpress config
ENTRYPOINT  ["bash", "/tmp/wordpress_script.sh"]

#Start php-fpm in the foreground
CMD         ["php-fpm7.3", "--nodaemonize"]
