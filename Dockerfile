FROM ubuntu:20.10

ENV JMB_VERSION 0.2.10

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    openjdk-11-jdk-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#No downloadable example config since 0.2.10
RUN mkdir -p /jmb/config && \
    curl -L https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION-Linux.jar -o /jmb/JMusicBot.jar && \
    curl -L https://github.com/jagrosh/MusicBot/releases/download/0.2.9/config.txt -o /jmb/config/config.txt

COPY ./run.bash /jmb

RUN chmod +x /jmb/run.bash

VOLUME /jmb/config

ENTRYPOINT ["/jmb/run.bash"]
