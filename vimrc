runtime bundle/vim-pathogen/autoload/pathogen.vim " load pathogen from custom location
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
set smartindent " advanced indent
set history=2000 " history length
set showcmd " show mode
set list " show hidden chars
" hidden chars representation
if has('unix')
  set listchars=tab:^T,eol:¬
else
  set listchars=tab:^T,eol:$
endif
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
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%{fugitive#statusline()}
set cursorcolumn " show colum cursor
" terminal color for column cursor
hi CursorColumn ctermbg=4
set laststatus=2 " always show status line
set smartcase " if there are caps, go case-sensitive
set omnifunc=on " autocomplete function
set completeopt=menu,preview " autocomplete function
set wildmenu " command-line completion
set scrolloff=3 " lines before EOF
set virtualedit=block " allow virtual editing in Visual block mode
" gui options
if has("gui_running")
  colorscheme desert " colorscheme
  set showtabline=2 " Always show tab line
  "set lines=999 columns=999 " Maximize gvim window.
  if has('unix')
    set guifont=Monospace\ 9 " gui font
  endif
endif
" save and load folds
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
" closetag plugin
if has('unix')
  autocmd Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim
endif
" highlight spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd BufWinEnter * match ExtraWhitespace /^\t*\zs \+\|[ ]\{1,}$/
autocmd BufWinLeave * call clearmatches()
" file specific
" advanced strict indent, useful in c files not in sass i.e
autocmd Filetype c,cpp set cindent
" set doxygen code document style
autocmd Filetype javascript set filetype=javascript.doxygen
autocmd Filetype php set filetype=php.doxygen
" set comment style
autocmd Filetype php set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
autocmd Filetype php set formatoptions=croql
" delete fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" maps
" paste from OS
map <F12> "+gP
" yank to OS
map <F9> "+y
" prev buffer
map <F3> :bp<RETURN>
" next buffer
map <F4> :bn<RETURN>
" comment
map <C-c> <leader>c<space>
map <C-k> <leader>cm
" close current tab
nmap <C-u> :tabclose<CR>`.
" edit
nmap <C-d> cit
" NERDTree
nmap <S-T> :NERDTreeToggle<CR>
" search and replace selected text
vnoremap <C-h> "hy:%s/<C-r>h//gc<left><left><left>
" switch to buffer, if the target buffer is already displayed in a window or tab, that window will be displayed,
  " otherwise, the current window will be vsplit
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>
" c options
" execute make in current directory
map <F7> :make<RETURN>
" compile current file
map <S-F7> :make %:r <RETURN>
" go to next error
map <F6> :cn <RETURN>
" go to prev error
map <S-F6> :cp <RETURN>
" open error list
map <F5> :cope <RETURN>
" close error list
map <S-F5> :cclose <RETURN>
