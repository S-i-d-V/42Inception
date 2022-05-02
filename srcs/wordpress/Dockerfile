#BUILD FROM DEBIAN:BUSTER
FROM debian:buster
EXPOSE 9000

RUN apt update && apt install -y curl
RUN mkdir ~/wordpress

ENTRYPOINT ["bash"]