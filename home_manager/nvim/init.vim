" ~/.nvimrc

filetype plugin indent on
syntax on

lua require('plugins')

" autoupdate plugins.lua
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end


set encoding=utf-8 fileencodings=

" Interface
set number
set relativenumber
set cc=80

" set cursorline
set showmode
set showcmd
set laststatus=2
set wildmenu
set scrolloff=10
set splitbelow
set splitright

" File
set autoread
set autowrite
set hidden

" Miscellaneaous
set list listchars=tab:»·,trail:·

" Basics
filetype on
syntax on

" Indentation
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Search
set incsearch
set ignorecase
set smartcase

" Coding style
autocmd BufWritePre *.c %s/\s\+$//e
autocmd BufWritePre *.h %s/\s\+$//e

autocmd Filetype make setlocal noexpandtab

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif


" Auto completion
inoremap {<CR> {<CR>}<Esc>ko

