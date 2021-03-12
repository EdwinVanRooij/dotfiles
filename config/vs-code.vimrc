" ===========================================================
" All fish-shell aliases and functions
" ===========================================================

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" start "General"
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set shell=/bin/bash 
cmap w!! w !sudo tee % > /dev/null
colo ron
set nobackup
set noswapfile
set ignorecase " search is case insensitive
set smartcase " unless I typed uppercase characters
set clipboard=unnamedplus
set history=1000
set scrolloff=5
set formatoptions-=t " disable auto newlines
set visualbell
set noerrorbells

set noshowmode
set noruler
set laststatus=0
set noshowcmd

syntax enable
filetype plugin indent on
" ================ Leader key ================
map <space> \
set timeoutlen=1250
" ================ end  ================
" Removes the delay
vnoremap <esc> <C-c>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" end
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" start "Key mappings"
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" A
inoremap <c-a> <esc>ggVG
nnoremap <c-a> <esc>ggVG
vnoremap <c-a> <esc>ggVG
" B
nnoremap <c-b> <nop>
" C
nnoremap C ciw
nnoremap <leader>c C
" D
nnoremap D daw
nnoremap <leader>d D
nnoremap <C-d> {d}
" E
"COMMENTED BECAUSE VSCODE nnoremap <leader>e :action ShowErrorDescription<cr>
" F
"COMMENTED BECAUSE VSCODE nnoremap f :action ShowIntentionActions<cr>
nnoremap F <nop>
"COMMENTED BECAUSE VSCODE nnoremap <c-F> :action ReformatCode<cr>
" G
"COMMENTED BECAUSE VSCODE nnoremap ga :action GotoAction<cr>
nnoremap gh 15zh
nnoremap gl 15zl
nnoremap gH 100zh
nnoremap gL 100zl
"COMMENTED BECAUSE VSCODE nnoremap gl :action MoveTabRight<cr>
"COMMENTED BECAUSE VSCODE nnoremap gj :action MoveTabDown<cr>
"COMMENTED BECAUSE VSCODE nnoremap gS :action UnsplitAll<cr>
"COMMENTED BECAUSE VSCODE nnoremap ge :action GotoNextError<cr>:action ShowErrorDescription<CR>
"COMMENTED BECAUSE VSCODE nnoremap gE :action GotoPreviousError<cr>:action ShowErrorDescription<CR>
"COMMENTED BECAUSE VSCODE nnoremap gu :action FindUsages<cr>
"COMMENTED BECAUSE VSCODE nnoremap gG :action Generate<cr>
"COMMENTED BECAUSE VSCODE nnoremap gd :action GotoDeclaration<cr>
"COMMENTED BECAUSE VSCODE nnoremap gnc :action NewClass<cr>
"COMMENTED BECAUSE VSCODE nnoremap gnd :action NewDir<cr>
"COMMENTED BECAUSE VSCODE nnoremap gnf :action NewFile<cr>
" H
nnoremap H ^
vnoremap H ^
"COMMENTED BECAUSE VSCODE nnoremap <c-h> :action VimWindowLeft<cr>
"COMMENTED BECAUSE VSCODE inoremap <c-h> <esc>:action VimWindowLeft<cr>
" I
" J
nnoremap J }
vnoremap J }
nnoremap <silent> j gj:noh<cr>
"COMMENTED BECAUSE VSCODE nnoremap <c-j> :action VimWindowDown<cr>
"COMMENTED BECAUSE VSCODE inoremap <c-j> <esc>:action VimWindowDown<cr>
" K
nnoremap K {
vnoremap K {
nnoremap <silent> k gk:noh<cr>
"COMMENTED BECAUSE VSCODE inoremap <c-k> <esc>:action VimWindowUp<cr>
"COMMENTED BECAUSE VSCODE nnoremap <c-k> :action VimWindowUp<cr>
" L
nnoremap L $
vnoremap L $
"COMMENTED BECAUSE VSCODE inoremap <c-l> <esc>:action VimWindowRight<cr>
"COMMENTED BECAUSE VSCODE nnoremap <c-l> :action VimWindowRight<cr>
" M
"COMMENTED BECAUSE VSCODE nnoremap m :action GotoNextBookmark<cr>
"COMMENTED BECAUSE VSCODE nnoremap M :action ToggleBookmark<CR>
" N
"COMMENTED BECAUSE VSCODE nnoremap <C-n> :action SearchEverywhere<cr>
"nnoremap <C-n> :action GotoClass<cr>
"nnoremap <C-s-N> :action GotoFile<cr>
" O
nnoremap <c-o> <nop>
nnoremap <leader>o :set paste<CR>o<Esc>k^:set nopaste<CR>
nnoremap <leader>O :set paste<CR>O<Esc>j^:set nopaste<CR>
" P
nnoremap P viwp
vnoremap P p
"COMMENTED BECAUSE VSCODE nnoremap <c-p> :action ParameterInfo<cr>
"nnoremap P viw"0p
"vnoremap P "0p
" Q
nnoremap Q qq
nnoremap <leader>q :q!<CR>
"nnoremap <leader>Q :action CloseAllEditorsButActive<cr>
" R
nnoremap R <c-r>
"COMMENTED BECAUSE VSCODE nnoremap <c-r> :action RenameElement<cr>
" S
nnoremap s /
nnoremap S ?
" T
nnoremap t s
nnoremap T S
" U
nnoremap U dd
nnoremap <leader>u mqg~iw`q
vnoremap <leader>u ~
" V
" W
nnoremap <leader>w :wq!<CR>
" X
nnoremap X J
" Y
nnoremap Y yiw
nnoremap <leader>y yy
" Z
nnoremap <c-z> <nop>
nnoremap z 100zh^zz5<C-e>
"COMMENTED BECAUSE VSCODE nnoremap Z :action CollapseRegion<cr>
" =
nnoremap = @q
" Backspace
nnoremap <backspace> i<backspace><esc>l
" Enter
nnoremap <s-cr> i<cr><esc>l
" Space
nnoremap <leader><space> i<space><esc>
" -
nnoremap - ddp
" _
nnoremap _ ddkkp
" Tab
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >gv
vnoremap <s-tab> <gv
" ,
nnoremap , Yp
vnoremap , yP
" .
" ;
"COMMENTED BECAUSE VSCODE "nnoremap ; :action VimFilePrevious<cr>
"
"nnoremap ; <C-S-6>
" /
"COMMENTED BECAUSE VSCODE "nnoremap / :action CommentByLineComment<cr>
"COMMENTED BECAUSE VSCODE vnoremap / <Esc>gvhh:<bs><bs><bs><bs><bs>action VimVisualSwapSelections<cr>:action CommentByLineComment<cr>
" <
"COMMENTED BECAUSE VSCODE nnoremap < :action PreviousTab<cr>
" >
"COMMENTED BECAUSE VSCODE nnoremap > :action NextTab<cr>
" 1
"COMMENTED BECAUSE VSCODE inoremap <c-1> :action ActivateProjectToolWindow<cr>
"COMMENTED BECAUSE VSCODE nnoremap <c-1> :action ActivateProjectToolWindow<cr>
" 2
" 3
" 4
" 5
" 6
" 7
" 8
" 9
" 0
" F1
" F2
" F3
" F4
" F5
"COMMENTED BECAUSE VSCODE nnoremap <f5> :action Run<cr>
"COMMENTED BECAUSE VSCODE nnoremap <s-f5> :action Stop<cr>
" F6
" F7
" F8
" F9
" F10
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" end
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

"" Change inside next <token>
nnoremap <silent> <leader>' /'<CR>:noh<cr>ci'
nnoremap <silent> <leader>" /"<CR>:noh<cr>ci"
nnoremap <silent> <leader>} /}<CR>:noh<cr>ci}
nnoremap <silent> <leader>{ /{<CR>:noh<cr>ci}
nnoremap <silent> <leader>) /)<CR>:noh<cr>ci)
nnoremap <silent> <leader>( /(<CR>:noh<cr>ci)
nnoremap <silent> <leader>[ /[<CR>:noh<cr>ci]
nnoremap <silent> <leader>] /]<CR>:noh<cr>ci]
nnoremap <silent> c' /'<CR>:noh<cr>ci'
nnoremap <silent> c" /"<CR>:noh<cr>ci"
nnoremap <silent> c} /}<CR>:noh<cr>ci}
nnoremap <silent> c{ /{<CR>:noh<cr>ci}
nnoremap <silent> c) /)<CR>:noh<cr>ci)
nnoremap <silent> c( /(<CR>:noh<cr>ci)
nnoremap <silent> c[ /[<CR>:noh<cr>ci]
nnoremap <silent> c] /]<CR>:noh<cr>ci]
nnoremap <silent> ci' /'<CR>:noh<cr>ci'
nnoremap <silent> ci" /"<CR>:noh<cr>ci"
nnoremap <silent> ci} /}<CR>:noh<cr>ci}
nnoremap <silent> ci{ /{<CR>:noh<cr>ci}
nnoremap <silent> ci) /)<CR>:noh<cr>ci)
nnoremap <silent> ci( /(<CR>:noh<cr>ci)
nnoremap <silent> ci[ /[<CR>:noh<cr>ci]
nnoremap <silent> ci] /]<CR>:noh<cr>ci]
" Yank inside <token>
nnoremap yw yiw
nnoremap <silent> y' /'<CR>:noh<cr>yi'
nnoremap <silent> y" /"<CR>:noh<cr>yi"
nnoremap <silent> y} /}<CR>:noh<cr>yi}
nnoremap <silent> y{ /{<CR>:noh<cr>yi}
nnoremap <silent> y) /)<CR>:noh<cr>yi)
nnoremap <silent> y( /(<CR>:noh<cr>yi)
nnoremap <silent> y[ /[<CR>:noh<cr>yi]
nnoremap <silent> y] /]<CR>:noh<cr>yi]
nnoremap <silent> yi' /'<CR>:noh<cr>yi'
nnoremap <silent> yi" /"<CR>:noh<cr>yi"
nnoremap <silent> yi} /}<CR>:noh<cr>yi}
nnoremap <silent> yi{ /{<CR>:noh<cr>yi}
nnoremap <silent> yi) /)<CR>:noh<cr>yi)
nnoremap <silent> yi( /(<CR>:noh<cr>yi)
nnoremap <silent> yi[ /[<CR>:noh<cr>yi]
nnoremap <silent> yi] /]<CR>:noh<cr>yi]
" Yank around <token>
nnoremap <silent> ya' /'<CR>:noh<cr>ya'
nnoremap <silent> ya" /"<CR>:noh<cr>ya"
nnoremap <silent> ya} /}<CR>:noh<cr>ya}
nnoremap <silent> ya{ /{<CR>:noh<cr>ya}
nnoremap <silent> ya{ /}<CR>:noh<cr>ya}
nnoremap <silent> ya) /)<CR>:noh<cr>ya)
nnoremap <silent> ya( /(<CR>:noh<cr>ya)
nnoremap <silent> ya[ /[<CR>:noh<cr>ya]
nnoremap <silent> ya] /]<CR>:noh<cr>ya]
" Delete inside <token>
nnoremap <silent> d' /'<CR>:noh<cr>di'
nnoremap <silent> d" /"<CR>:noh<cr>di"
nnoremap <silent> d} /}<CR>:noh<cr>di}
nnoremap <silent> d{ /{<CR>:noh<cr>di}
nnoremap <silent> d) /)<CR>:noh<cr>di)
nnoremap <silent> d( /(<CR>:noh<cr>di)
nnoremap <silent> d[ /[<CR>:noh<cr>di]
nnoremap <silent> d] /]<CR>:noh<cr>di]
" Delete inside
nnoremap <silent> di' /'<CR>:noh<cr>di'
nnoremap <silent> di" /"<CR>:noh<cr>di"
nnoremap <silent> di} /}<CR>:noh<cr>di}
nnoremap <silent> di{ /{<CR>:noh<cr>di}
nnoremap <silent> di) /)<CR>:noh<cr>di)
nnoremap <silent> di( /(<CR>:noh<cr>di)
nnoremap <silent> di[ /[<CR>:noh<cr>di]
nnoremap <silent> di] /]<CR>:noh<cr>di]
" Delete around <token>
nnoremap <silent> da' /'<CR>:noh<cr>da'
nnoremap <silent> da" /"<CR>:noh<cr>da"
nnoremap <silent> da} /}<CR>:noh<cr>da}
nnoremap <silent> da{ /}<CR>:noh<cr>da}
nnoremap <silent> da{ /{<CR>:noh<cr>da}
nnoremap <silent> da) /)<CR>:noh<cr>da)
nnoremap <silent> da( /(<CR>:noh<cr>da)
nnoremap <silent> da[ /[<CR>:noh<cr>da]
nnoremap <silent> da] /]<CR>:noh<cr>da]
" Visual
nnoremap <leader>v viw
nnoremap vw viw
nnoremap <silent> vi' /'<CR>:noh<cr>vi'
nnoremap <silent> vi" /"<CR>:noh<cr>vi"
nnoremap <silent> vi} /}<CR>:noh<cr>vi}
nnoremap <silent> vi{ /}<CR>:noh<cr>vi}
nnoremap <silent> vi{ /{<CR>:noh<cr>vi}
nnoremap <silent> vi) /)<CR>:noh<cr>vi)
nnoremap <silent> vi( /(<CR>:noh<cr>vi)
nnoremap <silent> vi[ /[<CR>:noh<cr>vi]
nnoremap <silent> vi] /]<CR>:noh<cr>vi]
