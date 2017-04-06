call plug#begin()

Plug 'chriskempson/base16-vim'

" autocompletion plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" vim sessions`
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

Plug 'kien/ctrlp.vim'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'

" rust
Plug 'rust-lang/rust.vim'

" comment
Plug 'tpope/vim-commentary'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'editorconfig/editorconfig-vim'

" python
Plug 'vim-scripts/indentpython.vim'
Plug 'neomake/neomake'
Plug 'zchee/deoplete-jedi'
Plug 'mindriot101/vim-yapf'
Plug 'fisadev/vim-isort'

call plug#end()

" deoplete
set completeopt=longest,menuone,preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" close preview window when in no use
let g:SuperTabClosePreviewOnPopupClose = 1

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

let g:ctrlp_custom_ignore = 'node_modules\|.git'

let mapleader = ','

" NerdTree
map <leader>d :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']

" enable line numbers
set number

" show trailing whitespace
set list
set listchars=tab:▸\ ,trail:.

" strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |

" neomake
let g:neomake_python_enabled_makers = ['flake8', 'pep8'] " , 'vulture']
autocmd! BufReadPost,BufWritePost * Neomake

:nnoremap <leader>y :Yapf<cr>
