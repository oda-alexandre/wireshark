FROM alpine:edge

LABEL authors https://www.oda-alexandre.com/

ENV USER wireshark
ENV HOME /home/${USER}
ENV SHELL /bin/bash

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apk --no-cache add \
  sudo \
  wireshark

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m'; \
  addgroup \
  -S \
  -g 1000 \
  ${USER}; \
  adduser \
  --gecos "" \
  --home ${HOME} \
  --disabled-password \
  --shell ${SHELL} \
  --system \
  --uid 1000 \
  ${USER}

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD wireshark \