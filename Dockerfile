FROM javister-docker-docker.bintray.io/javister/javister-docker-nginx-base:2
MAINTAINER Viktor Verbitsky <vektory79@gmail.com>

ENV USE_DHPARAM="no"

COPY files /

RUN chmod --recursive +x /etc/my_init.d/*.sh /etc/service /usr/local/bin
