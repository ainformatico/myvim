#!/usr/bin/env bash

# var definitions
SNIPMATEDIR=~/.vim/bundle/snipmate/snippets/
CUSTOMSNIPPETS=~/.vim/my-snippets/
TMPDIR=/tmp/
LOCALVIMRCFILE=~/.vimrc
CUSTOMVIMRCFILE=~/.vim/vimrc

# install script
# init git submodules
# create symlinks and replace snippets

# init git submodules
git submodule init
git submodule update

# create symlinks
if [ -f $LOCALVIMRCFILE ]
then
  mv $LOCALVIMRCFILE $TMPDIR
  echo "$LOCALVIMRCFILE moved to $TMPDIR"
fi
ln -s $CUSTOMVIMRCFILE $LOCALVIMRCFILE
echo "Created symlink to $LOCALVIMRCFILE"

# replace snippets
for file in `ls $CUSTOMSNIPPETS`
do
  if [ -f $SNIPMATEDIR$file ]
  then
    # move existent snippets to $TMPDIR dir
    mv $SNIPMATEDIR$file $TMPDIR
    echo "Moved $SNIPMATEDIR$file to $TMPDIR$file"
  fi
  # create symlinks to new snippets
  ln -s $CUSTOMSNIPPETS$file $SNIPMATEDIR$file
  echo "Created synlink to $SNIPMATEDIR$file"
done

echo "\nDone.\n"
