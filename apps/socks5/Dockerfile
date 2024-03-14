FROM ghcr.io/drag0n141/alpine:latest@sha256:d892f81359f3562d75c3c189f0fcbf7862faa117baa3e9487ebb8996a04b1a13

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates dante-server~"${VERSION}"

USER kah
COPY ./apps/socks5/sockd.conf /app/sockd.conf
COPY ./apps/socks5/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/notpeter/dante"
