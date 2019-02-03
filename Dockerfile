FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
sudo \
locales \
apt-transport-https \
ca-certificates \
gnupg \
dirmngr \
wget

# SELECTION LANGUE FRANCAISE
ENV LANG fr_FR.UTF-8
RUN echo fr_FR.UTF-8 UTF-8 > /etc/locale.gen && locale-gen

# MODIFICATION DU FICHIER /etc/apt/sources.list AVEC LES REPOS kali-rolling contrib non-free
RUN echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

# INSTALLATION DE L'APPLICATION
RUN apt-get update && yes | apt-get install --no-install-recommends -y \
wireshark

# AJOUT UTILISATEUR ET AJOUT DE L'UTILISATEUR AU GROUPE WIRESHARK
RUN useradd -d /home/wireshark -m wireshark -g wireshark && \
passwd -d wireshark && \
adduser wireshark sudo

# AJOUT UTILISATEUR AU GROUPE WIRESHARK


# SELECTION UTILISATEUR
USER wireshark

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/wireshark

# NETTOYAGE
RUN sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD wireshark
