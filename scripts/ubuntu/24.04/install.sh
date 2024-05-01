#!/bin/bash

# Get Dependencies
sudo apt install -y gcc g++ gcc-14 g++-14 git make ninja-build clang zip unzip \
    curl tree ripgrep python3-venv npm cmake neovim clangd clang-tools

mkdir $HOME/.config

git config --global init.defaultBranch main
git config --global user.email "grassoa159@gmail.com"
git config --global user.name "tony942316"

git clone https://github.com/tony942316/neovim-config.git $HOME/.config/nvim

cd $HOME/.config/nvim
git remote set-url origin git@github.com:tony942316/neovim-config.git

