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
        wget \
    && \
    wget -P /tmp/ https://downloads.1password.com/linux/debian/amd64/stable/1password-cli-amd64-latest.deb \
    dpkg -i /tmp/1password-cli-$(dpkg --print-architecture)-latest.deb \
    && rm -rf /var/lib/apt/lists/* /tmp/*

CMD [ "/usr/local/bin/periphery" ]
