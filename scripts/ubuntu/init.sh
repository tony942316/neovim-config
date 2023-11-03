#!/bin/bash

cd $HOME
./get-depends.sh

cd $HOME
./set-filesystem.sh

cd $HOME
./build-gcc.sh

cd $HOME
./build-CMake.sh

cd $HOME
./build-neovim.sh

cd $HOME

echo =============DONE===============
