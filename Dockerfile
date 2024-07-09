FROM alpine:3

ARG VERSION
ENV VERSION=${VERSION}

RUN apk add --update --no-cache \
    openjdk11-jre-headless tini

#No downloadable example config since 0.2.10
RUN mkdir -p /jmb/config
ADD --chmod=644 https://github.com/jagrosh/MusicBot/releases/download/$VERSION/JMusicBot-$VERSION.jar /jmb/JMusicBot.jar
ADD --chmod=644 https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt /jmb/config/config.txt

COPY --chmod=755 ./docker-entrypoint.sh /jmb

VOLUME /jmb/config

RUN addgroup -S appgroup -g 10001 && \
    adduser -S appuser -G appgroup -u 10000

USER appuser

ENTRYPOINT ["/sbin/tini", "--", "/jmb/docker-entrypoint.sh"]
