FROM docker.io/library/alpine:3.20.0
ARG TARGETARCH
ARG VERSION

RUN apk add --no-cache --virtual .build-deps curl \
    && mkdir /plugins \
    && \
    curl -fsSL "https://github.com/containernetworking/plugins/releases/download/v${VERSION}/cni-plugins-linux-${TARGETARCH}-v${VERSION}.tgz" \
        | tar xzf - -C /plugins \
    && apk del --purge .build-deps \
    && rm -rf /tmp/*

USER root
CMD cp /plugins/* /host/opt/cni/bin
