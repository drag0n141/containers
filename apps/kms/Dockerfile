FROM docker.io/library/alpine:3.19 as builder
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

FROM ghcr.io/drag0n141/alpine:latest@sha256:d892f81359f3562d75c3c189f0fcbf7862faa117baa3e9487ebb8996a04b1a13

USER kah

COPY --chown=568:568 --from=builder /tmp/bin/vlmcsd /usr/local/bin/vlmcsd
RUN chmod +x /usr/local/bin/vlmcsd

COPY ./apps/kms/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Wind4/vlmcsd"
