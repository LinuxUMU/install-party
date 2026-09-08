url --mirrorlist=https://install-party.local/fedora/metalink?repo=fedora-$releasever&arch=$basearch
rootpw --lock

lang es_ES.UTF-8
keyboard --vckeymap=es --xlayouts=es
timezone Europe/Madrid --utc

xconfig --startxonboot

%packages
@kde-desktop-environment
@firefox
@libreoffice
@kde-office
@c-development
@java-development
@virtualization
gdb
vim
neovim
geany
git
okteta
texlive-scheme-full
octave
wireshark
nmap
socat
arptools
tcpdump
bison
flex
python3-numpy
python3-scipy
%end

%post --erroronfail --log=/var/log/kickstart_post.log
#!/bin/bash
curl http://install-party.local/scripts/fedora-45.sh | bash
%end

