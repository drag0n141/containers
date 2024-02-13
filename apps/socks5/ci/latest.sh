#!/usr/bin/env bash
version="$(curl -sX GET "https://pkgs.alpinelinux.org/packages?name=dante-server&branch=v3.19&arch" | grep -oP '(?<=<td class="version">)[^<]*' 2>/dev/null)"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
