# WIRESHARK

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904490/wireshark-logo-png-1.png)

## INDEX

- [WIRESHARK](#wireshark)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/wireshark/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/wireshark/commits/master)

## INTRODUCTION

Docker image of :

- [wireshark](https://www.wireshark.org)

Continuous integration on :

- [gitlab pipelines](https://gitlab.com/oda-alexandre/wireshark/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/wireshark)

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

### DOCKER RUN

```\
docker run -d --name wireshark -v ${HOME}:/home/wireshark v ${HOME}:/home/wireshark -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${XAUTHORITY}:/xauthority:ro -e XAUTHORITY='/xauthority' -e DISPLAY --network host --cap-add=NET_ADMIN alexandreoda/wireshark
```

### DOCKER COMPOSE

```yml
version: "3.7"

services:
  wireshark:
    container_name: wireshark
    image: alexandreoda/wireshark
    restart: "no"
    network_mode: host
    privileged: false
    cap_add:
      - NET_ADMIN
    environment:
      - DISPLAY
      - XAUTHORITY='/xauthority'
    volumes:
      - "${HOME}:/home/wireshark"
      - "/tmp/.X11-unix/:/tmp/.X11-unix/"
      - "${XAUTHORITY}:/xauthority:ro"
      - "/etc/localtime:/etc/localtime:ro"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/wireshark/blob/master/LICENSE)
