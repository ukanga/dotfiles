call plug#begin()

Plug 'chriskempson/base16-vim'

call plug#end()

" base16 colourscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" allow background image to be shown
hi Normal ctermbg=None ctermfg=None

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" use 4 spaces width
set shiftwidth=4

" insert 4 spaes for a tab
set expandtab
