FROM ubuntu:20.10

ENV JMB_VERSION 0.2.9

RUN apt-get update && \
    apt-get install -y \
    openjdk-11-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /jmb

ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION-Linux.jar /jmb/JMusicBot.jar
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/config.txt /jmb/config/config.txt

VOLUME /jmb/config

CMD cd /jmb/config && java -jar -Dnogui=true /jmb/JMusicBot.jar
