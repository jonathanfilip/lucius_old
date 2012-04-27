" Vim configuration file
" Author: Jonathan Filip


" ============================================================================
" Setup: {{{
set nocompatible

" Set location so we can set variables accordingly
let location = "home_osx"
if exists("$CITADEL_ENV")
    if has("win32") || has("win64")
        let location="work_win"
    else
        let location="work_linux"
    endif
elseif has("win32") || has("win64")
    let location="home_win"
endif

function! InLocation(...)
    for l in a:000
        if g:location == l
            return 1
        endif
    endfor
    return 0
endfunction

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" }}}
" ============================================================================


" ============================================================================
" General Options: {{{
    set bomb
    set shortmess=flmnrxIstToO
    set showmode
    set history=1000
    set foldmethod=manual
    set nofoldenable
    set browsedir=buffer
    set shellslash
    set hidden
    set tags=./tags;/.
    set wildignore+=.svn\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd
    set wildignore+=*.obj,*.h5,*.ttf,*.pdf,*.xls,*.pcl,*.gz,*.png
    set wildignore+=*.gif,*.jpg,*.ico,*.bak,*~
    set wildignore+=*.sln,*.csproj,*.resx,*.suo
    set wildignore+=tmp,tags
    if !has("win32") && !has("win64")
        set term=$TERM
        if &term == "screen"
            set term=xterm-256color
        endif
    endif
    if $LUCIUS_STYLE == "light"
        set background=light
        let g:lucius_style = "light"
        colorscheme lucius
    elseif $LUCIUS_STYLE == "dark"
        set background=dark
        let g:lucius_style = "dark"
        colorscheme lucius
    elseif has("gui_running") || &t_Co == 256
        "set background=dark
        "let g:lucius_style = "dark"
        set background=light
        let g:lucius_style = "light"
        colorscheme lucius
    endif
    if !has("gui_running") && has("clipboard")
        set clipboard=unnamed
    endif
" }}}
" ============================================================================


" ============================================================================
" UI Options: {{{
    set cmdheight=1
    set completeopt=longest,menu complete=.,w,b,u
    set confirm
    set guioptions=egc
    set laststatus=2
    set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
    set fillchars=
    set mouse=a mousehide ttymouse=xterm2
    set noequalalways
    set noerrorbells novisualbell
    set ruler showcmd
    set scrollopt=jump,ver,hor
    set showtabline=1
    set sidescroll=10
    set splitbelow splitright
    set statusline=%<%f\ %h%m%r%y[%{&ff}]%=%-14.(%l,%c%V%)\ %P
    set wildmenu wildmode=list:longest,full
    set winminheight=0 winminwidth=0
    if has("gui_running")
        set title
        if InLocation("home_osx")
            set lines=80 columns=200 fuoptions=maxvert,maxhorz
        else
            set lines=50 columns=120
        endif
        if has("gui_win32") || has ("gui_win64")
            set guifont=Consolas:h10
        elseif has("gui_macvim")
            set guifont=Consolas:h13
        endif
    else
        set guioptions+=aA
    endif
" }}}
" ============================================================================


" ============================================================================
" File Options: {{{
    filetype plugin indent on
    set autoread
    set encoding=utf-8
    set fileformats=unix,dos
    set nobackup nowritebackup noswapfile
" }}}
" ============================================================================


" ============================================================================
" Editting Options: {{{
    set autoindent
    set backspace=indent,eol,start
    set expandtab
    set formatoptions=tcrqn
    set nojoinspaces
    set nowrap
    set shiftround
    set showmatch
    set smarttab
    set tabstop=4 softtabstop=4 shiftwidth=4
    set virtualedit=block
    set whichwrap+=<,>,h,l
    syntax on
    if version >= 703
        set cryptmethod=blowfish
    endif
" }}}
" ============================================================================


" ============================================================================
" Search Options: {{{
    set ignorecase
    set incsearch
    set nohlsearch
    set smartcase
" }}}
" ============================================================================


" ============================================================================
" Key Mappings: {{{
    let mapleader = ";"
    let maplocalleader = ";"

    " Indenting in visual mode
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv
    vnoremap > >gv
    vnoremap < <gv

    vnoremap <BS> d
    if InLocation("home_osx")
        inoremap <A-BS> <C-w>
    elseif InLocation("home_win") || InLocation("work_win")
        inoremap <C-BS> <C-w>
    endif

    map <Leader>gq gqap

    " Select up to the next non-text blob
    vmap <C-j> /^[^a-zA-Z0-9]*$<CR>k
    vmap <C-k> ?^[^a-zA-Z0-9]*$<CR>j

    " Buffer contorls
    noremap <silent> <leader>n :bnext<CR>
    noremap <silent> <leader>p :bprev<CR>

    " Diff commands
    noremap <silent> <leader>dt :diffthis<CR>
    noremap <silent> <leader>do :diffoff!<CR>

    " Window control
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-h> <C-w>h
    nmap <C-l> <C-w>l

    " Resize windows
    if has("gui_running")
        nnoremap <S-Up> 10<C-W>+
        nnoremap <S-Down> 10<C-W>-
        nnoremap <S-Left> 10<C-W><
        nnoremap <S-Right> 10<C-W>>
    else
        nnoremap <Up> 10<C-W>+
        nnoremap <Down> 10<C-W>-
        nnoremap <Left> 10<C-W><
        nnoremap <Right> 10<C-W>>
    endif

    " Splitting
    noremap <leader>sp :split<CR>
    noremap <leader>vs :vsplit<CR>

    " Shortcuts for clipboard copy/pasting
    vnoremap zp "*p
    vnoremap zy "*y
    noremap zp "*p
    noremap zy "*y

    " CTRL-A is Select all, etc
    if !InLocation("home_osx")
        noremap <C-A> ggVG
        inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
        cnoremap <C-A> <C-C>gggH<C-O>G
        onoremap <C-A> <C-C>gggH<C-O>G
        snoremap <C-A> <C-C>gggH<C-O>G
        xnoremap <C-A> <C-C>ggVG
        noremap <C-S> :w<CR>
    endif

    " Color scheme
    nnoremap <F2> :LuciusLight<CR>
    nnoremap <S-F2> :LuciusDark<CR>
    nnoremap <C-F2> :LuciusDarkDim<CR>

    " Windows copy, cut, and paste
    if has("win32") || has("win64")
        exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
        exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

        " Fix shift + insert to use the paste scripts too
        imap <S-Insert> <C-V>
        vmap <S-Insert> <C-V>

        " Use CTRL-Q to do what CTRL-V used to do
        noremap <C-Q> <C-V>

        " CTRL-X and SHIFT-Del are Cut
        vnoremap <C-X> "+x
        vnoremap <S-Del> "+x

        " CTRL-C and CTRL-Insert are Copy
        vnoremap <C-C> "+y
        vnoremap <C-Insert> "+y

        " CTRL-V and SHIFT-Insert are Paste
        map <C-V> "+gP
        map <S-Insert> "+gP

        " Command mode paste
        cmap <C-V> <C-R>+
        cmap <S-Insert> <C-R>+
    endif

    " Clumsy Stuff: {{{
        " Don't bring up help on F1
        map <F1> <ESC>
        imap <F1> <ESC>

        " Disable middle mouse button pasting
        " Do this up to a 4-click of the button to be sure
        map <MiddleMouse> <Nop>
        imap <MiddleMouse> <Nop>
        map <2-MiddleMouse> <Nop>
        imap <2-MiddleMouse> <Nop>
        map <3-MiddleMouse> <Nop>
        imap <3-MiddleMouse> <Nop>
        map <4-MiddleMouse> <Nop>
        imap <4-MiddleMouse> <Nop>

        " Get rid of Ex mode
        nnoremap <S-Q> <Q>
    " }}}
" }}}
" ============================================================================


" ============================================================================
" Commands: {{{
    command! -nargs=1 Title :set title titlestring=<args>

    " Strip extra whitespace
    command! Strip %s/\s\+$//

    command! ReloadConfig :source ~/lucius/vimfiles/vimrc.vim
    command! Config :e ~/lucius/vimfiles/vimrc.vim

    command! Notes :cd ~/notes

    " Change directory to current buffer
    command! CD :lcd %:p:h

    command! Pandoc :!pandoc -f markdown -t html -Ss -o ~/out.html %

    " Clumsy Stuff: {{{
        " More lenient to save command
        command! W w
        command! Q q
        command! Wq wq
        command! WQ wq
    " }}}
" }}}
" ============================================================================


