FROM java:8

WORKDIR /

ADD https://github.com/jagrosh/MusicBot/releases/download/0.2.2/JMusicBot-0.2.2-Linux.jar JMusicBot.jar
ADD https://github.com/jagrosh/MusicBot/releases/download/0.2.2/config.txt cfg/config.txt

VOLUME /cfg

CMD cd /cfg && java -jar -Dnogui=true /JMusicBot.jar