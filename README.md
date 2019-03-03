# WIRESHARK

[![dockeri.co](https://dockeri.co/image/alexandreoda/wireshark)](https://hub.docker.com/r/alexandreoda/wireshark)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/wireshark.svg)](https://microbadger.com/images/alexandreoda/wireshark)
[![size](https://images.microbadger.com/badges/image/alexandreoda/wireshark.svg)](https://microbadger.com/images/alexandreoda/wireshark")
[![build](https://img.shields.io/docker/build/alexandreoda/wireshark.svg)](https://hub.docker.com/r/alexandreoda/wireshark)
[![automated](https://img.shields.io/docker/automated/alexandreoda/wireshark.svg)](https://hub.docker.com/r/alexandreoda/wireshark)



## INTRODUCTION

Ce repository contient le fichier Dockerfile de

- [wireshark](https://www.wireshark.org)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/wireshark)


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name wireshark -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${HOME}:/home/wireshark -v /etc/localtime:/etc/localtime:ro --network host --cap-add=NET_ADMIN -e DISPLAY alexandreoda/wireshark
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/wireshark/blob/master/LICENSE)
