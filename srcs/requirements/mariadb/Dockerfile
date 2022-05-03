#BUILD FROM DEBIAN:BUSTER
FROM debian:buster
EXPOSE 3306

RUN apt update && apt install -y mariadb-client mariadb-server

COPY mariadb_script.sh  /tmp

RUN bash /tmp/mariadb_script.sh && rm -rf /tmp/mariadb_script.sh

ENTRYPOINT ["bash"]