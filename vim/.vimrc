set nocompatible
filetype off
filetype on
filetype plugin indent on " turn on filetype options: detection, plugin, indent

" Basic settings
set autoread                   " auto reload a file when edited externally
set backspace=indent,eol,start " make backspace work as expected
"set guitablabel=(%N%M)\ %f     " tab label format
set history=50                 " command history
set hlsearch                   " highlight search matches
set incsearch                  " jump to search match while typing
set nobackup                   " disable ~backup files
set number                     " show line numbers
"set ruler                      " show line + column number and % progress through file in status line
set showcmd                    " show commands as they're typed
set showmatch                  " highlight matching braces
set spelllang=en_ca            " set spelling language to Canadian English
"set visualbell t_vb=           " disable visual bell + terminal bell
"set laststatus=2               " always show the status line
"set statusline=%f\ %m%r%h%w\ [%l,%v]\ [%L]\ (%p%%)
"set titlestring=%{getcwd()}

" Syntax
syntax on

" Folding
set foldlevelstart=1
au FileType json set foldmethod=indent
au FileType javascript call JavaScriptFold()
au FileType json set foldmethod=indent
let g:is_bash=1
let g:sh_fold_enabled=3

" File tabbing
autocmd FileType json,sh setlocal expandtab
autocmd FileType json,sh setlocal shiftwidth=4
autocmd FileType json,sh setlocal tabstop=4
autocmd FileType json,sh setlocal softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.js,*.ts set expandtab
au BufRead,BufNewFile *.js,*.ts set shiftwidth=2
au BufRead,BufNewFile *.js,*.ts set tabstop=2
au BufRead,BufNewFile *.js,*.ts set softtabstop=2
au BufRead,BufNewFile *.html,*.php,*.css,*.rb,*.ejs set expandtab
au BufRead,BufNewFile *.html,*.php,*.css,*.rb,*.ejs set shiftwidth=2
au BufRead,BufNewFile *.html,*.php,*.css,*.rb,*.ejs set tabstop=2
au BufRead,BufNewFile *.html,*.php,*.css,*.rb,*.ejs set softtabstop=2
au BufRead,BufNewFile *.haml,*.sass,*.scss,*.yml,*.yaml set expandtab
au BufRead,BufNewFile *.haml,*.sass,*.scss,*.yml,*.yaml set shiftwidth=2
au BufRead,BufNewFile *.haml,*.sass,*.scss,*.yml,*.yaml set tabstop=2
au BufRead,BufNewFile *.haml,*.sass,*.scss,*.yml,*.yaml set softtabstop=2

" Key mappings
let mapleader=" "
map <F3> :nohl <CR>
map <F4> :set spell!<CR>
nmap <leader>t :Texplore .<CR>

" Functions
" Return to last edit position when opening a file
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
set viminfo^=%
" Strip white spaces
function! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Github
Plugin 'airblade/vim-gitgutter' " show git diff in gutter
Plugin 'altercation/vim-colors-solarized' " solorized
Plugin 'ervandew/supertab' " tab functions
Plugin 'hdima/python-syntax' " python syntax
Plugin 'hynek/vim-python-pep8-indent' " pip8 indent format
Plugin 'tmhedberg/SimpylFold' "folding
Plugin 'tpope/vim-fugitive' " git cmd in vim
Plugin 'tpope/vim-vinegar' " nice file explorer
"Plugin 'w0rp/ale' " ale
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" Colour
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	set t_Co=256
	let g:solarized_termcolors=256
	set background=dark
	colorscheme solarized
endif
call togglebg#map('')

" Vinegar
let &wildignore = '*.swo,*.swp,*.pyc,.DS_Store'

" Static code checkers
"" Bash (not all are supported by ALE)
" bashate: install with pip
" shellcheck: install with homebrew or apt-get
" sh: install as system package
"" JSON
" jsonlint: install with npm
"" JavaScript
" jshint: install with npm
" jscs: install with npm
"" Python
" pylint: install with pip
" mypy: install with pip
"" Typescript
" tslint: install with npm (also install typescript)

" Airline
let g:airline_theme = 'solarized'
let g:airline_solarlized_bg = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

" Ale
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%severity%] [%linter%] %s'
"let g:ale_linters = {
"			\   'javascript': ['jshint', 'jscs'],
"			\   'json': ['jsonlint'],
"			\   'python': ['mypy', 'pycodestyle', 'pylint'],
"			\   'sh': ['shellcheck'],
"			\}
"let g:ale_type_map = {
"			\   'pycodestyle': {'ES': 'WS'},
"			\}
