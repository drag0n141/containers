FROM docker.io/library/alpine:3.20.1

ARG TARGETPLATFORM
ARG VERSION

RUN apk add --no-cache --virtual .build-deps curl \
    && mkdir /plugins \
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
        | tar xzf - -C /plugins \
    && apk del --purge .build-deps \
    && rm -rf /tmp/*

USER root
CMD cp /plugins/* /host/opt/cni/bin
