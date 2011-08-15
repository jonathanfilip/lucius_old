" Jonathan Filip's Vim configuration file

set nocompatible

" Set location so we can set variables accordingly
let location = "osx_home"
if $USERDOMAIN == "CITADEL"
    let location="windows_work"
elseif $RUNTIME == "/cigdev/" || $RUNTIME == "/cigprod/" || $RUNTIME == "/cigdev64/" || $RUNTIME == "/cigprod64/"
    let location="linux_work"
elseif $MYVIMRC == "/Users/jonathanfilip/.vimrc"
    let location="osx_home"
else
    let location="windows_home"
endif

function! InLocation(...)
    for l in a:000
        if g:location == l
            return 1
        endif
    endfor
    return 0
endfunction

if !has("win32") && !has("win64")
    set term=$TERM
endif

set background=light
if has("gui_running") || &t_Co == 256
    let g:lucius_style = "light"
    colorscheme lucius
else
    colorscheme default
endif

if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h10
    elseif has("gui_gtk2")
        set guifont=Consolas\ 13
    elseif has("gui_macvim")
        set guifont=Consolas:h13
    endif
endif


" General Options: {{{
    set shortmess=flmnrxIstToO
    set showmode
    set history=1000
    set foldmethod=manual
    set browsedir=buffer
    set shellslash
    set hidden
    set tags+=./tags,tags,./../tags,./../../tags,./../../../tags,./../../../../tags
" }}}


" UI Options: {{{
    set cmdheight=1
    set completeopt=longest,menu complete=.,w,b,u
    set confirm
    set guioptions=egc
    set laststatus=2
    set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
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
        if InLocation("osx_home")
            set lines=80 columns=200 fuoptions=maxvert,maxhorz
        else
            set lines=50 columns=120
        endif
    else
        set guioptions+=aA
    endif
" }}}


" File Options: {{{
    filetype plugin indent on
    set autoread
    set encoding=utf-8
    set fileformats=unix,dos
    set nobackup nowritebackup noswapfile
" }}}


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


" Search Options: {{{
    set ignorecase
    set incsearch
    set nohlsearch
    set smartcase
" }}}


" Key Mappings: {{{
    let mapleader = ";"
    let maplocalleader = ";"

    " Indenting in visual mode
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv
    vnoremap > >gv
    vnoremap < <gv

    vnoremap <BS> d
    if InLocation("osx_home")
        inoremap <A-BS> <C-w>
    else
        inoremap <C-BS> <C-w>
    endif

    map <Leader>gq gqap

    " Select up to the next non-text blob
    vmap <C-j> /^[^a-zA-Z0-9]*$<CR>k
    vmap <C-k> ?^[^a-zA-Z0-9]*$<CR>j

    " Buffer contorls
    noremap <silent> <leader>n :bnext<CR>
    noremap <silent> <leader>p :bprev<CR>

    " Window control
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-h> <C-w>h
    nmap <C-l> <C-w>l

    " Resize windows
    nnoremap <S-Up> 10<C-W>+
    nnoremap <S-Down> 10<C-W>-
    nnoremap <S-Left> 10<C-W><
    nnoremap <S-Right> 10<C-W>>
    nnoremap <C-S-Up> 1<C-W>+
    nnoremap <C-S-Down> 1<C-W>-
    nnoremap <C-S-Left> 1<C-W><
    nnoremap <C-S-Right> 1<C-W>>

    " Scroll windows
    nnoremap <C-Up> 10<C-y>
    nnoremap <C-Down> 10<C-e>
    nnoremap <C-Left> 20zh
    nnoremap <C-Right> 20zl

    " Splitting
    noremap <leader>sp :new<CR>
    noremap <leader>vs :vnew<CR>

    " Shortcuts for clipboard copy/pasting
    vnoremap zp "*p
    vnoremap zy "*y
    noremap zp "*p
    noremap zy "*y

    " CTRL-A is Select all, etc
    if !InLocation("osx_home")
        noremap <C-A> ggVG
        inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
        cnoremap <C-A> <C-C>gggH<C-O>G
        onoremap <C-A> <C-C>gggH<C-O>G
        snoremap <C-A> <C-C>gggH<C-O>G
        xnoremap <C-A> <C-C>ggVG
        noremap <C-S> :w<CR>
    endif

    " Windows copy, cut, and paste
    if has("win32") or has("win64")
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


