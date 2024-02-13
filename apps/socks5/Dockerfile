FROM ghcr.io/drag0n141/alpine:latest@sha256:770611700350cc30008a95952e9808c0dddf3e829d076bb1023953d3e5370664

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
