#!/bin/bash

# Clone GCC
cd $HOME
git clone https://github.com/gcc-mirror/gcc.git $HOME/OSS/repos/gcc

# Set Release Branch
cd $HOME/OSS/repos/gcc
git switch releases/gcc-13

# Download GCC Dependencies
cd $HOME/OSS/repos/gcc
./contrib/download_prerequisites

# Configure GCC
cd $HOME/OSS/builds/gcc-13
$HOME/OSS/repos/gcc/configure --prefix=$HOME/OSS/builds/gcc-13 \
    --enable-languages=c,c++ --disable-multilib

# Build GCC
cd $HOME/OSS/builds/gcc-13
make -j4

# Install GCC
cd $HOME/OSS/builds/gcc-13
make install

# Create Symlink
cd $HOME/.local/bin
ln -s $HOME/OSS/builds/gcc-13/bin/g++ g++-13
