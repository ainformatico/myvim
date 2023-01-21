call plug#begin('~/.vim/bundle')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'phaazon/hop.nvim'
Plug 'slashmili/alchemist.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'windwp/nvim-autopairs'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bkad/CamelCaseMotion'
Plug 'gregsexton/gitv', { 'on': ['Gitv!', 'Gitv'] }
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
Plug 'junegunn/vim-peekaboo'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'
call plug#end()

" Basic config
syntax on " enables syntax highlight
set nopaste
set synmaxcol=150
set lazyredraw
set ttyfast
set background=light
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
set updatetime=100
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
autocmd BufWinEnter *.md silent! set ft=markdown
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

let g:coc_global_extensions = ['coc-tsserver', 'coc-snippets', 'coc-solargraph', 'coc-gocode', 'coc-go', 'coc-python', 'coc-tag', 'coc-json', 'coc-html', 'coc-css', 'coc-yaml', 'coc-highlight', 'coc-marketplace', 'coc-tsserver', 'coc-prettier', 'coc-eslint']
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" Autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF

" Telescope
" https://github.com/nvim-telescope/telescope.nvim/issues/2145
highlight NormalFloat ctermfg=DarkGrey
lua << EOF
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
     mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
    },
  }
})

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('v', '<leader>g', builtin.grep_string, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>t', builtin.help_tags, {})
EOF

" Sitter
lua <<EOF
local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "ruby", "bash", "typescript", "elixir", "gitignore", "json", "lua", "python", "regex", "rust", "go", "scss", "vim", "terraform" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
EOF

" Hop

lua <<EOF
local hop = require('hop')
hop.setup({
  direction = nil,
  current_line_only = false,
  case_insensitive = false,
  multi_windows = true
})

vim.keymap.set('n', ',,w', function()
  hop.hint_words({})
end, {remap=true})
EOF

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
