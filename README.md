Myvim
===========================

My vim configuration file, snippets and plugins.

Installation script
--------------------------

`$ sh install.sh`

1. Fetch submodules
2. Backup your old `vimrc` to `/tmp`, if exists
3. Create a symbolic link to the new `vimrc`
4. Backup your old snippets to `/tmp`, if needed
5. Create a symbolic link for each new snippet

Manual Installation
--------------------------

1. Clone repo and create a symbolic link to `vimrc` file
  1. `$ git clone https://github.com/elchacaldelutero/myvim.git ~/.vim/`
  2. `$ ln -s ~/.vim/vimrc ~/.vimrc`
2. Switch to the `~/.vim` directory, and fetch submodules
  1. `$ cd ~/.vim`
  2. `$ git submodule init`
  3. `$ git submodule update`

How To install new bundles (vim plugins)
---------------------------------------------

1. `$ cd ~/.vim`
2. `$ mkdir ~/.vim/bundle`
3. `$ git submodule add {plugin_uri}`
4. `$ git add .`
5. `$ git commit -m "ADD {plugin_name}"`

Included plugins
--------------------------
* vim-pathogen <https://github.com/tpope/vim-pathogen>
* vim-surround <https://github.com/tpope/vim-surround>
* snipmate.vim <https://github.com/msanders/snipmate.vim>
* taglist.vim <https://github.com/vim-scripts/taglist.vim>
* tabular <https://github.com/godlygeek/tabular>
* nerdtree <https://github.com/scrooloose/nerdtree>
* nerdcommenter <https://github.com/scrooloose/nerdcommenter>
* matchit.zip <https://github.com/vim-scripts/matchit.zip>
* delimitMate <https://github.com/Raimondi/delimitMate>
* closetag.vim <https://github.com/vim-scripts/closetag.vim>
* vim-fugitive <https://github.com/tpope/vim-fugitive>

**NOTE**: *pathogen needs to be updated manually*
