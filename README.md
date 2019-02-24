# WIRESHARK

![wireshark](https://raw.githubusercontent.com/oda-alexandre/wireshark/master/img/logo-wireshark.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/wireshark/master/img/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BUILD DOCKER

[![wireshark docker build](https://img.shields.io/docker/build/alexandreoda/wireshark.svg)](https://hub.docker.com/r/alexandreoda/wireshark)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [wireshark](https://www.wireshark.org) pour [docker](https://www.docker.com), mis à jour automatiquement dans le [docker hub](https://hub.docker.com/r/alexandreoda/wireshark/) public.


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name wireshark -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${HOME}:/home/wireshark -v /etc/localtime:/etc/localtime:ro --network host --cap-add=NET_ADMIN -e DISPLAY alexandreoda/wireshark
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/wireshark/blob/master/LICENSE)
