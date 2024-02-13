#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /usr/sbin/sockd \
        -f /app/sockd.conf \
        "$@"
