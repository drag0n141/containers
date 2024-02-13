#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /usr/local/bin/vlmcsd - D -e \
        "$@"
