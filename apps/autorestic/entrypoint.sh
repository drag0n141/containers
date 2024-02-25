#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /usr/local/bin/autorestic -c "${AUTORESTIC_CONFIG}" \
        check "$@"

while true; do
   autorestic -c "${AUTORESTIC_CONFIG}" --ci cron
   #### SLEEP 5 MIN ####
   sleep 300
done
