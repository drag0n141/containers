FROM ghcr.io/drag0n141/alpine:latest@sha256:d892f81359f3562d75c3c189f0fcbf7862faa117baa3e9487ebb8996a04b1a13
ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV \
  AUTOSCAN_CONFIG="/config/config.yml" \
  AUTOSCAN_DATABASE="/config/autoscan.db" \
  AUTOSCAN_LOG="/config/activity.log" \
  AUTOSCAN_VERBOSITY="0"

#hadolint ignore=DL3059
RUN \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='amd64' ;; \
        'linux/arm64') export ARCH='arm64' ;; \
    esac \
    && \
    curl -fsSL -o /usr/local/bin/autoscan \
        "https://github.com/Cloudbox/autoscan/releases/download/v${VERSION}/autoscan_v${VERSION}_linux_${ARCH}" \
    && chmod +x /usr/local/bin/autoscan \
    && rm -rf /tmp/*

USER kah
COPY ./apps/autoscan/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Cloudbox/autoscan"
