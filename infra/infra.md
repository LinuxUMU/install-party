# infra

## Hardware

 - minipc con eth y wifi (Debian)
 - switch

## Red

```
internet ----------+  +------
                   |  |
   +--------+   +--------+
   | minipc |---| switch |---- clientes
   +--------+   +--------+
        v             |
        v             +------
     clientes

```

 - minipc
   - eth
     - vlan10: backbone
     - vlan1: clientes
   - wlan: clientes (ssid: linux install party)
   - br0
     - vlan20
     - wlan
   - net.ipv4.ip_forward=1
   - iptables -t nat -A POSTROUTING ! -d 10.67.67.0/24 -o vlan10 -j MASQUERADE
 - switch
   - p1: trunk 1, 10
   - p2: access 10 -> internet
   - \*: access 1


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
| /automation | /srv/install-party/automation |
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
 - cmake
 - gdb
 - vim neovim geany
 - git
 - openjdk-21-jdk
 - okteta
 - texlive-full
 - r-base
 - octave

 - maude
 - qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager libvirt-daemon-driver-lxc
 - wireshark
 - nmap socat arping tshark tcpdump
 - bison flex
 - python3-numpy python3-scipy

#### Externo

 - Eduroam
 - Visual Studio Code
 - sagemath sagetex
 - Rstudio
 - MARS
 - eclipse
 - Oracle VirtualBox
 - docker
 - Oracle SQL Developer

