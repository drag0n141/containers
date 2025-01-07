FROM docker.io/library/alpine:3.21.1

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV \
  AUTOSCAN_CONFIG="/config/config.yml" \
  AUTOSCAN_DATABASE="/config/autoscan.db" \
  AUTOSCAN_LOG="/config/activity.log" \
  AUTOSCAN_VERBOSITY="0"

ENV UMASK="0002" \
    TZ="Etc/UTC"

#hadolint ignore=DL3018,DL3059
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        curl \
        jq \
        libintl \
        nano \
        sqlite-libs \
        tzdata \
        xmlstarlet \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') \
            export ARCH='amd64'; \
        ;; \
        'linux/arm64') \
            export ARCH='arm64'; \
        ;; \
    esac \
    && \
    curl -fsSL -o /usr/local/bin/autoscan \
        "https://github.com/Cloudbox/autoscan/releases/download/v${VERSION}/autoscan_v${VERSION}_linux_${ARCH}" \
    && chmod +x /usr/local/bin/autoscan \
    && rm -rf /tmp/*

COPY ./apps/autoscan/entrypoint.sh /entrypoint.sh

USER root
WORKDIR /config
VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--"]
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Cloudbox/autoscan"
