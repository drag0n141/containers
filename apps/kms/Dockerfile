FROM docker.io/library/alpine:3.19 as builder
ARG VERSION

WORKDIR /tmp

RUN \
  apk add --no-cache \
    git \
    make \
    build-base \
  && git clone https://github.com/Wind4/vlmcsd.git . \
  && if [ -n "$VERSION" ]; then \
    NUMBER_COMMITS_TO_REVERT=$(( $(git rev-list --count --first-parent HEAD) - $(echo "${VERSION}" | cut -d "." -f3) )); \
    git checkout "master~$NUMBER_COMMITS_TO_REVERT"; \
  fi \
  && cd vlmcsd/ \
  && make

FROM ghcr.io/drag0n141/alpine:latest@sha256:770611700350cc30008a95952e9808c0dddf3e829d076bb1023953d3e5370664

USER kah

COPY --from=builder /tmp/vlmcsd/bin/vlmcsd /usr/local/bin/vlmcsd
RUN chmod +x /usr/local/bin/vlmcsd

COPY ./apps/kms/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Wind4/vlmcsd"
