# WIRESHARK

<img src="http://www.packetiq.com/Images/Powered%20by%20WS%20Oval.png/>


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequisites](#PREREQUISITESITES)
- [Install](#INSTALL)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/wireshark/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/wireshark/commits/master)



## INTRODUCTION

Docker image of :

- [wireshark](https://www.wireshark.org)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/wireshark/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/wireshark)


## PREREQUISITES

Use [docker](https://www.docker.com)


## INSTALL

```
docker run -d --name wireshark -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${HOME}:/home/wireshark -v /etc/localtime:/etc/localtime:ro --network host --cap-add=NET_ADMIN -e DISPLAY alexandreoda/wireshark
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/wireshark/blob/master/LICENSE)
