#BUILD FROM DEBIAN:BUSTER
FROM debian:buster

#Install required packages
RUN     apt update && apt install -y mariadb-server mariadb-client

RUN     rm -rf etc/mysql/mariadb.conf.d/50-server.conf && mkdir -p /var/run/
COPY    50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#Bring the setup script to the container
COPY tools/mariadb_script.sh  /tmp

#Setup the db
ENTRYPOINT [ "bash", "tmp/mariadb_script.sh" ]

#Start the service
CMD [ "mysqld_safe" ]