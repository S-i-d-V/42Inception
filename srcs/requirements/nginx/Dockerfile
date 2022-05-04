FROM debian:buster
EXPOSE 443

#GET REQUIRED PACKAGES
RUN apt update && apt install -y nginx openssl

#COPY DEPENDENCIES
COPY server_conf /etc/nginx/sites-available/
COPY tools/nginx_script.sh /tmp

#SETUP NGINX
RUN bash tmp/nginx_script.sh && rm -rf tmp/nginx_script.sh

#START NGINX ON THE FRONT END
ENTRYPOINT ["nginx", "-g", "daemon off;"]