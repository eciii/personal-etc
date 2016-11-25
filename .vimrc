" Source this file if you want common configuration with Vi (note that the
" .exrc file is the configuration file of Vi)
"so ~/.exrc

syntax on		" Syntax highlighting
set background=dark	" Syntax highlighting colors ('dark' or 'light')
set showcmd		" Show (partial) command in status line.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)



" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif



