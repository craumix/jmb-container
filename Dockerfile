FROM ubuntu:20.10

ENV JMB_VERSION 0.3.3

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    curl \
    openjdk-11-jdk-headless

#No downloadable example config since 0.2.10
RUN mkdir -p /jmb/config && \
    curl -L https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION.jar -o /jmb/JMusicBot.jar && \
    curl -L https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt -o /jmb/config/config.txt

RUN apt-get clean && \ 
    rm -rf \ 
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

COPY ./run.bash /jmb

RUN chmod +x /jmb/run.bash

VOLUME /jmb/config

ENTRYPOINT ["/jmb/run.bash"]
