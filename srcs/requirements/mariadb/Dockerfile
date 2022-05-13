#BUILD FROM DEBIAN:BUSTER
FROM debian:buster

#Install required packages
RUN apt update && apt install -y mariadb-server

#Copy needed files from host to the container
COPY tools/mariadb_script.sh /tmp
COPY conf/50-server.cnf /tmp
COPY conf/setup_db.sql /tmp

#Setup the db
ENTRYPOINT ["bash", "/tmp/mariadb_script.sh"]

#Start mariadb in the foreground
CMD ["mysqld_safe"]
