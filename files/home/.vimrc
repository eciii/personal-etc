" VUNDLE - begin
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'joonty/vdebug'
Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on
" VUNDLE - end


" OPTIONS

" Source this file if you want common configuration with Vi
"so ~/.exrc

" Syntax & Appereance options
syntax on				" Syntax highlighting
set background=dark		" Syntax highlighting colors ('dark' or 'light')

" Indentation
set tabstop=4
set shiftwidth=4

" Find/Replace
set hlsearch			" On Debian it is unset

" Status line
set laststatus=2

" Navigation options
set hidden				" Hide buffers when they are abandoned
set wildmenu			" Basic menu navigation

" PLUGIN: crtlp
let ctrlp_max_files=0
let ctrlp_working_path_mode=0
let ctrlp_show_hidden=1

" PLUGIN: airline
" Airline fix for Debian. The powerline fonts should be installed as the
" following instructions require:
" https://powerline.readthedocs.io/en/latest/installation/linux.html#fontconfig
set t_Co=256			" On Debian it is set to 8
let g:airline_powerline_fonts=1

" PLUGIN: nerdtree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp[[file]]']
map <c-o> :NERDTreeToggle<CR>
