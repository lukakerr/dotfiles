" vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'ayu-theme/ayu-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'arcticicestudio/nord-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'leafgarland/typescript-vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'tpope/vim-fugitive'
  Plug 'drmingdrmer/vim-syntax-markdown'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif
call plug#end()

let g:deoplete#enable_at_startup = 1

syntax enable
filetype plugin indent on

" use 2 spaces for a tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

if has('nvim')
  if has('gui_vimr')
    colorscheme onedark
  else
    let ayucolor='light'
    colorscheme ayu
  endif
else
  set background=dark
  colorscheme nord
endif

" gitgutter set to realtime updating
let g:gitgutter_realtime = 1

" nord uniform status lines
let g:nord_uniform_status_lines = 1

" line numbers
set number

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1

" no swap file
set noswapfile

" only show statusline for >1 window
set laststatus=1

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
    set colorcolumn=80
  endif
endif

" transparent status line
if has('nvim')
  hi StatusLineNC guifg=#000 guibg=#f2f2f2 cterm=NONE gui=NONE
  hi StatusLine guifg=#FFF guibg=#ed9366 cterm=NONE gui=NONE
else
  hi StatusLine ctermbg=none cterm=bold
endif

" ale
nmap <silent> <S-k> <Plug>(ale_previous_wrap)
nmap <silent> <S-j> <Plug>(ale_next_wrap)
let g:ale_sign_warning = '●'
let g:ale_sign_error = '●'
highlight ALEErrorSign guifg=#f07171 guibg=clear
highlight ALEWarningSign guifg=#f29718 guibg=clear

" nerdcommenter
let g:NERDSpaceDelims =1

" fzf
map <S-p> :Files<CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" function: display errors from Ale in statusline
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

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

let g:currentmode={
  \ 'n'  : 'NORMAL',
  \ 'v'  : 'VISUAL',
  \ 's'  : 'SELECT',
  \ 'i'  : 'INSERT',
  \ 'c'  : 'COMMAND',
  \ 'r'  : 'PROMPT',
  \ 'rm' : 'MORE',
  \ '!'  : 'SHELL',
  \ 't'  : 'TERMINAL'
\}

" map mode letter to name
function! ModeName()
  return g:currentmode[mode()]
endfunction

" statusline
"set statusline=%{ModeName()}             " mode name
set statusline=\ %2t\ %y\ %m                 " filename, filytype, modified or not
set statusline+=%=\ %{LinterStatus()}     " linter warning and error count
set statusline+=\ %-8{GitInfo()}            " git branch
