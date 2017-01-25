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