" ============================================================================
" Plugin Options: {{{

    " Tags: {{{
        let g:ctags_bin = "ctags"
        if InLocation("work_win")
            let g:ctags_bin = "C:/bin/ctags58/ctags.exe"
        endif
    " }}}

    " VCS: {{{
        let VCSCommandDeleteOnHide = 1
        augroup VCSCommand
            au User VCSBufferCreated set bufhidden=wipe
        augroup END
    " }}}

    " NERD Tree: {{{
        let g:NERDTreeChDirMode = 0
        let g:NERDChristmasTree = 1
        let g:NERDTreeCaseSensitiveSort = 0
        let g:NERDTreeIgnore = ['\.doc$', '\.pdf$', '\.xls$', '\.docx$', 
                    \'\.zip$', '\.dll$', '\.so$', '\.pyc$', '\~$']
        let g:NERDTreeShowHidden = 0
        let g:NERDTreeWinPos = 'left'
        let g:NERDTreeWinSize = 32

        map <F3> :NERDTreeToggle<CR>
        map <C-F3> :NERDTree<CR>
        map <S-F3> :NERDTreeClose<CR>
    " }}}

    " NERD Commenter: {{{
        let NERDShutUp = 1
        let NERDRemoveExtraSpaces=0
    " }}}

    " Tagbar: {{{
        let g:tagbar_compact = 1
        let g:tagbar_iconchars = ['+', '-']
        let g:tagbar_ctags_bin = g:ctags_bin
        map <F4> :TagbarToggle<CR>
    " }}}

    " CtrlP: {{{
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_max_height = 20
        let g:ctrlp_clear_cache_on_exit = 0
        let g:ctrlp_lazy_update = 0
        let g:ctrlp_buftag_ctags_bin = g:ctags_bin
        let g:ctrlp_extensions = ['buffertag']
        let g:ctrlp_custom_ignore = {
                    \ 'dir': 'tests$',
                    \ 'file': '',
                    \ }

        noremap <silent> <leader>ff :CtrlP<CR>
        noremap <silent> <leader>fb :CtrlPBuffer<CR>
        noremap <silent> <leader>fr :CtrlPMRU<CR>
        noremap <silent> <leader>ft :CtrlPBufTag<CR>
    " }}}

    " Dbext: {{{
        let g:dbext_default_prompt_for_parameters = 0
        let g:dbext_default_display_cmd_line = 1
        let g:dbext_default_SQLITE_bin = "sqlite3"
        let g:dbext_default_history_file = "$TMP/dbext_sql_history.txt"
    " }}}

    " SuperTab: {{{
        let SuperTabDefaultCompletionType = "context"
        let SuperTabContextDefaultCompletionType = "<c-n>"
        let SuperTabContextTextOmniPrecedence = ['&completefunc']
        au BufEnter *.md,*.txt,*.wiki :let b:SuperTabNoCompleteAfter = g:SuperTabNoCompleteAfter + ['\.', '\*', '-', ')']
    " }}}

    " Pyflakes: {{{
        let g:pyflakes_use_quickfix = 0
    " }}}

    " SQLUtilities: {{{
        let g:sql_type_default = 'sqlanywhere'
        let g:sqlutil_align_where = 0
        let g:sqlutil_align_comma = 1
        let g:sqlutil_align_first_word = 1
        let g:sqlutil_keyword_case = '\L'
    " }}}

    " Cpp Omnicomplete: {{{
        let OmniCpp_GlobalScopeSearch = 1
        let OmniCpp_NamespaceSearch = 2
        let OmniCpp_ShowPrototypeInAbbr = 1
    " }}}

    " Python: {{{
        let python_highlight_all = 1
        au BufEnter *.py :syntax sync fromstart " helps with ''' comments
    " }}}

    " Lucius: {{{
        command! Tags call lucius#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 0) " current file dir
        command! TagsForce call lucius#GenerateTags(fnamemodify(bufname('%'), \':p:h'), 1) " current file dir, force
        command! TagsCwd call lucius#GenerateTags(getcwd(), 0) " current cwd
        command! TagsCwdForce call lucius#GenerateTags(getcwd(), 1) " cwd, force

        if has("python")
            command! -range EvalPythonRange call lucius#EvaluateCurrentRange()
            map <silent> <F5> :EvalPythonRange<CR>
        endif
    " }}}
" }}}
" ============================================================================


" ============================================================================
" Autocommands: {{{
    " Close the preview window automatically
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " Set xaml to be like xml
    au BufNewFile,BufRead *.xaml setfiletype xml
" }}}
" ============================================================================


