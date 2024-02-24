#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /usr/local/bin/autorestic autorestic -c /config/config.yml \
        cron "$@"

exec \
    /usr/sbin/crond -f -S -l 0 \
        -c /etc/crontabs
