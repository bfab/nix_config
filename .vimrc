set bs=2

:filetype on

" auto wrap line on gitcommits
au FileType gitcommit set tw=72

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" View content of renamed zip archives
au BufReadCmd *.jar,*.xpi,*.par call zip#Browse(expand("<amatch>"))