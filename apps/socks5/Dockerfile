FROM docker.io/library/alpine:3.21.0

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        dante-server~"${VERSION}"


COPY ./apps/socks5/sockd.conf /app/sockd.conf
COPY ./apps/socks5/entrypoint.sh /entrypoint.sh

USER nobody:nogroup
ENTRYPOINT ["/usr/bin/catatonit", "--"]
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/notpeter/dante"
