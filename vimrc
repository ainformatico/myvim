call plug#begin('~/.vim/bundle')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'phaazon/hop.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/closetag.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'c-brenn/phoenix.vim'
Plug 'mbbill/undotree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'
Plug 'github/copilot.vim'
call plug#end()

" Basic config
syntax on " enables syntax highlight
set nopaste
set synmaxcol=150
set lazyredraw
set ttyfast
set background=light
colorscheme solarized
set re=0
set title
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
set clipboard+=unnamedplus " advanced clipboard"
set nocursorline " highlight current line
set nocursorcolumn " show colum cursor
set smartcase " if there are caps, go case-sensitive
set completeopt=menu,preview " autocomplete function
set wildmenu " command-line completion
set scrolloff=3 " lines before EOF
set virtualedit=block " allow virtual editing in Visual block mode
" switch to buffer, if the target buffer is already displayed in a window or tab, that window will be displayed,
  " otherwise, the current window will be vsplit
set switchbuf=usetab
" set the waiting timeout
set timeoutlen=400
set updatetime=300
" Terminal settings
let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" save and load folds
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
" closetag plugin
autocmd Filetype html,xml,xsl,javascript.jsx,eelixir source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
set shellcmdflag=-c "set interactive shell, load bash profile
" highlight spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd BufWinEnter * match ExtraWhitespace /[ ]\{1,}$/
autocmd WinEnter * match ExtraWhitespace /[ ]\{1,}$/
" file specific
" set markdown fieltype
autocmd BufWinEnter *.md,*.mdx silent! set ft=markdown
autocmd BufWinEnter *.jbuilder,Berksfile,Guardfile,Bowerfile silent! set ft=ruby
autocmd BufWinEnter Jenkinsfile silent! set ft=groovy
autocmd BufWinEnter COMMIT_EDITMSG setl spell
" advanced strict indent, useful in c files not in sass i.e
autocmd Filetype c,cpp set cindent
" set tab style
autocmd Filetype go set listchars=tab:\ \ ,eol:¬
autocmd Filetype go set noexpandtab
" delete fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" highlight 'NOTE' statement
autocmd BufWinEnter * silent! syn keyword javaScriptCommentTodo NOTE contained
autocmd BufWinEnter * silent! syn keyword vimTodo NOTE contained

" Maps
nnoremap ]p p=`]
nnoremap ]P P=`]
"" Copy path of file to clipboard
map <F8> :let @+=expand('%')<CR>
"" Lint json
nnoremap <LEADER>js :.!python3 -m json.tool<CR>
" yank to OS
map <F9> "+y
" paste from OS
map <F10> "+gP
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
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>
" search and replace selected text
vnoremap <C-h> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-f> :fold<CR>
" sort, select lines and sort
vmap <C-s> :sort<CR>
" hide search matches
nnoremap <LEADER><LEADER> :nohl<CR>
" search and replace in selected area
vnoremap <C-g> :s/\%V//gc<left><left><left><left>
" search in selected area
vnoremap // :/\%V
" line precision
nnoremap ` '
" go to last position, column precision
nnoremap '' `.

"""" Plugins """""
luafile ~/.vim/init.lua

" Visual Multi (multiple buffers)
let g:VM_maps = {}
let g:VM_maps['Skip Region'] = '<C-x>'

" Fugivite
nmap <LEADER>gs :Git<cr>

" Coc
imap <C-l> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <LEADER>do <Plug>(coc-codeaction)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"autocmd VimEnter,ColorScheme * hi! link CocFloating CocHintFloat

highlight CocErrorFloat ctermfg=Red

let g:coc_global_extensions = ['coc-tsserver', 'coc-snippets', 'coc-solargraph', 'coc-go', 'coc-python', 'coc-tag', 'coc-json', 'coc-html', 'coc-css', 'coc-yaml', 'coc-highlight', 'coc-marketplace', 'coc-tsserver', 'coc-prettier', 'coc-eslint']
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#r efresh()
endif

nnoremap <silent>gh :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying refactor code actions
nmap <silent> <leader>rf <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>rf <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>rf <Plug>(coc-codeaction-refactor-selected)

" go
let g:go_fmt_command = 'gopls'
let g:go_imports_autosave = 1
let g:go_auto_type_info = 1
let g:go_updatetime = 400
let g:go_jump_to_error = 0
let g:go_metalinter_autosave = 1
nnoremap <LEADER>gt :GoTest<CR>

" Airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 0
let g:airline_section_b = '%-0.10{getcwd()}'


" Ruby/Rspec
nnoremap <LEADER>tv :AV<CR>
nnoremap <LEADER>ts :AS<CR>
nnoremap <LEADER>ta :A<CR>
nnoremap <LEADER>tt :TagbarToggle<CR>

" Undotree
nnoremap <LEADER>u :UndotreeToggle<CR>:UndotreeFocus<CR>

" NERDTree
nmap <S-T> :NERDTreeToggle<CR>
nmap <C-t> :NERDTreeFind<CR>

vnoremap <C-b> :Gblame<CR>

" Telescope fix
" https://github.com/nvim-telescope/telescope.nvim/issues/2145
highlight NormalFloat ctermfg=DarkGrey

" CamelCaseMotion
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
