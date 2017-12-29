FROM javister-docker-docker.bintray.io/javister/javister-docker-nginx-base:2
MAINTAINER Viktor Verbitsky <vektory79@gmail.com>

ENV RPMLIST="$RPMLIST certbot" \
    LETSENCRYPT_EMAIL="" \
    USE_DHPARAM="no"

COPY files /

RUN . /usr/local/bin/yum-proxy && \
    yum-install && \
    yum-clean && \
    chmod --recursive +x /etc/my_init.d/*.sh /etc/service /usr/local/bin
