call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bkad/CamelCaseMotion'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'gregsexton/gitv', { 'on': ['Gitv!', 'Gitv'] }
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'msanders/snipmate.vim'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'w0rp/ale'
Plug 'vim-scripts/closetag.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-syntax'
  Plug 'cyansprite/Extract'
else
  Plug 'Shougo/neocomplete.vim'
endif

call plug#end()

nnoremap ]p p=`]
nnoremap ]P P=`]

let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 0

nnoremap <LEADER>tv :AV<CR>
nnoremap <LEADER>ts :AS<CR>
nnoremap <LEADER>ta :A<CR>
nnoremap <LEADER>tt :TagbarToggle<CR>

let g:neosnippet#enable_snipmate_compatibility = 1

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:extract_maxCount = 10
endif

let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"set synmaxcol=150
"syntax sync minlines=256
"set lazyredraw
set background=light

" filetype plugin indent on
syntax enable " enables syntax highlight
"syntax on " enables syntax highlight
"set termguicolors
" let g:gitgutter_override_sign_column_highlight = 0
"set t_Co=256
"let g:solarized_termcolors=256
" filetype plugin on " enable plugins
call togglebg#map("<F5>")
set undodir=/tmp,.
set undofile
set undolevels=10000
set number " line numbers
set hlsearch " highlight search
set incsearch " show search matches while typing
set ignorecase " case unsensitive search
set wrapscan " search loop
set nocompatible " remove vi backwards compatibility
set ruler " show line position
set autoindent " code autoindent
set smartindent " advanced indent
set history=2000 " history length
set showcmd " show mode
set list " show hidden chars
set listchars=tab:^T,eol:¬ " hidden chars representation
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
set nrformats= " when using c-a and c-x do not assume 007 as octal
set foldenable " enable folding
set mouse=a " enable mouse
if has('mac')
  " fixes issues in MacVim
elseif has('nvim')
  set clipboard+=unnamedplus " advanced clipboard"
else
  set clipboard=autoselect
  set clipboard=unnamed " advanced clipboard"
endif
set nocursorline " highlight current line
set nocursorcolumn " show colum cursor
set smartcase " if there are caps, go case-sensitive
set omnifunc=on " autocomplete function
set completeopt=menu,preview " autocomplete function
set wildmenu " command-line completion
set scrolloff=3 " lines before EOF
set virtualedit=block " allow virtual editing in Visual block mode
" gui options
colorscheme solarized " colorscheme
if has("gui_running")
  set showtabline=2 " Always show tab line
  if has('mac')
    set guifont=Monaco:h17 " gui font
  elseif has('unix')
    set guifont=Monospace\ 9 " gui font
  endif
  set guioptions=aAeirL " remove unused menus
endif
" save and load folds
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
" closetag plugin
if has('unix')
  autocmd Filetype html,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
  set shellcmdflag=-c "set interactive shell, load bash profile
endif
" highlight spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd BufWinEnter * match ExtraWhitespace /[ ]\{1,}$/
autocmd WinEnter * match ExtraWhitespace /[ ]\{1,}$/
" file specific
" set markdown fieltype
autocmd BufWinEnter *.md silent! set ft=markdown
autocmd BufWinEnter *.jbuilder,Berksfile,Guardfile,Bowerfile silent! set ft=ruby
autocmd BufWinEnter COMMIT_EDITMSG setl spell
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
" highlight 'NOTE' statement
autocmd BufWinEnter * silent! syn keyword javaScriptCommentTodo NOTE contained
autocmd BufWinEnter * silent! syn keyword coffeeTodo NOTE contained
autocmd BufWinEnter * silent! syn keyword vimTodo NOTE contained
" maps
" switch to buffer, if the target buffer is already displayed in a window or tab, that window will be displayed,
  " otherwise, the current window will be vsplit
