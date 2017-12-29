#!/usr/bin/env bash

set -e

HOSTS="/config/letsencrypt/hosts.txt"

[ ! -d "/config/letsencrypt" ] && mkdir --parents /config/letsencrypt || true

if [ ! -f "${HOSTS}" ]; then
    touch ${HOSTS}
fi

if [ "${LETSENCRYPT_EMAIL}" ]; then
    sed --in-place "s/# email = .*/email = ${LETSENCRYPT_EMAIL}/g" /etc/letsencrypt/cli.ini
fi

le-check
