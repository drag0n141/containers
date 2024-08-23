FROM docker.io/library/alpine:3.20 AS builder

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

WORKDIR /tmp

RUN \
  apk add --no-cache \
    git \
    make \
    build-base \
  && git clone --branch ${CHANNEL} https://github.com/Wind4/vlmcsd.git . \
  && make

FROM docker.io/library/alpine:3.20

#hadolint ignore=DL3018
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit

COPY ./apps/kms/entrypoint.sh /entrypoint.sh
COPY --from=builder /tmp/bin/vlmcsd /usr/local/bin/vlmcsd
RUN chmod +x /usr/local/bin/vlmcsd

ENTRYPOINT ["/usr/bin/catatonit", "--"]
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Wind4/vlmcsd"
