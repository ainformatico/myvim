runtime bundle/vim-pathogen/autoload/pathogen.vim " load pathogen from custom location(submodule)
call pathogen#infect()
call pathogen#helptags() " the pathogen call search the vim plugins on bundles
filetype plugin indent on
syntax enable " enables syntax highlight
syntax on " enables syntax highlight
colorscheme desert " colorscheme
set t_Co=256 " set 256 for terminal colors
filetype plugin on " enable plugins
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
set nrformats= " when using c-a and c-x do not assume 007 as octal
set foldenable " enable folding
set mouse=a " enable mouse
if has('mac')
  " fixes issues in MacVim
  set clipboard=autoselect
else
  set clipboard=unnamed " advanced clipboard"
endif
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
  set background=light
  colorscheme solarized " colorscheme
  set showtabline=2 " Always show tab line
  "set lines=999 columns=999 " Maximize gvim window.
  if has('mac')
    set guifont=Consolas:h12 " gui font
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
  autocmd Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim
  set shellcmdflag=-c "set interactive shell, load bash profile
endif
" highlight spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd BufWinEnter * match ExtraWhitespace /[ ]\{1,}$/
autocmd WinEnter * match ExtraWhitespace /[ ]\{1,}$/
" file specific
" set markdown fieltype
autocmd BufWinEnter *.md silent! set ft=markdown
autocmd BufWinEnter *.jbuilder silent! set ft=ruby
autocmd BufWinEnter Berksfile set filetype=ruby
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
" prev buffer
map <F3> :bp<RETURN>
" next buffer
map <F4> :bn<RETURN>
" c options
" open error list
map <F5> :cope <RETURN>
" close error list
map <S-F5> :cclose <RETURN>
" go to next error
map <F6> :cn <RETURN>
" go to prev error
map <S-F6> :cp <RETURN>
" execute make in current directory
map <F7> :make<RETURN>
" compile current file
map <S-F7> :make %:r <RETURN>
" switch to buffer, if the target buffer is already displayed in a window or tab, that window will be displayed,
  " otherwise, the current window will be vsplit
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>
" yank to OS
map <F9> "+y
" paste from OS
map <F12> "+gP
" comment
map <C-c> <leader>c<space>
map <C-k> <leader>cm
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
" Unite, main interface
nnoremap <LEADER>u :Unite<CR>
" Unite, buffer and file search
nnoremap <LEADER>f :Unite -start-insert buffer file_rec/async<CR>
" Unite, buffer file search
nnoremap <LEADER>b :Unite -start-insert buffer<CR>
" Unite, grep in all files
nnoremap <LEADER>g :Unite grep:.<CR>
" set the fuzzy engine for searching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" maximum charachers for fuzzy
let g:unite_matcher_fuzzy_max_input_length = 70
" command for file searching, ag is blazing fast
let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore "tmp" --ignore "log" --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
" cache the results
let g:unite_source_rec_max_cache_files=500000
" custom bindings inside Unite window
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <silent><buffer><expr> s unite#do_action('split')
  nmap <silent><buffer><expr> v unite#do_action('vsplit')
  nmap <silent><buffer><expr> t unite#do_action('tabopen')
endfunction

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neocomplcache_enable_at_startup = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate/snippets'"

" Neocomplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" hide search matches
nnoremap <LEADER><LEADER> :nohl<CR>
" show search matches
nnoremap <LEADER>/ :set hls<CR>
" set the waiting timeout
set timeoutlen=500
" search and replace in selected area
vnoremap <C-g> :s/\%V//gc<left><left><left><left>
" search in selected area
vnoremap // :/\%V
" for spanish keyboard it's too dificult to press `
" column precision
nnoremap ' `
" line precision
nnoremap ` '
" go to last position, column precision
nnoremap '' `.
" alternative <esc>, using noremap so we don't have to wait
inoremap <C-k> <ESC>
" search forward, aimed for spanish keyboards(inspired by english keyboards)
nnoremap - /
" search backwards, aimed for spanish keyboards(inspired by english keyboards)
nnoremap _ ?
" tabularize =, : and =>
vnoremap t= :Tabularize /=<CR>
vnoremap t: :Tabularize /:<CR>
vnoremap t> :Tabularize /=><CR>
" execute the current script, it must have execution perm
nnoremap <LEADER>r :!./%<CR>

" insert the current date as yyyymmdd
inoremap <M-t> <C-R>=strftime('%Y%m%d')<CR>

function! UpdateModified()
  exe '%s/@modified\s*\zs\d\{8,\}\ze/' . strftime('%Y%m%d') . '/'
  :w
endfunction

" update the @modified from file
noremap <silent> <M-m> :call UpdateModified()<CR>

" tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" non-bash shells
if &shell !~ 'bash'
  " GitGutter needs /bin/bash so force the shell when it's installed
  autocmd VimEnter * if exists(":GitGutter") == 2 | set shell=/bin/bash | endif
endif

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

"syntastic configuration
let g:syntastic_auto_jump = 0
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_filetype_map = { 'javascript.doxygen': 'javascript' }
let g:syntastic_always_populate_loc_list = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
