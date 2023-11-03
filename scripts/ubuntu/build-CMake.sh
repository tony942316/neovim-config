#!/bin/bash

# Clone CMake
cd $HOME
git clone https://github.com/Kitware/CMake.git $HOME/OSS/repos/CMake

# Set Release Branch
cd $HOME/OSS/repos/CMake
git switch release

# Bootstrap CMake
cd $HOME/OSS/builds/cmake-3.28
$HOME/OSS/repos/CMake/bootstrap

# Build CMake
cd $HOME/OSS/builds/cmake-3.28
make

# Create Symlink
cd $HOME/.local/bin
ln -s $HOME/OSS/builds/cmake-3.28/bin/cmake cmake
