FROM ubuntu:19.04

ENV JMB_VERSION 0.2.4

RUN apt-get update && \
    apt-get install -y \
    openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /jmb

ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION-Linux.jar /jmb/JMusicBot.jar
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/config.txt /jmb/config/config.txt

VOLUME /jmb/config

CMD cd /jmb/config && java -jar -Dnogui=true /jmb/JMusicBot.jar
