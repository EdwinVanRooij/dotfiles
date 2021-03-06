" ================ Leader key ================
map <space> \
set timeoutlen=1250
set ignorecase " search is case insensitive
set smartcase " unless I typed uppercase characters
set clipboard=unnamed
" ================ end  ================
" Removes the delay
vnoremap <esc> <C-c>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" end
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

" <
nnoremap < :vsc Window.PreviousTab<cr>
" >
nnoremap > :vsc Window.NextTab<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" start "Key mappings"
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" A
"inoremap <c-a> <esc>ggVG
"nnoremap <c-a> <esc>ggVG
"vnoremap <c-a> <esc>ggVG
" B
"nnoremap <c-b> <nop>
" C
nnoremap C ciw
nnoremap <leader>c C
" D
nnoremap D daw
nnoremap <leader>d D
" E
nnoremap <leader>e :vsc View.QuickActions<cr>
" F
nnoremap f :vsc View.QuickActions<cr>
nnoremap F <nop>
nnoremap <c-F> :vsc Edit.FormatDocument<cr>
" G
"nnoremap ga :action GotoAction<cr>
nnoremap gh 15zh
nnoremap gl 15zl
nnoremap gH 100zh
nnoremap gL 100zl
"nnoremap gl :action MoveTabRight<cr>
"nnoremap gj :action MoveTabDown<cr>
"nnoremap gS :action UnsplitAll<cr>
noremap ge :vsc View.NextError<cr>:vsc View.QuickActions<cr>
nnoremap gE :vsc View.PreviousError<cr>:vsc View.QuickActions<cr>
"nnoremap gu :vsc Edit.GoToReference<cr>
nnoremap gu :vsc Edit.FindAllReferences<cr>
nnoremap gU :vsc Edit.FindAllReferences<cr>
"nnoremap gu :action FindUsages<cr>
"nnoremap gG :action Generate<cr>
"nnoremap gd :action GotoDeclaration<cr>
"nnoremap gd :vsc Edit.GoToDeclaration<cr>
nnoremap gd :vsc Edit.GoToDefinition<cr>
nnoremap gnc :vsc Project.AddClass<cr>
"nnoremap gnd :action NewDir<cr>
nnoremap gnf :vsc File.NewFile<cr>
" H
nnoremap H ^
vnoremap H ^
"nnoremap <c-h> :action VimWindowLeft<cr>
"inoremap <c-h> <esc>:action VimWindowLeft<cr>
" I
" J
nnoremap J }
vnoremap J }
"nnoremap <silent> j gj:noh<cr>
"nnoremap <c-j> :action VimWindowDown<cr>
"inoremap <c-j> <esc>:action VimWindowDown<cr>
" K
nnoremap K {
vnoremap K {
"nnoremap <silent> k gk:noh<cr>
"inoremap <c-k> <esc>:action VimWindowUp<cr>
"nnoremap <c-k> :action VimWindowUp<cr>
" L
nnoremap L $
vnoremap L $
"inoremap <c-l> <esc>:action VimWindowRight<cr>
"nnoremap <c-l> :action VimWindowRight<cr>
" M
"nnoremap m :action GotoNextBookmark<cr>
"nnoremap M :action ToggleBookmark<CR>
" N
nnoremap <C-n> :vsc Edit.GoToAll<cr>
"nnoremap <C-n> :action SearchEverywhere<cr>
"nnoremap <C-n> :action GotoClass<cr>
"nnoremap <C-s-N> :action GotoFile<cr>
" O
"nnoremap <c-o> <nop>
"nnoremap <leader>o :set paste<CR>o<Esc>k^:set nopaste<CR>
"nnoremap <leader>O :set paste<CR>O<Esc>j^:set nopaste<CR>
" P
nnoremap P viwp
vnoremap P p
nnoremap <c-p> :vsc Edit.ParameterInfo<cr>
inoremap <c-p> :vsc Edit.ParameterInfo<cr>
"nnoremap P viw"0p
"vnoremap P "0p
" Q
nnoremap Q qq
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :vsc File.CloseAllButThis<cr>
"nnoremap <leader>Q :action CloseAllEditorsButActive<cr>
" R
nnoremap R <c-r>
nnoremap <c-r> :action RenameElement<cr>
" S
nnoremap s /
nnoremap S ?
" T
nnoremap t s
nnoremap T S
" U
nnoremap U dd
"nnoremap <leader>u mqg~iw`q
"vnoremap <leader>u ~
" V
" W
"nnoremap <leader>w :wq!<CR>
" X
nnoremap X J
" Y
nnoremap Y yiw
"nnoremap <leader>y yy
" Z
"nnoremap <c-z> <nop>
nnoremap z 100zh^zz5<C-e>
"nnoremap Z :action CollapseRegion<cr>
" =
nnoremap = @q
" Backspace
"nnoremap <backspace> i<backspace><esc>l
" Enter
"nnoremap <s-cr> i<cr><esc>l
" Space
"nnoremap <leader><space> i<space><esc>
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
nnoremap ; :vsc Window.NextDocumentWindowNav<cr>
" /
nnoremap / :vsc Edit.ToggleComment<cr>
vnoremap / :vsc Edit.ToggleComment<cr>
"nnoremap / :vsc Edit.CommentSelection<cr>
"vnoremap / :vsc Edit.CommentSelection<cr>
"nnoremap / :action CommentByLineComment<cr>
"vnoremap / <Esc>gvhh:<bs><bs><bs><bs><bs>action VimVisualSwapSelections<cr>:action CommentByLineComment<cr>
" 1
"inoremap <c-1> :action ActivateProjectToolWindow<cr>
"nnoremap <c-1> :action ActivateProjectToolWindow<cr>
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
"""nnoremap <f5> :action Run<cr>
"nnoremap <s-f5> :action Stop<cr>
" F6
" F7
" F8
" F9
" F10
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" end
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

"" Change inside next <token>
"nnoremap <silent> <leader>' /'<CR>:noh<cr>ci'
"nnoremap <silent> <leader>" /"<CR>:noh<cr>ci"
"nnoremap <silent> <leader>} /}<CR>:noh<cr>ci}
"nnoremap <silent> <leader>{ /{<CR>:noh<cr>ci}
"nnoremap <silent> <leader>) /)<CR>:noh<cr>ci)
"nnoremap <silent> <leader>( /(<CR>:noh<cr>ci)
"nnoremap <silent> <leader>[ /[<CR>:noh<cr>ci]
"nnoremap <silent> <leader>] /]<CR>:noh<cr>ci]
"nnoremap <silent> c' /'<CR>:noh<cr>ci'
"nnoremap <silent> c" /"<CR>:noh<cr>ci"
"nnoremap <silent> c} /}<CR>:noh<cr>ci}
"nnoremap <silent> c{ /{<CR>:noh<cr>ci}
"nnoremap <silent> c) /)<CR>:noh<cr>ci)
"nnoremap <silent> c( /(<CR>:noh<cr>ci)
"nnoremap <silent> c[ /[<CR>:noh<cr>ci]
"nnoremap <silent> c] /]<CR>:noh<cr>ci]
"nnoremap <silent> ci' /'<CR>:noh<cr>ci'
"nnoremap <silent> ci" /"<CR>:noh<cr>ci"
"nnoremap <silent> ci} /}<CR>:noh<cr>ci}
"nnoremap <silent> ci{ /{<CR>:noh<cr>ci}
"nnoremap <silent> ci) /)<CR>:noh<cr>ci)
"nnoremap <silent> ci( /(<CR>:noh<cr>ci)
"nnoremap <silent> ci[ /[<CR>:noh<cr>ci]
"nnoremap <silent> ci] /]<CR>:noh<cr>ci]
" Yank inside <token>
nnoremap yw yiw
"nnoremap <silent> y' /'<CR>:noh<cr>yi'
"nnoremap <silent> y" /"<CR>:noh<cr>yi"
"nnoremap <silent> y} /}<CR>:noh<cr>yi}
"nnoremap <silent> y{ /{<CR>:noh<cr>yi}
"nnoremap <silent> y) /)<CR>:noh<cr>yi)
"nnoremap <silent> y( /(<CR>:noh<cr>yi)
"nnoremap <silent> y[ /[<CR>:noh<cr>yi]
"nnoremap <silent> y] /]<CR>:noh<cr>yi]
"nnoremap <silent> yi' /'<CR>:noh<cr>yi'
"nnoremap <silent> yi" /"<CR>:noh<cr>yi"
"nnoremap <silent> yi} /}<CR>:noh<cr>yi}
"nnoremap <silent> yi{ /{<CR>:noh<cr>yi}
"nnoremap <silent> yi) /)<CR>:noh<cr>yi)
"nnoremap <silent> yi( /(<CR>:noh<cr>yi)
"nnoremap <silent> yi[ /[<CR>:noh<cr>yi]
"nnoremap <silent> yi] /]<CR>:noh<cr>yi]
" Yank around <token>
"nnoremap <silent> ya' /'<CR>:noh<cr>ya'
"nnoremap <silent> ya" /"<CR>:noh<cr>ya"
"nnoremap <silent> ya} /}<CR>:noh<cr>ya}
"nnoremap <silent> ya{ /{<CR>:noh<cr>ya}
"nnoremap <silent> ya{ /}<CR>:noh<cr>ya}
"nnoremap <silent> ya) /)<CR>:noh<cr>ya)
"nnoremap <silent> ya( /(<CR>:noh<cr>ya)
"nnoremap <silent> ya[ /[<CR>:noh<cr>ya]
"nnoremap <silent> ya] /]<CR>:noh<cr>ya]
" Delete inside <token>
"nnoremap <silent> d' /'<CR>:noh<cr>di'
"nnoremap <silent> d" /"<CR>:noh<cr>di"
"nnoremap <silent> d} /}<CR>:noh<cr>di}
"nnoremap <silent> d{ /{<CR>:noh<cr>di}
"nnoremap <silent> d) /)<CR>:noh<cr>di)
"nnoremap <silent> d( /(<CR>:noh<cr>di)
"nnoremap <silent> d[ /[<CR>:noh<cr>di]
"nnoremap <silent> d] /]<CR>:noh<cr>di]
" Delete inside
"nnoremap <silent> di' /'<CR>:noh<cr>di'
"nnoremap <silent> di" /"<CR>:noh<cr>di"
"nnoremap <silent> di} /}<CR>:noh<cr>di}
"nnoremap <silent> di{ /{<CR>:noh<cr>di}
"nnoremap <silent> di) /)<CR>:noh<cr>di)
"nnoremap <silent> di( /(<CR>:noh<cr>di)
"nnoremap <silent> di[ /[<CR>:noh<cr>di]
"nnoremap <silent> di] /]<CR>:noh<cr>di]
" Delete around <token>
"nnoremap <silent> da' /'<CR>:noh<cr>da'
"nnoremap <silent> da" /"<CR>:noh<cr>da"
"nnoremap <silent> da} /}<CR>:noh<cr>da}
"nnoremap <silent> da{ /}<CR>:noh<cr>da}
"nnoremap <silent> da{ /{<CR>:noh<cr>da}
"nnoremap <silent> da) /)<CR>:noh<cr>da)
"nnoremap <silent> da( /(<CR>:noh<cr>da)
"nnoremap <silent> da[ /[<CR>:noh<cr>da]
"nnoremap <silent> da] /]<CR>:noh<cr>da]
" Visual
"nnoremap <leader>v viw
"nnoremap vw viw
"nnoremap <silent> vi' /'<CR>:noh<cr>vi'
"nnoremap <silent> vi" /"<CR>:noh<cr>vi"
"nnoremap <silent> vi} /}<CR>:noh<cr>vi}
"nnoremap <silent> vi{ /}<CR>:noh<cr>vi}
"nnoremap <silent> vi{ /{<CR>:noh<cr>vi}
"nnoremap <silent> vi) /)<CR>:noh<cr>vi)
"nnoremap <silent> vi( /(<CR>:noh<cr>vi)
"nnoremap <silent> vi[ /[<CR>:noh<cr>vi]
"nnoremap <silent> vi] /]<CR>:noh<cr>vi]
