#!/bin/bash

cd $HOME

./get-depends.sh
./set-filesystem.sh
./build-gcc.sh
./build-CMake.sh
./build-neovim.sh

cd $HOME

echo =============DONE===============
