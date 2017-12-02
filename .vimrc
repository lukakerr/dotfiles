" vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'arcticicestudio/nord-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
call plug#end()

" pathogen
execute pathogen#infect()
syntax enable
filetype plugin indent on

" nord colour scheme
colorscheme nord
set background=dark

" let vim-airline know the powerline font is installed
let g:airline_powerline_fonts = 1

" gitgutter set to realtime updating
let g:gitgutter_realtime = 1

" nord uniform status lines
let g:nord_uniform_status_lines = 1

" line numbers
set number

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>