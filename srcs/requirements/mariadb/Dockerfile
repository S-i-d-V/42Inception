#BUILD FROM DEBIAN:BUSTER
FROM debian:buster
EXPOSE 3306

#GET REQUIRED PACKAGES
RUN apt update && apt install -y mariadb-server

#COPY DEPENDENCIES
COPY tools/mariadb_script.sh  /tmp

#SETUP MYSQEL
RUN bash /tmp/mariadb_script.sh && rm -rf /tmp/mariadb_script.sh

CMD ["tail", "-f"]