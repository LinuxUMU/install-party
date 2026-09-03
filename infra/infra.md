# infra

## Hardware

 - minipc con Debian y wifi
 - switch

## Software

 - nginx
    - servidor ISOs, debian preseed y scripts de setup
    - reverse proxy cache de repos
 - dhcpd con red, dns, netboot, preseed
 - tftpd con instaladores
 - dnsd con install-party.local
 - apt-cacher-ng?

| path | destino |
|------|---------|
| /fedora | https://mirrors.fedoraproject.org/ |
| /debian | https://deb.debian.org/debian/ |
| /ubuntu | https://packages.ubuntu.com/ |

## Setup

 - Debian preseed y script
 - Ubuntu script
 - Mint script
 - Fedora script

### Paquetes

#### Debian

 - firefox
 - libreoffice
 - build-essential
 - vim neovim geany
 - git
 - openjdk-21-jdk
 - okteta
 - texlive-full
 - r-base
 - octave

 - maude
 - qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
 - wireshark
 - bison flex

#### Externo

 - Eduroam
 - codium
 - sagemath sagetex
 - Rstudio
 - MARS

 - Oracle Database

