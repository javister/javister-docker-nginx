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

if [ ! -d "/config/nginx/certs/dhparam.pem" ]; then
    openssl dhparam -out /config/nginx/certs/dhparam.pem 4096
fi

sed --in-place "s/error_log \\/var\\/log\\/nginx\\/error.log;/error_log \\/config\\/nginx\\/log\\/error.log;/g" /etc/nginx/nginx.conf
sed --in-place "s/access_log.*main;/access_log \\/config\\/nginx\\/log\\/access.log main;/g" /etc/nginx/nginx.conf
sed --in-place "s/include\\s.*conf.d.*;/include \\/config\\/nginx\\/config\\/conf.d\\/*.conf;/g" /etc/nginx/nginx.conf
sed --in-place "s/include\\s.*default.d.*;/include \\/config\\/nginx\\/config\\/default.d\\/*.conf;/g" /etc/nginx/nginx.conf
