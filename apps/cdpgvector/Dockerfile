FROM docker.io/library/alpine:3.20 as builder

ARG TARGETPLATFORM
ARG VERSION

WORKDIR /tmp

#hadolint ignore=DL3018,DL3059
RUN \
    apk add --no-cache \
        alien \
        binutils \
        curl \
        rpm \
        xz \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='amd64' ;; \
        'linux/arm64') export ARCH='arm64' ;; \
    esac \
    && \
    curl --fail -o pgvectors.deb -sSL https://github.com/tensorchord/pgvecto.rs/releases/download/v${VERSION}/vectors-pg16_${VERSION}_${ARCH}.deb \
    && \
    alien -r /tmp/pgvectors.deb \
    && \
    rm -f /tmp/pgvectors.deb \
    && \
    rpm2cpio /tmp/*.rpm | cpio -idmv

FROM registry.developers.crunchydata.com/crunchydata/crunchy-postgres:ubi8-16.3-1

COPY --chown=root:root --chmod=755 --from=builder /tmp/usr/lib/postgresql/16/lib/vectors.so /usr/pgsql-16/lib/
COPY --chown=root:root --chmod=755 --from=builder /tmp/usr/share/postgresql/16/extension/vectors* /usr/pgsql-16/share/extension/

# Numeric User ID for Default Postgres User
USER 26

COPY ./apps/cdpgvector/pgvectors.sql /docker-entrypoint-initdb.d/
