#!/bin/bash

# Ensure Proper PATH
export PATH=$HOME/.local/bin/:$PATH

# Clone Nvim
cd $HOME
git clone https://github.com/neovim/neovim.git $HOME/OSS/repos/neovim

# Set Release Branch
cd $HOME/OSS/repos/neovim
git switch release-0.9

# Build Nvim
cd $HOME/OSS/repos/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$HOME/OSS/builds/neovim-0.9

# Install Nvim
cd $HOME/OSS/repos/neovim
make install

# Create Symlink
cd $HOME/.local/bin
ln -s $HOME/OSS/builds/neovim-0.9/bin/nvim nvim

# Pull Custom Config
cd $HOME
git clone https://github.com/tony942316/neovim-config.git $HOME/.config/nvim
