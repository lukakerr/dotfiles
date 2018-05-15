" gruvbox theme
set notermguicolors
colorscheme gruvbox
set background=dark
hi VertSplit ctermbg=NONE guibg=NONE
hi LineNr ctermfg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235

" gitgutter
hi GitGutterAdd ctermbg=235 ctermfg=2
hi GitGutterChange ctermbg=235 ctermfg=3
hi GitGutterDelete ctermbg=235 ctermfg=1
hi GitGutterChangeDelete ctermbg=235 ctermfg=5

let g:NERDTreeStatusline = '%#NonText#'

hi EndOfBuffer ctermfg=237 ctermbg=235

hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237

highlight User1 gui=NONE ctermfg=15

set statusline=%=\ %2t\ %y\ %m
set statusline+=\ %{LinterStatus()}
set statusline+=\|\ %1*%-8{GitInfo()}%*
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2

" hi ActiveWindow ctermbg=235 | hi InactiveWindow ctermfg=236 ctermbg=235
hi CursorLine ctermbg=NONE
