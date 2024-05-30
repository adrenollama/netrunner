#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

###  Custom repositories

# Add third parties or custom repositories for additional software.
wget https://download.opensuse.org/repositories/home:paul4us/Fedora_40/home:paul4us.repo -P /etc/yum.repos.d/

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install distrobox
rpm-ostree install libvirt
rpm-ostree install libvirt-client
rpm-ostree install libvirt-nss
rpm-ostree install virt-manager
rpm-ostree install fastfetch
rpm-ostree install btop
rpm-ostree install kvantum
rpm-ostree install mangohud
rpm-ostree install gamescope

# this would install a package from rpmfusion
# rpm-ostree install vlc
rpm-ostree install steam

# this would install a package from a custom repository
rpm-ostree install klassy

# this would install a package from a RPM downloaded from the web
#rpm-ostree install https://github.com/ilya-zlobintsev/LACT/releases/download/v0.5.4/lact-0.5.4-0.x86_64.fedora-40.rpm

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable lactd