" Commands: {{{
    command! -nargs=1 Title :set title titlestring=<args>

    " Strip extra whitespace
    command! Strip %s/\s\+$//

    command! ReloadConfig :source $MYVIMRC
    command! Config :e $MYVIMRC

    " Change directory to current buffer
    command! CD :lcd %:p:h

    command! MaxSize :set columns=9999 lines=9999

    " Clumsy Stuff: {{{
        " More lenient to save command
        command! W w
        command! Q q
        command! Wq wq
        command! WQ wq
    " }}}
" }}}


" Plugin Options: {{{
    " Pathogen: {{{
        call pathogen#runtime_append_all_bundles()
        call pathogen#helptags()
    " }}}

    " VCS: {{{
        let VCSCommandDeleteOnHide = 1
        augroup VCSCommand
            au User VCSBufferCreated set bufhidden=wipe
        augroup END
    " }}}

    " Vimwiki: {{{
        let g:vimwiki_hl_cb_checked = 1 " Comment out checked items
        let g:vimwiki_use_mouse = 0 " Toggle mouse to navigate
        let g:vimwiki_hl_headers = 1
        let g:vimwiki_camel_case = 0
        let g:vimwiki_table_auto_fmt = 0 " Allow tab complete by removing tab table mappings
        let g:vimwiki_valid_html_tags="b,i,s,u,sub,sup,kbd,br,hr,div,center,strong,em,span,a,img,h1,p"
        au BufNewFile,BufRead *.wiki set tw=79

        let wiki = {}
        let wiki.path = '~/wiki/'
        let wiki.path_html = '~/wiki/html/'
        let wiki.index = 'Index'
        let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c#': 'cs', 'C#': 'cs', 'sql': 'sql', 'xml': 'xml'}
        let wiki.maxhi = 1
        let g:vimwiki_list = [wiki]
        if InLocation("osx_home")
            let wiki_info = {}
            let wiki_info.path = '/Volumes/info/'
            let wiki_info.path_html = '/Volumes/info/html/'
            let wiki_info.index = 'Index'
            let wiki_info.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c#': 'cs', 'C#': 'cs', 'sql': 'sql', 'xml': 'xml'}
            let wiki_info.maxhi = 1
            let g:vimwiki_list = [wiki, wiki_info]
        endif
    " }}}

    " NERD Tree: {{{
        let g:NERDTreeChDirMode = 0
        let g:NERDChristmasTree = 1
        let g:NERDTreeCaseSensitiveSort = 0
        let NERDTreeIgnore=['\.doc$', '\.pdf$', '\.xls$', '\.docx$', '\.zip$', '\.dll$', '\.so$', '\.pyc$', '\~$']
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

    " Taglist: {{{
        let Tlist_Ctags_Cmd = g:ctags_path
        let Tlist_Use_Right_Window = 1
        let Tlist_Exit_OnlyWindow = 1
        let Tlist_WinWidth = 32
        let Tlist_Enable_Fold_Column = 0
        let Tlist_Sort_Type = "name"
        let Tlist_Show_One_File = 1
        let g:tlist_python_settings = 'python;c:class;m:member;f:function;i:imports;v:variables'
        let g:tlist_python_settings = 'python;c:class;f:function'

        "map <F4> :TlistToggle<CR>
    " }}}

    " Tagbar: {{{
        let g:tagbar_ctags_bin = g:ctags_path
        map <F4> :TagbarToggle<CR>
    " }}}

    " FuzzyFinder: {{{
        let g:exc_file_ext = '\.(o|exe|dll|bak|orig|swp|so|obj|dll|pyc|pyo|pyd|exe|bak|swp|lib|sln|suo)'
        let g:exc_dotdirs = '(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])'
        let g:exc_dirs = '(^|[/\\])(bin|obj)($|[/\\])'
        let g:ignore_regex = '\v\~$|' . g:exc_file_ext . '|' . g:exc_dotdirs . '|' . g:exc_dirs

        let g:fuf_ignoreCase = 1
        let g:fuf_smartBs = 1
        let g:fuf_file_exclude = g:ignore_regex
        let g:fuf_coveragefile_exclude = g:ignore_regex
        let g:fuf_dir_exclude = '\.svn$'
        let g:fuf_buffer_mruOrder = 0
        let g:fuf_modesDisable = ['mrufile', 'aroundmrufile', 'mrucmd']
        let g:fuf_modesDisable += ['dir', 'bookmarkfile', 'bookmarkdir', 'taggedfile']
        let g:fuf_modesDisable += ['line', 'help', 'givendir', 'givencmd']
        let g:fuf_modesDisable += ['callbackfile', 'callbackitem']
        let g:fuf_buffertag_ctagsPath = g:ctags_path

        noremap <silent> <C-S-]> :FufTagWithCursorWord!<CR>
        noremap <silent> <leader>ff :FufFile<CR>
        noremap <silent> <leader>fb :FufBuffer<CR>
        noremap <silent> <leader>ft :FufBufferTag<CR>
        noremap <silent> <leader>fc :FufCoverageFile<CR>
    " }}}

    " Dbext: {{{
        let g:dbext_default_prompt_for_parameters = 0
        let g:dbext_default_display_cmd_line = 1
        if InLocation("windows_work")
            let g:dbext_default_ASE_bin = 'N:/Sybase/OCS-12_5/bin/isql.exe'
            let g:dbext_default_ASE_bin = 'N:/SYBASE15/OCS-15_0/bin/isql.exe'
            let g:dbext_default_SQLITE_bin = 'C:/bin/sqlite-3_6_16/sqlite3.exe'
        elseif InLocation("linux_work")
            let g:dbext_default_ASE_bin = '/tp64/sybase/OCS-15_0/bin/isql'
            let g:dbext_default_SQLITE_bin = '/tp64/sqlite/3.6.23/bin/sqlite3'
        endif
        let g:dbext_default_history_file = "$HOME/vimfiles/bundle/dbext/dbext_sql_history.txt"
    " }}}

    " SuperTab: {{{
        let SuperTabDefaultCompletionType = "context"
        let SuperTabContextDefaultCompletionType = "<c-n>"
        let SuperTabContextTextOmniPrecedence = ['&completefunc']
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

    " Python Syntax: {{{
        let python_highlight_all = 1
        "let python_print_as_function = 1
    " }}}

