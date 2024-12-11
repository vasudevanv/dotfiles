#!/bin/bash

# GPU repos
sudo zypper addrepo --refresh \
    https://download.nvidia.com/opensuse/tumbleweed NVIDIA

sudo zypper install \
    git gcc gfortran cmake automake gdbm-devel \
    libyaml-devel ncurses-devel readline-devel \
    zlib-devel libopenssl-devel readline-devel \
    emacs vim texlive texstudio

# Anaconda

# Setup rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd .rbenv/
src/configure && make -C src
echo '' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
reload
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install 3.0.1
rbenv local 3.0.1
rbenv rehash
gem install bundler
