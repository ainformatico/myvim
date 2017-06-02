Myvim
===========================

My vim configuration file, snippets and plugins.

Important
-----------
I'm using Vim 8+ so expect my configuration to *not* work on older versions of Vim.

Installation script
--------------------------
Clone `myvim` to `~/.vim`:

    $ git clone git://github.com/ainformatico/myvim ~/.vim

Then `cd` and execute the installation script:

    $ cd ~/.vim

    $ ./install.sh

*NOTE*: you can easily hack the installation script to install wherever you want.

This script will:

1. Fetch submodules
2. Backup your old `vimrc` to `/tmp`, if exists
3. Create a symbolic link to the new `vimrc`
4. Backup your old snippets to `/tmp`, if needed
5. Create a symbolic link for each new snippet

Manual Installation
--------------------------

1. Clone repo and create a symbolic link to `vimrc` file
  1. `$ git clone https://github.com/ainformatico/myvim.git ~/.vim/`
  2. `$ ln -s ~/.vim/vimrc ~/.vimrc`
2. Switch to the `~/.vim` directory, and fetch submodules
  1. `$ cd ~/.vim`
  2. `$ git submodule init`
  3. `$ git submodule update`

Update repo and submodules
--------------------------

`$ ./update.sh`

1. Pull changes from main repo, myvim
2. Pull changes from each submodule

How To install new bundles (vim plugins)
---------------------------------------------

1. `$ cd ~/.vim`
2. `$ mkdir ~/.vim/bundle`
2. `$ cd ~/.vim/bundle`
3. `$ git submodule add {plugin_uri}`
2. `$ cd ~/.vim`
4. `$ git add .`
5. `$ git commit -m "ADD {plugin_name}"`

Included plugins
--------------------------

* vim-pathogen <https://github.com/tpope/vim-pathogen>
* vim-surround <https://github.com/tpope/vim-surround>
* snipmate.vim <https://github.com/msanders/snipmate.vim>
* tabular <https://github.com/godlygeek/tabular>
* nerdtree <https://github.com/scrooloose/nerdtree>
* nerdcommenter <https://github.com/scrooloose/nerdcommenter>
* matchit.zip <https://github.com/vim-scripts/matchit.zip>
* delimitMate <https://github.com/Raimondi/delimitMate>
* closetag.vim <https://github.com/vim-scripts/closetag.vim>
* vim-fugitive <https://github.com/tpope/vim-fugitive>
* vim-repeat <https://github.com/tpope/vim-repeat>
* vim-colors-solarized <https://github.com/altercation/vim-colors-solarized>
* vim-bundler <https://github.com/tpope/vim-bundler>
* vim-rails <https://github.com/tpope/vim-rails>
* vim-rake <https://github.com/tpope/vim-rake>
* vim-gitgutter <https://github.com/airblade/vim-gitgutter>
* vim-signature <https://github.com/kshenoy/vim-signature>
* vim-coffee-script <https://github.com/kchmck/vim-coffee-script>
* vim-rbenv <https://github.com/tpope/vim-rbenv>
* denite.nvim <https://github.com/Shougo/denite.nvim>
* vimproc.vim <https://github.com/Shougo/vimproc.vim>
* gitv <https://github.com/gregsexton/gitv>
* ale <https://github.com/w0rp/ale>
* neocomplete <https://github.com/Shougo/neocomplete.vim>
* neosnippet <https://github.com/Shougo/neosnippet.vim>
* vim-easymotion <https://github.com/Lokaltog/vim-easymotion>
* vim-haml <https://github.com/tpope/vim-haml>
* vim-jade <https://github.com/digitaltoad/vim-jade>
* vim-endwise <https://github.com/tpope/vim-endwise>
* CamelCaseMotion <https://github.com/bkad/CamelCaseMotion>
* vim-textobj-user <https://github.com/kana/vim-textobj-user>
* vim-textobj-rubyblock <https://github.com/nelstrom/vim-textobj-rubyblock>
* vim-multiple-cursors <https://github.com/terryma/vim-multiple-cursors>
* vim-notes <https://github.com/xolox/vim-notes>
* vim-dispatch <https://github.com/tpope/vim-dispatch>
* vim-jsx <https://github.com/mxw/vim-jsx>
