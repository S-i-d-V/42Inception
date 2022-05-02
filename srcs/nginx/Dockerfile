#BUILD FROM DEBIAN:BUSTER
FROM debian:buster
EXPOSE 443

RUN apt-get update && apt install -y nginx openssl

COPY server_conf /etc/nginx/sites-available/
COPY nginx_script.sh /tmp

ENTRYPOINT ["bash", "tmp/nginx_script.sh"]