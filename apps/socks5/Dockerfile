FROM docker.io/library/alpine:3.20.0

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates dante-server~"${VERSION}"

USER nobody:nogroup
COPY ./apps/socks5/sockd.conf /app/sockd.conf
COPY ./apps/socks5/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/notpeter/dante"
