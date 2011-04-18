#!/usr/bin/env bash

# install script
# init git submodules
# create symlinks and replace snippets

# init git submodules
git submodule init
git submodule update

# create symlinks
ln -s ~/.vim/vimrc ~/.vimrc

# replace snippets
cp -a my-snippets/* ~/.vim/bundle/snipmate/snippets/

echo "\nDone.\n"
