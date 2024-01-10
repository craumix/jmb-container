# JMusicBot-Container
[![Docker Pulls](https://img.shields.io/docker/pulls/craumix/jmusicbot)](https://hub.docker.com/r/craumix/jmusicbot)
[![Docker Version](https://img.shields.io/docker/v/craumix/jmusicbot)](https://hub.docker.com/r/craumix/jmusicbot)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/craumix/jmusicbot/latest)](https://hub.docker.com/r/craumix/jmusicbot)

A containerized version of the [JMusicBot by jagrosh](https://github.com/jagrosh/MusicBot).


# How to use:

1.) Creat a config.txt file using a text editor in your desired location.

```
sudo nano config.txt
```
2.) Get the path to the folder containing config.txt using ```pwd``` command 

3.) Create a docker compose file using any text editor

```sudo nano docker-compose.yaml```

4.) Use the following syntax:

```yaml
version: '2.2'

services:
  jmusicbot:
    image: craumix/jmusicbot
    container_name: jmusicbot
    restart: unless-stopped
    volumes:
     - /path/to/your/location:/jmb/config
```

Ensure that you replace /path/to/your/location with the actual path obtained in step 2. 


for example 

```yaml
version: '2.2'

services:
  jmusicbot:
    image: craumix/jmusicbot
    container_name: jmusicbot
    restart: unless-stopped
    volumes:
     - /home/user/docker/musicbot:/jmb/config
```


 
5.) This structure will help users set up and organize the necessary files for the JMusicBot configuration in a clear and concise manner.

```
home
   |-- user
   |   |-- docker
   |   |   |-- musicbot
   |   |   |   |-- config.txt
   |   |   |   |-- docker-compose.yaml

```
