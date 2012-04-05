#!/bin/bash

echo "\nUpdating....\n"
# pull changes from main repo
git pull origin master
# pull changes from each submodules
git submodule foreach git pull origin master
echo "\nDone.\n"
