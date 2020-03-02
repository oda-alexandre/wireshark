# WIRESHARK

<img src="https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904490/wireshark-logo-png-1.png" width="200" height="200"/>


## INDEX

- [WIRESHARK](#wireshark)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [FIRST UPDATE](#first-update)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)


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
docker run -d --name wireshark -v ${HOME}:/home/wireshark -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${XAUTHORITY}:/xauthority:ro -e XAUTHORITY='/xauthority' -e DISPLAY --network host --cap-add=NET_ADMIN alexandreoda/wireshark
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/wireshark/blob/master/LICENSE)
