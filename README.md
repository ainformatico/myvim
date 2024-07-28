# My nvim configuration

My nvim configuration file, snippets and plugins.

## Important
Only tested on +v10.0.1 so expect this to *not* work on other versions.

## Installation script
Clone `myvim` to `~/.nvim`:

```bash
$ git clone git://github.com/ainformatico/myvim ~/.nvim
```

Create a symbolic link to `~/.config/nvim`:

```bash
$ ln -s ~/.nvim ~/.config/nvim
```

Open [packer](https://github.com/wbthomason/packer.nvim) config file:

```bash
nvim ~/.nvim/lua/ainformatico/packer.lua
```

Load the file:

```vim
:so
```

Run `:PackerSync`:

```vim
:PackerSync
```
