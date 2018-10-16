" vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdtree'
  Plug 'drmingdrmer/vim-syntax-markdown'
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'lervag/vimtex'
  Plug 'tpope/vim-fugitive'
  Plug 'neovimhaskell/haskell-vim'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'chriskempson/base16-vim',
  Plug 'tikhomirov/vim-glsl',
  Plug 'altercation/vim-colors-solarized'
  Plug 'drewtempelmeyer/palenight.vim'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
call plug#end()


" LanguageClient config
set hidden

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
  \ 'haskell': ['hie-wrapper', '--lsp'],
  \ }

let g:LanguageClient_diagnosticsDisplay = {
  \1: {'name': 'Error', 'texthl': 'ALEError', 'signText': '●', 'signTexthl': 'ALEErrorSign',},
  \2: {'name': 'Warning', 'texthl': 'ALEWarning', 'signText': '●', 'signTexthl': 'ALEWarningSign',},
  \3: {'name': 'Information', 'texthl': 'ALEInfo', 'signText': '●', 'signTexthl': 'ALEInfoSign',},
  \4: {'name': 'Hint', 'texthl': 'ALEInfo', 'signText': '●', 'signTexthl': 'ALEInfoSign',},
  \}

let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

" LanguageClient mappings
nnoremap <silent> gm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gp :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> ga :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<CR>

let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

syntax enable
syntax on
filetype plugin indent on

set wildmode=longest:full
set wildmenu

" ignore these files
set wildignore=*.o,*.pyc,*.class

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set magic
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
" set colorcolumn=80
set textwidth=80
set shortmess+=F        " dont show file info on load

" map <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

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
let g:ale_set_highlights = 0    " don't synax highlight errors/warnings
highlight ALEErrorSign guifg=#f07171 " guibg=clearar=1 ctermbg=1
highlight ALEWarningSign guifg=#f29718 " guibg=clearfg=2 ctermbg=2

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
set statusline+=\ %2t\ %m                 " filename, filytype, modified or not
set statusline+=%=\ %{LinterStatus()}     " linter warning and error count
set statusline+=\ %-8{GitInfo()}          " git branch

" source ~/dev/dotfiles/themes/vim/solarized-light.vimrc
" source ~/dev/dotfiles/themes/vim/ashes-light.vimrc

set background=dark
colorscheme palenight
