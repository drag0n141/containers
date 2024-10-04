#!/usr/bin/env bash
version=$(curl -sX GET "https://pkgs.alpinelinux.org/package/v3.20/community/x86_64/dante-server" | grep -oP '(?<=<strong>).*?(?=</strong>)' 2>/dev/null)
version="${version%%_*}"
version="${version%%-*}"
printf "%s" "${version}"
