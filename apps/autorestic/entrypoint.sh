#!/usr/bin/env bash

if [ -f "${AUTORESTIC_CONFIG}" ]; then
   autorestic -c "${AUTORESTIC_CONFIG}" check "$@"
fi

while true; do
   autorestic -c "${AUTORESTIC_CONFIG}" --ci cron
   #### SLEEP 5 MIN ####
   sleep 300
done
