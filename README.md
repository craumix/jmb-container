# jmb-container
A containerized version of the [JMusicBot by jagrosh](https://github.com/jagrosh/MusicBot)

It uses the [java:8 Baseimage](https://hub.docker.com/_/openjdk), the image has a volume on **/cfg**.
The compose file uses **./config:/cfg**.