set switchbuf=usetab
" yank to OS
map <F9> "+y
" paste from OS
map <F12> "+gP
" comment
map <C-c> <leader>c<space>
" close current tab
nmap <C-p> :tabclose<CR>`.
" edit
nmap <C-h> cit
" this way we can simulate a real backspace, useful for plugins
imap <C-h> <BS>
" delete key, useful with <c-h> in insert mode
imap <C-l> <DEL>
" NERDTree
nmap <S-T> :NERDTreeToggle<CR>
nmap <C-t> :NERDTreeFind<CR>
" search and replace selected text
vnoremap <C-h> "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <LEADER>f :Denite file_rec<CR>

vnoremap <C-f> :fold<CR>

call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source('file_rec', 'sorters', ['sorter_rank'])
" Change default prompt
call denite#custom#option('default', 'prompt', '>')

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [ '.git/',
      \'.ropeproject/', '__pycache__/', 'venv/', 'images/', '*.min.*',
      \'img/', 'fonts/', 'node_modules'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#option('default', 'updatetime', 1)
call denite#custom#option('default', 'max_candidate_width', 100)
call denite#custom#option('default', 'highlight_matched_char', 'NonText')
call denite#custom#option('default', 'highlight_matched', 'WarningMsg')
call denite#custom#option('default', 'highlight_mode_insert', 'PMenu')

" Use mapping action directly
call denite#custom#map(
      \ 'normal',
      \ '<C-s>',
      \ '<denite:do_action:split>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'normal',
      \ '<C-v>',
      \ '<denite:do_action:vsplit>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'normal',
      \ '<C-t>',
      \ '<denite:do_action:tabopen>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-s>',
      \ '<denite:do_action:split>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-v>',
      \ '<denite:do_action:vsplit>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-t>',
      \ '<denite:do_action:tabopen>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<ESC>',
      \ '<denite:enter_mode:normal>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'normal',
      \ '<ESC>',
      \ '<denite:quit>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

nnoremap <LEADER>b :Denite buffer<CR>
nnoremap <LEADER>g :Denite grep<CR>
nnoremap <LEADER>d :Denite grep -path=

" sort, select lines and sort
vmap <C-s> :sort<CR>

" hide search matches
nnoremap <LEADER><LEADER> :nohl<CR>
" set the waiting timeout
set timeoutlen=400
" search and replace in selected area
vnoremap <C-g> :s/\%V//gc<left><left><left><left>
" search in selected area
vnoremap // :/\%V
" line precision
nnoremap ` '
" go to last position, column precision
nnoremap '' `.

" open Gstatus window
nmap <LEADER>gs :Gstatus<cr>

" easy motion
map ,, <Plug>(easymotion-prefix)
map  ,,/ <Plug>(easymotion-sn)
omap ,,/ <Plug>(easymotion-tn)
map  ,,n <Plug>(easymotion-next)
map  ,,N <Plug>(easymotion-prev)
map ,,w <Plug>(easymotion-bd-w)
map ,,a <Plug>(easymotion-jumptoanywhere)
map ,,r <Plug>(easymotion-repeat)
map ,,l <Plug>(easymotion-lineforward)
map ,,h <Plug>(easymotion-linebackward)

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_delay = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = "normal"
let g:ale_sign_column_always = 0
let g:ale_statusline_format = ['✗ %d ', '!%d ', '✓ ']

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> iw <Plug>CamelCaseMotion_ib
xmap <silent> iw <Plug>CamelCaseMotion_ib
omap <silent> ib <Plug>CamelCaseMotion_iw
xmap <silent> ib <Plug>CamelCaseMotion_iw
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


" Disable plugins when using mutiple cursors
function! Multiple_cursors_before()
  if !has('nvim')
    exe 'NeoCompleteLock'
  endif

  exe 'ALEDisable'
endfunction

function! Multiple_cursors_after()
  if !has('nvim')
    exe 'NeoCompleteUnlock'
  endif

  exe 'ALEEnable'
endfunction
