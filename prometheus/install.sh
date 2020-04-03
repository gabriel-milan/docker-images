#!/bin/bash
# Update APT
apt update -y

# Install APT dependencies
apt install -y git dpkg-dev g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev gfortran libssl-dev libpcre3-dev libglew1.5-dev libftgl-dev libldap2-dev python-dev python3-dev libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libboost-all-dev vim screen htop python3-pip coreutils python python3 git subversion python-numpy python3-numpy python-scipy python3-scipy python-matplotlib python3-matplotlib ipython python-pandas python3-pandas python-sympy python3-sympy python-nose python3-nose

# Install CMAKE 3.17.0
apt install -y wget
wget https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0-Linux-x86_64.sh -P /usr/
chmod 755 /usr/cmake-3.17.0-Linux-x86_64.sh
cd /usr && ./cmake-3.17.0-Linux-x86_64.sh --skip-license

# Install Gaugi
pip3 install Gaugi

# Install custom ROOT
cd ~ && mkdir .bin && cd .bin && git clone https://gitlab.cern.ch/jodafons/root.git
cd ~/.bin/root && git checkout v6-16-00
cd ~/.bin/root/build && cmake --Dpython_version=3 ..
cd ~/.bin/root/build && make -j8
export ROOT_DIR=/root/.bin/root
source /root/.bin/root/build/bin/thisroot.sh && echo 'source /root/.bin/root/build/bin/thisroot.sh' >> ~/.bashrc
echo 'export ROOT_DIR=/root/.bin/root' >> ~/.bashrc

# Install Prometheus
cd ~/.bin && git clone https://github.com/jodafons/prometheus.git
cd ~/.bin/prometheus && source setup_module.sh
cd ~/.bin/prometheus && source setup_module.sh --head
cd ~/.bin/prometheus && mkdir build
cd ~/.bin/prometheus/build && cmake ..
cd ~/.bin/prometheus/build && make
source /root/.bin/prometheus/setup.sh
