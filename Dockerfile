FROM alpine:3
ARG JMB_VERSION=0.4.1
ENV JMB_VERSION=${JMB_VERSION}

RUN apk add --update --no-cache \
    openjdk11-jre-headless

#No downloadable example config since 0.2.10
RUN mkdir -p /jmb/config
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION.jar /jmb/JMusicBot.jar
ADD https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt /jmb/config/config.txt

COPY --chmod=755 ./docker-entrypoint.sh /jmb

VOLUME /jmb/config

ENTRYPOINT ["/jmb/docker-entrypoint.sh"]
