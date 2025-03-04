FROM docker.io/library/alpine:3.21
LABEL maintainer "gh@kdy.ch"

COPY ./docker-entrypoint.sh /entrypoint.sh

RUN addgroup -S icecast && \
    adduser -S icecast && \
    apk add --no-cache icecast mailcap && \
    chmod +x /entrypoint.sh && \
    mkdir -p /var/log/icecast && \
    chown icecast:icecast /var/log/icecast

EXPOSE 8000
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["icecast", "-c", "/etc/icecast.xml"]
