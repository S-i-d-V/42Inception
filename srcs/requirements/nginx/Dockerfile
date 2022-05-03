#BUILD FROM DEBIAN:BUSTER
FROM debian:buster
EXPOSE 443

RUN apt update && apt install -y nginx openssl

COPY server_conf /etc/nginx/sites-available/
COPY nginx_script.sh /tmp

RUN bash tmp/nginx_script.sh && rm -rf tmp/nginx_script.sh

ENTRYPOINT ["bash"]