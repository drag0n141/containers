ARG VERSION
FROM --platform=amd64 ghcr.io/mbecker20/periphery:${VERSION}

ENV DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND="noninteractive" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        ca-certificates \
        curl \
    && \
    curl -fsSL -o /tmp/1password-cli.deb \
        "https://downloads.1password.com/linux/debian/amd64/stable/1password-cli-amd64-latest.deb" \
    && \
    dpkg -i --force-confold /tmp/1password-cli.deb \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && apt-get autoremove -y \
    && apt-get clean \
    && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/

CMD [ "/usr/local/bin/periphery" ]
