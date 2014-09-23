#!/bin/bash

echo -e "\nUpdating....\n"
# pull changes from main repo
git pull origin master
# pull changes from each submodules
git submodule foreach git pull origin master
cd bundle/vimproc.vim
make
cd -
echo -e "\nDone.\n"
