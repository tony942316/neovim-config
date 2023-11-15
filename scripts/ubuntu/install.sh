#!/bin/bash

# PERSONAL INSTALL SCRIPT DO NOT USE

function install_dependencies
{
    # Update System
    sudo apt update -y
    sudo apt upgrade -y

    # Get Dependencies
    sudo apt install -y gcc git make zip unzip curl tree bzip2 libssl-dev \
        ninja-build gettext flex ripgrep python3.10-venv npm

    # Update Node To Latest Stable
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n stable
}

function setup_filesystem
{
    # Make Common Dirs
    mkdir -p $HOME/.local/bin
    mkdir -p $HOME/.config
    mkdir -p $HOME/OSS/repos
    mkdir -p $HOME/OSS/builds
    mkdir -p $HOME/OSS/builds/gcc-13
    mkdir -p $HOME/OSS/builds/cmake-3.28
    mkdir -p $HOME/OSS/builds/neovim-0.9
    mkdir -p $HOME/OSS/builds/llvm-17

    # Configure Git
    git config --global init.defaultBranch main
    git config --global user.email "grassoa159@gmail.com"
    git config --global user.name "tony942316"
}

function build_gcc
{
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
}

function build_cmake
{
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
}

function build_llvm
{
    # Ensure Proper PATH
    export PATH=$HOME/.local/bin/:$PATH

    # CLone llvm
    cd $HOME
    git clone https://github.com/llvm/llvm-project $HOME/OSS/repos/llvm

    # Set Release Branch
    cd $HOME/OSS/repos/llvm-project
    git switch release/17.x

    # Configure llvm
    cd $HOME/OSS/repos/llvm-project
    mkdir build
    cmake -S llvm -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/home/anthony/OSS/builds/llvm-17 \
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"

    # Build llvm
    cd $HOME/OSS/repos/llvm-project/build
    make -j4

    # Install llvm
    cd $HOME/OSS/repos/llvm-project/build
    make install

    # Create Symlink
    cd $HOME/.local/bin
    ln -s $HOME/OSS/builds/llvm-17/bin/clang++ clang++-17
}

function build_neovim
{
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
    make CMAKE_BUILD_TYPE=RelWithDebInfo \
        CMAKE_INSTALL_PREFIX=$HOME/OSS/builds/neovim-0.9

    # Install Nvim
    cd $HOME/OSS/repos/neovim
    make install

    # Create Symlink
    cd $HOME/.local/bin
    ln -s $HOME/OSS/builds/neovim-0.9/bin/nvim nvim

    # Pull Custom Config
    cd $HOME
    git clone https://github.com/tony942316/neovim-config.git $HOME/.config/nvim
}

function init
{
    cd $HOME
    install_dependencies

    cd $HOME
    setup_filesystem

    cd $HOME
    build_gcc

    cd $HOME
    build_cmake

    cd $HOME
    build_llvm

    cd $HOME
    build_neovim
}

cd $HOME
init

echo "Restart System!"

cd $HOME

echo =============DONE===============
