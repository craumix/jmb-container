FROM alpine

ENV JMB_VERSION 0.2.8

RUN apk update && apk upgrade && \
    apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION-Linux.jar /jmb/JMusicBot.jar
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/config.txt /jmb/config/config.txt

VOLUME /jmb/config

CMD cd /jmb/config && java -jar -Dnogui=true /jmb/JMusicBot.jar
