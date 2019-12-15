FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER wireshark
ENV LOCALES fr_FR.UTF-8

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apt-get update && apt-get install --no-install-recommends -y \
  locales \
  apt-transport-https \
  ca-certificates \
  gnupg \
  dirmngr \
  wget

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
  locale-gen ${LOCALES}

RUN echo -e '\033[36;1m ******* ADD contrib non-free IN sources.list ******** \033[0m'; \
  echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list; \
  echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list; \
  wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m'; \
  apt-get update && yes | apt-get install --no-install-recommends -y \
  wireshark

RUN echo -e '\033[36;1m ******* ADD USER & ADD USER TO THE GROUP WIRESHARK ******** \033[0m'; \
  useradd -d /home/${USER} -m ${USER} -g wireshark; \
  passwd -d ${USER}

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR /home/${USER}

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m'; \
  sudo apt-get --purge autoremove -y \
  wget; \
  sudo apt-get autoclean -y; \
  sudo rm /etc/apt/sources.list; \
  sudo rm -rf /var/cache/apt/archives/*; \
  sudo rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD wireshark \