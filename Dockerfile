FROM alpine:edge

LABEL authors https://www.oda-alexandre.com/

ENV USER wireshark
ENV GROUP wireshark
ENV HOME /home/wireshark
ENV SHELL /bin/bash
ENV LOCALES fr_FR.UTF-8

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apk --update --no-cache add wireshark

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
  locale-gen ${LOCALES}

RUN echo -e '\033[36;1m ******* ADD USER & ADD USER TO THE GROUP ******** \033[0m'; \
  addgroup ${USER}; \
  adduser \
  --gecos "" \
  --system \
  --home ${HOME} \
  --disabled-password \
  --ingroup ${GROUP} \
  --shell ${SHELL} \
  ${USER}

RUN echo -e '\033[36;1m ******* CONFIG DUMPCAP ******** \033[0m'; \
  chown root:${USER} /usr/bin/dumpcap; \
  setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD wireshark \