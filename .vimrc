" vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'arcticicestudio/nord-vim'
"  Plug 'vim-airline/vim-airline'
"  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'ayu-theme/ayu-vim'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif
call plug#end()

let g:deoplete#enable_at_startup = 1

" pathogen
execute pathogen#infect()
syntax enable
filetype plugin indent on

" use 2 spaces for a tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" let ayucolor='mirage'

if has('nvim')
  if has('gui_vimr')
    " one dark color scheme
    colorscheme onedark
  else
    let ayucolor="light"
    colorscheme ayu
  endif
else
  " nord color scheme
  set background=dark
  colorscheme nord
endif

" let vim-airline know the powerline font is installed
" let g:airline_powerline_fonts = 1

" gitgutter set to realtime updating
let g:gitgutter_realtime = 1

" nord uniform status lines
let g:nord_uniform_status_lines = 1

" line numbers
set number

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" no swap file
set noswapfile

set laststatus=2
set statusline=%=%f\ %m

" get git information
function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

" macvim remove scrollbars
set guioptions=

set termguicolors

if has('nvim')
  if has('gui_vimr')
    " ruler at column 80
    set colorcolumn=80
  endif
endif

" transparent status line
hi StatusLine ctermbg=none cterm=bold

" Function: display errors from Ale in statusline
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction

" statusline
set statusline+=\ %{LinterStatus()}
set statusline+=%8*\ %{GitInfo()}