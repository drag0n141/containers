FROM docker.io/library/alpine:3.23 AS builder

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
    curl --fail -o vchord.deb -sSL https://github.com/tensorchord/VectorChord/releases/download/${VERSION}/postgresql-16-vchord_${VERSION}-1_${ARCH}.deb \
    && \
    alien -r /tmp/vchord.deb \
    && \
    rm -f /tmp/vchord.deb \
    && \
    rpm2cpio /tmp/*.rpm | cpio -idmv

FROM registry.developers.crunchydata.com/crunchydata/crunchy-postgres:ubi9-16.8-2513

COPY --chown=root:root --chmod=755 --from=builder /tmp/usr/lib/postgresql/16/lib/vchord.so /usr/pgsql-16/lib/
COPY --chown=root:root --chmod=755 --from=builder /tmp/usr/share/postgresql/16/extension/vchord* /usr/pgsql-16/share/extension/

# Numeric User ID for Default Postgres User
USER 26

COPY ./apps/cdpgvectorchord/pgvectors.sql /docker-entrypoint-initdb.d/
