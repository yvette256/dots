" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'lervag/vimtex'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" My Settings

set number
syntax on
set autoindent
set smartindent

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start 

set hlsearch
set incsearch
set ignorecase
set smartcase

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
" inoremap < <><Esc>i
inoremap " ""<Esc>i
inoremap {<CR> {<CR>}<ESC>O

inoremap (( (
inoremap {{ {
inoremap [[ [
inoremap "" "

inoremap '' ''<Left>
inoremap <> <><Left>

function! BracketBS()
    let line = getline('.')
    let col = col('.')
    let left = strpart(line, col-2, 1)
    let right = strpart(line, col-1, 1)
    if left == "(" && right == ")"
        return "\<Right>\<BS>\<BS>"
    else
        return "\<BS>"
    endif
endf

inoremap <expr> <BS> BracketBS()

inoremap /*<Space> /*<Space><Space>*/<Left><Left><Left>

vnoremap <C-c> "+y

noremap <C-Up> 5k
noremap <C-Down> 5j

let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

