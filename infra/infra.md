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

| path        | destino |
|-------------|---------|
| /fedora     | https://mirrors.fedoraproject.org/ |
| /debian     | https://deb.debian.org/debian/ |
| /ubuntu     | https://packages.ubuntu.com/ |
| /mint       | https://packages.linuxmint.com/ |
| /isos       | /srv/install-party/isos |
| /scripts    | /srv/install-party/scripts |
| /auto       | /srv/install-party/auto |
| /software   | /srv/install-party/software |

## Setup

 - Debian preseed y script
 - Ubuntu autoinstall y script
 - Mint script
 - Fedora kickstart y script

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
 - eclipse

 - Oracle Database

