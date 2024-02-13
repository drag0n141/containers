#!/usr/bin/env bash
version="$(curl -sX GET "https://api.github.com/repos/Wind4/vlmcsd/releases/latest" | jq --raw-output '.tag_name' 2>/dev/null)"
printf "%s" "${version}"
