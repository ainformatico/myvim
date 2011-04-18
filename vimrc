call pathogen#runtime_append_all_bundles() " pathogen start
call pathogen#helptags() " the pathogen call search the vim plugins on bundles
syntax enable " enables syntax highlight
syntax on " enables syntax highlight
colorscheme darkblue " colorscheme
filetype plugin on " enable plugins
set autochdir  " always switch to the current file directory
set number " line numbers
set hlsearch " highlight search
set incsearch " show search matches while typing
set ignorecase " case unsensitive search
set nocompatible " remove vi backwards compatibility
set ruler " show line position
set autoindent " code autoindent
set cindent " advanced indent
set smartindent " advanced indent
set history=300 " history length
set showcmd " show mode
set list " show hidden chars
set listchars=tab:^T,eol:¬ " hidden chars representations
set backup " backup files
set backupdir=/tmp,. " backup files
set directory=/tmp,. " swap files
set backspace=indent,eol,start
set tabstop=2 " tab with
set shiftwidth=2 " tabs
set softtabstop=2 " tabs
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set expandtab " don't use real tabs
set showmatch " show matching elements
set foldenable " enable folding
set mouse=a " enable mouse
set clipboard=unnamed " advanced clipboard
set cursorline " highlight current line
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set laststatus=2 " always show status line
set smartcase " if there are caps, go case-sensitive
set omnifunc=on " autocomplete function
set completeopt=menu,preview " autocomplete function
" highlight spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd BufWinEnter * match ExtraWhitespace /^\t*\zs \+\|\s$/
autocmd BufWinLeave * call clearmatches()
" gui options
if has("gui_running")
  set lines=999 columns=999 " Maximize gvim window.
  set guifont=Monospace\ 9 " gui font
endif
" maps
" paste from OS
map <F12> "+gP
map <F9> "+y
map <F3> :bp<RETURN>
map <F4> :bn<RETURN>