FROM docker.io/library/alpine:3.21.0

ARG TARGETPLATFORM
ARG VERSION

RUN apk add --no-cache curl tar \
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
    && cp /plugins/* /host/opt/cni/bin \
    && rm -rf /tmp/*

USER root
