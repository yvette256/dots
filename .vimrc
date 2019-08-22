" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-commentary'
Plugin 'dense-analysis/ale'
Plugin 'vim-jp/vim-cpp'
Plugin 'octol/vim-cpp-enhanced-highlight'

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
cnoremap kj <C-c>

" Bracket behaviors

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

inoremap (; ();<Left><Left>
inoremap "; "";<Left><Left>
inoremap {; {};<Left><Left>

inoremap (( (
inoremap {{ {
inoremap [[ [
inoremap "" "
inoremap '' '

function! Apostrophe()
    let line = getline('.')
    let col = col('.')
    let left = strpart(line, col-2, 1)
    let right = strpart(line, col-1, 1)
    if right == "\'"
        return "\<Right>"
    elseif left =~ "[0-9A-Za-z]"
        return "\'"
    else
        return "\'\'\<Left>"
    endif
endf

inoremap <expr> '  Apostrophe()

inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> >  strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Right>" : ">"
inoremap <expr> "  strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

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
    elseif left == "\"" && right == "\""
        return "\<Right>\<BS>\<BS>"
    elseif left == "\'" && right == "\'"
        return "\<Right>\<BS>\<BS>"
    else
        return "\<BS>"
    endif
endf

inoremap <expr> <BS> BracketBS()

" C comments
inoremap /*<Space> /*<Space><Space>*/<Left><Left><Left>

" Copy to clipboard
vnoremap <C-c> "+y

autocmd FileType matlab setlocal commentstring=%\ %s

" Plugin settings
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:tex_flavor = 'latex'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:ale_set_signs = 0
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

