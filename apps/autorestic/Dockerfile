FROM docker.io/restic/restic:0.16.4 as restic

FROM ghcr.io/drag0n141/alpine:latest@sha256:770611700350cc30008a95952e9808c0dddf3e829d076bb1023953d3e5370664

ARG TARGETPLATFORM
ARG VERSION

ENV \
    AUTORESTIC_CONFIG="/config/autorestic.yaml" \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_ROOT_USER_ACTION=ignore \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_BREAK_SYSTEM_PACKAGES=1 \
    CRYPTOGRAPHY_DONT_BUILD_RUST=1

#hadolint ignore=DL3018,DL3013
RUN apk add --no-cache \
        ca-certificates \
        bash \
        bzip2 \
        curl \
        docker-cli \
        py3-pip \
        python3
    && \
    apk add --no-cache --virtual=.build-deps \
        python3-dev
    && \
    pip install --upgrade \
        pip \
        apprise
    && apk del --purge .build-deps \
    && rm -rf \
        /root/.cache \
        /root/.cargo \
        /tmp/*
#hadolint ignore=DL3059
RUN \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='amd64' ;; \
        'linux/arm64') export ARCH='arm64' ;; \
    esac \
    && \
    wget -qO- https://rclone.org/install.sh | bash \
    && \
    curl -fsSL -o /tmp/autorestic.bz2 \
        "https://github.com/cupcakearmy/autorestic/releases/download/v${VERSION}/autorestic_${VERSION}_linux_${ARCH}.bz2" \
    && \
    bzip2 -dc /tmp/autorestic.bz2 > /usr/local/bin/autorestic \
    && \
    chown -R root:root /usr/local/bin \
    && chmod -R 755 /usr/local/bin \
    && rm -rf /tmp/*

# Install Restic
COPY --from=restic /usr/bin/restic /usr/local/bin/restic

USER kah

COPY ./apps/autorestic/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/cupcakearmy/autorestic"
