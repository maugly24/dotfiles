" An example for a vimrc file.
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last change: 2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"     for Amiga:  s:.vimrc
"     for MS-DOS and Win32:  $VIM\_vimrc
"     for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backupdir=$HOME/.vim/backup
  set backup " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undodir=$HOME/.vim/undo
    set undofile " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
filetype indent plugin on
augroup GruvBoxOverride
  autocmd!
  autocmd ColorScheme gruvbox highlight LineNr guifg='#8ec07c'
  autocmd ColorScheme gruvbox let g:gruvbox_contrast_dark="hard"
  autocmd User AirlineAfterTheme if g:colors_name == "gruvbox" | let g:airline_theme="dark" | endif
augroup END
" Force to use underline for spell check results and apply gruvbox theme
" LL-Update: no need to shift things for color red.
" Source: https://vi.stackexchange.com/a/21168/2398
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme * highlight SpellBad cterm=Underline ctermfg=None ctermbg=None
  autocmd ColorScheme * highlight SpellCap cterm=Underline ctermfg=None ctermbg=None
  autocmd ColorScheme * highlight SpellLocal cterm=Underline ctermfg=None ctermbg=None
  autocmd ColorScheme * highlight SpellRare cterm=Underline ctermfg=None ctermbg=None
augroup END
autocmd vimenter * let g:gruvbox_contrast_dark="hard"
autocmd vimenter * colorscheme gruvbox
autocmd vimenter * set background=dark
autocmd vimenter * highlight SpellBad cterm=UnderLine ctermfg=None ctermbg=None
autocmd vimenter * highlight SpellCap cterm=Underline ctermfg=None ctermbg=None
autocmd vimenter * highlight SpellLocal cterm=Underline ctermfg=None ctermbg=None
autocmd vimenter * highlight SpellRare cterm=Underline ctermfg=None ctermbg=None
autocmd vimenter * highlight LineNr guifg='#8ec07c'
syntax on
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut= | set ttyscroll=1
endif

"standard vim stuff
set list
set number
set incsearch
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set autoindent
set history=10000
set numberwidth=5
set termguicolors
set spell
set ic

let g:netrw_home="$HOME/.vim/netrw/"

inoremap <C-e> <C-o>g_<C-o>a
inoremap <C-a> <C-o>^
nnoremap Qd mqWBxEx`qh
vnoremap Q} <ESC>`>a}<ESC>`<i{<ESC>
inoremap Q} mq<ESC>WBcW{}<ESC>P`qli
nnoremap Q} mqWBcW{}<ESC>P`ql
vnoremap Q) <ESC>`>a)<ESC>`<i(<ESC>
inoremap Q) mq<ESC>WBcW()<ESC>P`qli
nnoremap Q) mqWBcW()<ESC>P`ql
vnoremap Q{ <ESC>`>a{<ESC>`<i}<ESC>
inoremap Q{ mq<ESC>WBcW{}<ESC>P`qli
nnoremap Q{ mqWBcW{}<ESC>P`ql
vnoremap Q( <ESC>`>a(<ESC>`<i)<ESC>
inoremap Q( mq<ESC>WBcW()<ESC>P`qli
nnoremap Q( mqWBcW()<ESC>P`ql
vnoremap Q" <ESC>`>a"<ESC>`<i"<ESC>
inoremap Q" mq<ESC>WBcW""<ESC>P`qli
nnoremap Q" mqWBcW""<ESC>P`ql
vnoremap Q' <ESC>`>a'<ESC>`<i'<ESC>
inoremap Q' mq<ESC>WBcW''<ESC>P`qli
nnoremap Q' mqWBcW''<ESC>P`ql
cnoremap W!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

