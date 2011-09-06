" Vim autoload for lucius
" Author: Jonathan Filip


" ============================================================================
" Functions: {{{

   " GenerateTags: {{{
        function! GenerateTags(dir, force)
            " dir - directory to start in
            " force - set to 1 if you want to force tags to be in 'dir'
            let running_windows = has("win16") || has("win32") ||
                        \has("win64")
            let slash = running_windows ? '\' : '/'
            let ftype = getbufvar("%", '&filetype')
            let olddir = getcwd()

            if running_windows
                let root = substitute(a:dir, '\(^[a-zA-Z]:\).*', '\1', '') .
                            \'\'
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
            "if exists("g:ctags_path")
            "    let ctags_bin = g:ctags_path
            "endif

            let tag_options = ""
            if ftype == "python"
                let tag_options = " -h .py --languages=python " .
                            \"--python-kinds=-i "
            elseif ftype == "cpp"
                let tag_options = " -h .cpp.C.H.hpp.c.h -R --c++-kinds=+p " .
                            \"--fields=+fkiasSt --extra=+q --languages=c++ "
            elseif ftype == "cs"
                let tag_options = " -h .cs -R --fields=+fkiasSt " .
                            \"--extra=+q --languages=c# "
            endif

            let target = " . "
            if filereadable(tagfilesfile) == 1
                let target = " -L " . tagfilesfile
            endif

            exec "silent cd " . tagsdir
            let cmd = ctags_bin . " -f " . tagsfile . " --recurse=yes " .
                        \"--sort=foldcase " . tag_options . target
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

" }}}
" ============================================================================

