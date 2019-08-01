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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeaye/color_coded'
Plugin 'vim-python/python-syntax'

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

inoremap kj <Esc>
inoremap KJ <Esc>

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

inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

inoremap '' ''<Left>
inoremap <> <><Left>
inoremap `` ``<Left>

function! BracketBS()
    let line = getline('.')
    let col = col('.')
    let left = strpart(line, col-2, 1)
    let right = strpart(line, col-1, 1)
    if left == "(" && right == ")"
        return "\<Right>\<BS>\<BS>"
    elseif left == "[" && right == "]"
        return "\<Right>\<BS>\<BS>"
    elseif left == "{" && right == "}"
        return "\<Right>\<BS>\<BS>"
    else
        return "\<BS>"
    endif
endf

inoremap <expr> <BS> BracketBS()

inoremap /*<Space> /*<Space><Space>*/<Left><Left><Left>

vnoremap <C-c> "+y

let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:tex_flavor = 'latex'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:python_highlight_all = 1

