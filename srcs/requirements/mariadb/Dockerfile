#BUILD FROM DEBIAN:BUSTER
FROM debian:buster

#Install required packages
RUN     apt update && apt install -y mariadb-server mariadb-client

RUN     mkdir -p /var/run/

#Bring the setup script to the container
COPY tools/mariadb_script.sh  /tmp

#Setup the db
ENTRYPOINT [ "bash", "tmp/mariadb_script.sh" ]

#Start the service
CMD [ "mysqld_safe" ]