" ============================================================================
" Functions: {{{

    " ToggleSearchHighlighting: {{{
        function! ToggleSearchHighlighting()
            if &hls == 0
                set hls
                echo "Search highlighting on."
            else
                set nohls
                echo "Search highlighting off."
            endif
        endfunction
        noremap <C-f> :call ToggleSearchHighlighting()<CR>
    " }}}

    " ToggleFold: {{{
        function! ToggleFold()
            if &foldenable == 1
            "if &foldmethod == "manual"
                set nofoldenable
                echo "Folding disabled."
                "echo "Fold on marker."
            else
                set foldenable
                echo "Folding enabled."
                "echo "Fold manually."
            endif
        endfunction
        nnoremap <F9> :call ToggleFold()<CR>
    " }}}

    " ToggleTextWidth: {{{
        function! ToggleTextWidth()
            if &tw == 0
                set tw=79
                echo "Text width set to 79."
            else
                set tw=0
                echo "Text width set to 0."
            endif
        endfunction
        nnoremap <silent> <F10> :call ToggleTextWidth()<CR>
    " }}}

    " ToggleWrap: {{{
        function! ToggleWrap()
            if &wrap == 0 && &linebreak == 0
                set wrap linebreak
                echo "Wrapping on."
            else
                set nowrap nolinebreak
                echo "Wrapping off."
            endif
        endfunction
        nnoremap <S-F10> :call ToggleWrap()<CR>
    " }}}

    " ToggleSpellCheck: {{{
        function! ToggleSpellCheck()
            if &spell == 0
                set spell
                echo "Spell check on."
            else
                set nospell
                echo "Spell check off."
            endif
        endfunction
        nnoremap <silent> <F11> :call ToggleSpellCheck()<CR>
    " }}}

    " ToggleScrollbars: {{{
        function! ToggleScrollbars()
            if &guioptions =~ "rb"
                set guioptions-=rb
                echo "Scrollbars off."
            else
                set guioptions+=rb
                echo "Scrollbars on."
            endif
        endfunction
        nnoremap <F12> :call ToggleScrollbars()<CR>
    " }}}

    " EditColors: {{{
        function! EditColors()
            execute 'e ~/lucius/vimfiles/colors/lucius.vim'
            execute 'so $VIMRUNTIME/syntax/hitest.vim'
            execute 'wincmd L'
            execute 'help syntax'
            execute 'wincmd ='
            execute '10wincmd +'
            execute '219'
            normal! zt
            execute 'wincmd h'
            execute 'set title titlestring=Colors'
        endfunction
        command! Colors call EditColors()
    " }}}

    " UseWorkSettings: {{{
        function! UseWorkSettings()
            au BufNewFile,BufRead *.py set noexpandtab
            au BufNewFile,BufRead *.cpp set noexpandtab
            au BufNewFile,BufRead *.C set noexpandtab
            au BufNewFile,BufRead *.hpp set noexpandtab
            au BufNewFile,BufRead *.H set noexpandtab
            au BufNewFile,BufRead *.cs set noexpandtab
        endfunction
        command! WorkSettings :call UseWorkSettings()
        if InLocation("work_win", "work_linux")
            WorkSettings
        endif
    " }}}

    " ScratchBuffer: {{{
        function! ScratchBuffer(buf_name)
            "exec "silent! e "
            exec "silent! e " . a:buf_name
            setlocal buftype=nofile bufhidden=hide noswapfile nowrap
        endfunction
        command! -nargs=1 CreateScratchBuffer call ScratchBuffer(<args>)
    " }}}

    " LoadDatabase: {{{
        let databases = {}
        function! LoadDatabase(...)
            call ScratchBuffer("[" . a:1 . "]")
            exec "set title titlestring=" . a:1
            exec "DBSetOption " . g:databases[a:1]
            setlocal filetype=sql
            let b:sql_type_override = 'sqlanywhere'
        endfunction
        function! DatabaseComplete(A,L,P)
            return join(keys(g:databases), "\n")
        endfunction
        command! -nargs=1 -complete=custom,DatabaseComplete Database :call 
                    \LoadDatabase(<q-args>)
        command! -nargs=1 -complete=custom,DatabaseComplete Data :call 
                    \LoadDatabase(<q-args>)
    " }}}

    " LoadSqlite: {{{
        function! LoadSqlite(path)
            let path = substitute(a:path, ':', '\\:', "g")
            call ScratchBuffer("[SQLITE]")
            exec "set title titlestring=SQLITE"
            let cmdStr = 'DBSetOption type=SQLITE:dbname=' . path . 
                        \':user=jfilip:passwd=jfilip'
            exec cmdStr
            setlocal filetype=sql
        endfunction
        command! -nargs=1 -complete=file Sqlite :call LoadSqlite(<q-args>)
    " }}}

    " LoadProject: {{{
        let projects = {}
        function! LoadProject(...)
            exec "silent cd " . g:projects[a:1]
            exec "silent set title titlestring=" . a:1
            echo a:1 . " project loaded."
        endfunction
        function! ProjectComplete(A,L,P)
            return join(keys(g:projects), "\n")
        endfunction
        command! -nargs=1 -complete=custom,ProjectComplete Project :call 
                    \LoadProject(<q-args>)
        command! -nargs=1 -complete=custom,ProjectComplete Proj :call 
                    \LoadProject(<q-args>)
    " }}}
" }}}
" ============================================================================


" ============================================================================
" Local Settings: {{{
if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif
" }}}
" ============================================================================


" vim: foldmethod=marker

