FROM docker.io/library/alpine:3.20 as builder

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL
ARG CRUNCHYVERSION=ubi8

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
    curl --fail -o pgvectors.deb -sSL https://github.com/tensorchord/pgvecto.rs/releases/download/v${VERSION}/vectors-pg${CHANNEL}_${VERSION}_${ARCH}.deb \
    && \
    alien -r /tmp/pgvectors.deb \
    && \
    rm -f /tmp/pgvectors.deb \
    && \
    rpm2cpio /tmp/*.rpm | cpio -idmv

RUN \
    case "${VERSION}" in \
        '15') export CRUNCHYVERSION='ubi8-15.7-1' ;; \
        '16') export CRUNCHYVERSION='ubi8-16.3-1' ;; \
    esac

FROM registry.developers.crunchydata.com/crunchydata/crunchy-postgres:${CRUNCHYVERSION}

COPY --chown=root:root --chmod=755 --from=builder /tmp/usr/lib/postgresql/${CHANNEL}/lib/vectors.so /usr/pgsql-${CHANNEL}/lib/
COPY --chown=root:root --chmod=755 --from=builder /tmp/usr/share/postgresql/${CHANNEL}/extension/vectors* /usr/pgsql-${CHANNEL}/share/extension/

# Numeric User ID for Default Postgres User
USER 26

COPY ./apps/cdpgvector/pgvectors.sql /docker-entrypoint-initdb.d/
