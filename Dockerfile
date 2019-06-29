# IMAGE TO USE
FROM debian:stretch-slim

# MAINTAINER
MAINTAINER http://www.oda-alexandre.com/

# VARIABLES
ENV USER wireshark
ENV LANG fr_FR.UTF-8

# INSTALL PACKAGES
RUN apt-get update && apt-get install --no-install-recommends -y \
sudo \
locales \
apt-transport-https \
ca-certificates \
gnupg \
dirmngr \
wget && \

# CHANGE LOCALES
echo ${LANG} > /etc/locale.gen && locale-gen && \

# CHANGE OF FILE /etc/apt/sources.list WITH REPOS kali-rolling contrib non-free
echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add && \

# INSTALL APP
apt-get update && yes | apt-get install --no-install-recommends -y \
wireshark && \

# ADD USER AND ADD OF USER TO THE GROUP WIRESHARK
useradd -d /home/${USER} -m ${USER} -g wireshark && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECT USER
USER ${USER}

# SELECT WORKING SPACE
WORKDIR /home/${USER}

# CLEANING
RUN sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# START THE CONTAINER
CMD wireshark \
