FROM docker.io/library/alpine:3.20 as builder

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

COPY --from=builder /tmp/bin/vlmcsd /usr/local/bin/vlmcsd
RUN chmod +x /usr/local/bin/vlmcsd

COPY ./apps/kms/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Wind4/vlmcsd"
