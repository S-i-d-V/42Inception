#BUILD FROM DEBIAN:BUSTER
FROM debian:buster
EXPOSE 9000

RUN apt update && apt install -y php php-fpm

COPY wordpress-5.9.3-fr_FR.tar.gz /tmp
COPY wordpress_script.sh /tmp/

RUN bash tmp/wordpress_script.sh && rm -rf wordpress_script.sh

ENTRYPOINT ["bash"]