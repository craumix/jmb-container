#!/bin/sh

echo "Starting JMusicBot by Jagrosh https://github.com/jagrosh/MusicBot"
echo "Containerized by Craumix https://github.com/Craumix/jmb-container"
echo "Version: $VERSION"

cd /jmb/config
java -jar -Dnogui=true /jmb/JMusicBot.jar
