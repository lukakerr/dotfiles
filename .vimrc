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
  Plug 'lervag/vimtex'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif
call plug#end()

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

syntax enable
filetype plugin indent on

set tabstop=2           " use 2 spaces for a tab
set shiftwidth=2
set softtabstop=2
set expandtab
set number              " line numbers
set noswapfile          " no swap file
set laststatus=2        " only show statusline for >1 window
set guioptions=         " macvim remove scrollbars
set termguicolors
set splitbelow
set splitright
set showcmd

" deoplete
let g:deoplete#enable_at_startup = 1

" gitgutter set to realtime updating
let g:gitgutter_realtime = 1

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" nerdcommenter
let g:NERDSpaceDelims =1

" ale
nmap <silent> <S-k> <Plug>(ale_previous_wrap)
nmap <silent> <S-j> <Plug>(ale_next_wrap)
let g:ale_sign_warning = '●'
let g:ale_sign_error = '●'
highlight ALEErrorSign guifg=#f07171 guibg=clearar=1 ctermbg=1
highlight ALEWarningSign guifg=#f29718 guibg=clearfg=2 ctermbg=2

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

" function: get git information
function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

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

" function: map mode letter to name
function! ModeName()
  return g:currentmode[mode()]
endfunction

" statusline
"set statusline=%{ModeName()}             " mode name
set statusline=\ %2t\ %y\ %m              " filename, filytype, modified or not
set statusline+=%=\ %{LinterStatus()}     " linter warning and error count
set statusline+=\ %-8{GitInfo()}          " git branch

" overrides for themes
if has('nvim')
  if has('gui_vimr')
    set colorcolumn=80
    source ~/.vim/themes/nord.vimrc
  else
    source ~/.vim/themes/gruvbox.vimrc
    " source ~/.vim/themes/mirage_light.vimrc
  endif
else
  source ~/.vim/themes/nord.vimrc
endif
