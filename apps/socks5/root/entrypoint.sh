#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"

if [[ ! -f "/config/sockd.conf" ]]; then
    printf "Copying over default configuration ...\n"
    cp /app/sockd.conf /config/sockd.conf
fi

#shellcheck disable=SC2086
exec \
    /usr/sbin/sockd \
        -f /app/dante/sockd.conf \
        "$@"