" }}}


" Autocommands: {{{
    " Close the preview window automatically
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}}

" Functions: {{{
    " GenerateTags: {{{
        function! GenerateTags(dir, force)
            " dir - directory to start in
            " force - set to 1 if you want to force tags to be in 'dir'
            let running_windows = has("win16") || has("win32") || has("win64")
            let slash = running_windows ? '\' : '/'
            let ftype = getbufvar("%", '&filetype')
            let olddir = getcwd()

            if running_windows
                let root = substitute(a:dir, '\(^[a-zA-Z]:\).*', '\1', '') . '\'
            else
                let root = '/'
            endif

            let tagsfile = a:dir . slash . "tags"
            let tagfilesfile = a:dir . slash . "tagfiles"
            let tagsdir = a:dir
            if a:force != 1
                let curdir = a:dir
                let home = $HOME
                let tag_exists = 0
                while curdir != root && curdir != home
                    let tag_exists = filereadable(curdir . slash . "tags")
                    if tag_exists == 1
                        break
                    endif
                    let pathdirs = split(curdir, slash)
                    if running_windows
                        let curdir = join(pathdirs[0:-2], slash)
                    else
                        let curdir = root . join(pathdirs[0:-2], slash)
                    endif
                endwhile

                if curdir == root || curdir == home
                    let curdir = a:dir
                endif

                let tagsfile = curdir . slash . "tags"
                let tagfilesfile = curdir . slash . "tagfiles"
                let tagsdir = curdir
            endif

            let tagsfile = substitute(tagsfile, "\\", "/", "g")
            let tagfilesfile = substitute(tagfilesfile, "\\", "/", "g")

            let ctags_bin = "ctags"
            if running_windows
                let ctags_bin = "ctags.exe"
            endif
            if exists("g:ctags_path")
                let ctags_bin = g:ctags_path
            endif

            let tag_options = ""
            if ftype == "python"
                let tag_options = " -h .py --languages=python --python-kinds=-i "
            elseif ftype == "cpp"
                let tag_options = " -h .cpp.C.H.hpp.c.h -R --c++-kinds=+p --fields=+fkiasSt --extra=+q --languages=c++ "
            elseif ftype == "cs"
                let tag_options = " -h .cs -R --fields=+fkiasSt --extra=+q --languages=c# "
            endif

            let target = " . "
            if filereadable(tagfilesfile) == 1
                let target = " -L " . tagfilesfile
            endif

            exec "silent cd " . tagsdir
            let cmd = ctags_bin . " -f " . tagsfile . " --recurse=yes --sort=foldcase " . tag_options . target
            echo cmd
            let output = system(cmd)
            exec "silent cd " . olddir

            if output != ""
                echohl WarningMsg
                echomsg cmd
                echomsg output
                echohl None
            endif

            return

        endfunction
        command! Tags call GenerateTags(fnamemodify(bufname('%'), ':p:h'), 0) " current file dir
        command! TagsForce call GenerateTags(fnamemodify(bufname('%'), ':p:h'), 1) " current file dir, force
        command! TagsCwd call GenerateTags(getcwd(), 0) " current cwd
        command! TagsCwdForce call GenerateTags(getcwd(), 1) " current cwd, force
    " }}}

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
        nnoremap <silent> <F9> :call ToggleTextWidth()<CR>
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
        nnoremap <F10> :call ToggleWrap()<CR>
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
            execute 'e ~/vimfiles/colors/lucius.vim'
            execute 'so $VIMRUNTIME/syntax/hitest.vim'
            execute 'wincmd L'
            execute 'help syntax'
            execute 'wincmd ='
            execute '10wincmd +'
            execute '219'
            normal zt
            execute 'wincmd h'
        endfunction
        command! Colors call EditColors()
    " }}}

    " ToggleColors: {{{
        function! ToggleColors()
            if g:lucius_style == "light"
                execute 'LuciusDark'
                echo "LuciusDark."
            else
                execute 'LuciusLight'
                echo "LuciusLight."
            endif
        endfunction
        nnoremap <C-F12> :call ToggleColors()<CR>
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
        if InLocation("windows_work", "linux_work")
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
        endfunction
        function! DatabaseComplete(A,L,P)
            return join(keys(g:databases), "\n")
        endfunction
        command! -nargs=1 -complete=custom,DatabaseComplete Database :call LoadDatabase(<q-args>)
        command! -nargs=1 -complete=custom,DatabaseComplete Data :call LoadDatabase(<q-args>)
    " }}}

    " LoadSqlite: {{{
        function! LoadSqlite(path)
            let path = substitute(a:path, ':', '\\:', "g")
            call ScratchBuffer("[SQLITE]")
            exec "set title titlestring=SQLITE"
            let cmdStr = 'DBSetOption type=SQLITE:dbname=' . path . ':user=jfilip:passwd=jfilip'
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
        command! -nargs=1 -complete=custom,ProjectComplete Project :call LoadProject(<q-args>)
        command! -nargs=1 -complete=custom,ProjectComplete Proj :call LoadProject(<q-args>)
    " }}}
" }}}
