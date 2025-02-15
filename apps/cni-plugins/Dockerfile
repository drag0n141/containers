FROM docker.io/library/alpine:3.21.3

ARG TARGETPLATFORM
ARG VERSION

ENV CNI_BIN_DIR=/host/opt/cni/bin

RUN apk add --no-cache curl rsync tar \
    && mkdir -p /plugins /host/opt/cni/bin \
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
    curl -fsSL "https://github.com/containernetworking/plugins/releases/download/v${VERSION}/cni-plugins-linux-${ARCH}-v${VERSION}.tgz" \
        | tar xzf - -C /plugins --strip-components=1 \
    && rm -rf /tmp/*

USER root
CMD rsync -av /plugins/* $CNI_BIN_DIR

LABEL org.opencontainers.image.source="https://github.com/containernetworking/plugins"
