#!/bin/bash

# Make Common Dirs
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config
mkdir -p $HOME/OSS/repos
mkdir -p $HOME/OSS/builds
mkdir -p $HOME/OSS/builds/gcc-13
mkdir -p $HOME/OSS/builds/cmake-3.28
mkdir -p $HOME/OSS/builds/neovim-0.9

# Configure Git
git config --global init.defaultBranch main
git config --global user.email "grassoa159@gmail.com"
git config --global user.name "tony942316"
