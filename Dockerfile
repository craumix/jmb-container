FROM openjdk:11-jre-slim
LABEL maintainer="gian.klug@ict-scouts.ch"

# Labels.
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="gianklug/jmusicbot"
LABEL org.label-schema.description="jmusicbot docker container"
LABEL org.label-schema.url="https://github.com/jagrosh/MusicBot"
LABEL org.label-schema.vcs-url="https://github.com/gianklug/jmb-container"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -v ./config:/jmb/config -d gianklug/jmusicbot"




ENV JMB_VERSION 0.3.9

#No downloadable example config since 0.2.10
RUN mkdir -p /jmb/config
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION.jar /jmb/JMusicBot.jar
ADD https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt /jmb/config/config.txt

COPY ./docker-entrypoint.sh /jmb

RUN chmod +x /jmb/docker-entrypoint.sh

VOLUME /jmb/config

ENTRYPOINT ["/jmb/docker-entrypoint.sh"]
