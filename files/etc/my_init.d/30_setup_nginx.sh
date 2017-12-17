#!/usr/bin/env bash

set -e

if [ ! -d "/config/nginx" ]; then
    mkdir --parents \
        /config/nginx/log \
        /config/nginx/config/default.d \
        /config/nginx/config/conf.d \
        /config/nginx/certs \
        /config/nginx/htpasswd \
        /config/nginx/config/vhost.d
    chmod --recursive 0776 /config/nginx /var/lib/nginx
    chown --recursive system:system /config/nginx
fi

if [ ! -f "/etc/nginx/nginx.conf.docker" ]; then
    cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.docker
fi
cp --force /etc/nginx/nginx.conf.docker /etc/nginx/nginx.conf

sed --in-place "s/user nginx;/user system;/g" /etc/nginx/nginx.conf
sed --in-place "s/error_log \\/var\\/log\\/nginx\\/error.log;/error_log \\/config\\/nginx\\/log\\/error.log;/g" /etc/nginx/nginx.conf
sed --in-place "s/access_log.*main;/access_log \\/config\\/nginx\\/log\\/access.log main;/g" /etc/nginx/nginx.conf
sed --in-place "s/include\\s.*conf.d.*;/include \\/config\\/nginx\\/config\\/conf.d\\/*.conf;/g" /etc/nginx/nginx.conf
sed --in-place "s/include\\s.*default.d.*;/include \\/config\\/nginx\\/config\\/default.d\\/*.conf;/g" /etc/nginx/nginx.conf
sed --in-place "s/listen.*\\[::\\]:80 default_server;/#listen       [::]:80 default_server;/g" /etc/nginx/nginx.conf

if [ "${WORKER_CONNECTIONS}" ]; then
    sed --in-place "s/worker_connections .*;/worker_connections ${WORKER_CONNECTIONS};/g" /etc/nginx/nginx.conf
fi

if [ "${WORKER_RLIMIT_NOFILE}" ]; then
    sed --in-place "/worker_processes/i worker_rlimit_nofile ${WORKER_RLIMIT_NOFILE};" /etc/nginx/nginx.conf
fi
