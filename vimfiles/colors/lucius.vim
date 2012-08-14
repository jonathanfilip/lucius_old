" Lucius vim color file
" Maintainer: Jonathan Filip <jfilip1024@gmail.com>
" Version: 7.1.1
"
" Summary:
" Color scheme with dark and light versions (GUI and 256 color terminal).
"
" Description:
" This color scheme was originally created by combining my favorite parts of
" the following color schemes:
"
" * oceandeep (vimscript #368)
" * peaksea (vimscript #760)
" * wombat (vimscript #1778)
" * moria (vimscript #1464)
" * zenburn (vimscript #415)
"
" Version 7 has unified the 256 color terminal and GUI versions (the GUI
" version only uses colors available on the 256 color terminal). The overall
" colors were also toned down a little bit (light version is now a light gray
" instead of white and the dark version is slightly lighter) to make it easier
" on the eyes.
"
" Version 6+ has been revamped a bit from the original color scheme. If you
" prefer the old style, or the 'blue' version, use the 5Final release. Version
" 6+ only has a light and dark version. The new version tries to unify some of
" the colors and also adds more contrast between text and interface.
"
" The color scheme is dark, by default. You can change this by setting the
" g:lucius_style variable to "light", "dark", or "dark_dim". Once the color
" scheme is loaded, you can use the commands "LuciusLight", "LuciusDark", or
" "LuciusDarkDim" to change schemes quickly.
"
" Screenshots of version 7:
"
" * Dark: http://i.imgur.com/tgUsz.png
" * DarkDim: http://i.imgur.com/0bOCv.png
" * Light: http://i.imgur.com/ndd9A.png
"
" Screenshots of version 6:
"
" * Dark: http://i.imgur.com/IzYcB.png
" * Light: http://i.imgur.com/kfJcm.png
"
" Screenshots of the version 5Final:
"
" * Dark: http://i.imgur.com/z0bDr.png
" * Light: http://i.imgur.com/BXDiv.png
" * Blue: http://i.imgur.com/Ea1Gq.png
"
" colorsupport.vim (vimscript #2682) is used to help with mapping the GUI
" settings to the 256 terminal colors.
"
" This color scheme also has custom colors defined for the following plugins:
"
" * tagbar (vimscript #3465)
"
" Installation:
" Copy the file to your vim colors directory and then do :colorscheme lucius.


hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="lucius"

set background=dark
if exists("g:lucius_style")
    if g:lucius_style == "light"
        set background=light
    endif
else
    let g:lucius_style = "dark"
endif

if !exists("g:lucius_use_underline")
    let g:lucius_use_underline = 1
endif

if !exists("g:lucius_use_bold")
    let g:lucius_use_bold = 1
endif

if !exists("g:lucius_use_undercurl")
    let g:lucius_use_undercurl = 1
endif


let s:color_map = {
            \ '000000':  '16', '00005f':  '17', '000087':  '18', '0000af':  '19', '0000d7':  '20',
            \ '0000ff':  '21', '005f00':  '22', '005f5f':  '23', '005f87':  '24', '005faf':  '25',
            \ '005fd7':  '26', '005fff':  '27', '008700':  '28', '00875f':  '29', '008787':  '30',
            \ '0087af':  '31', '0087d7':  '32', '0087ff':  '33', '00af00':  '34', '00af5f':  '35',
            \ '00af87':  '36', '00afaf':  '37', '00afd7':  '38', '00afff':  '39', '00d700':  '40',
            \ '00d75f':  '41', '00d787':  '42', '00d7af':  '43', '00d7d7':  '44', '00d7ff':  '45',
            \ '00ff00':  '46', '00ff5f':  '47', '00ff87':  '48', '00ffaf':  '49', '00ffd7':  '50',
            \ '00ffff':  '51', '5f0000':  '52', '5f005f':  '53', '5f0087':  '54', '5f00af':  '55',
            \ '5f00d7':  '56', '5f00ff':  '57', '5f5f00':  '58', '5f5f5f':  '59', '5f5f87':  '60',
            \ '5f5faf':  '61', '5f5fd7':  '62', '5f5fff':  '63', '5f8700':  '64', '5f875f':  '65',
            \ '5f8787':  '66', '5f87af':  '67', '5f87d7':  '68', '5f87ff':  '69', '5faf00':  '70',
            \ '5faf5f':  '71', '5faf87':  '72', '5fafaf':  '73', '5fafd7':  '74', '5fafff':  '75',
            \ '5fd700':  '76', '5fd75f':  '77', '5fd787':  '78', '5fd7af':  '79', '5fd7d7':  '80',
            \ '5fd7ff':  '81', '5fff00':  '82', '5fff5f':  '83', '5fff87':  '84', '5fffaf':  '85',
            \ '5fffd7':  '86', '5fffff':  '87', '870000':  '88', '87005f':  '89', '870087':  '90',
            \ '8700af':  '91', '8700d7':  '92', '8700ff':  '93', '875f00':  '94', '875f5f':  '95',
            \ '875f87':  '96', '875faf':  '97', '875fd7':  '98', '875fff':  '99', '878700': '100',
            \ '87875f': '101', '878787': '102', '8787af': '103', '8787d7': '104', '8787ff': '105',
            \ '87af00': '106', '87af5f': '107', '87af87': '108', '87afaf': '109', '87afd7': '110',
            \ '87afff': '111', '87d700': '112', '87d75f': '113', '87d787': '114', '87d7af': '115',
            \ '87d7d7': '116', '87d7ff': '117', '87ff00': '118', '87ff5f': '119', '87ff87': '120',
            \ '87ffaf': '121', '87ffd7': '122', '87ffff': '123', 'af0000': '124', 'af005f': '125',
            \ 'af0087': '126', 'af00af': '127', 'af00d7': '128', 'af00ff': '129', 'af5f00': '130',
            \ 'af5f5f': '131', 'af5f87': '132', 'af5faf': '133', 'af5fd7': '134', 'af5fff': '135',
            \ 'af8700': '136', 'af875f': '137', 'af8787': '138', 'af87af': '139', 'af87d7': '140',
            \ 'af87ff': '141', 'afaf00': '142', 'afaf5f': '143', 'afaf87': '144', 'afafaf': '145',
            \ 'afafd7': '146', 'afafff': '147', 'afd700': '148', 'afd75f': '149', 'afd787': '150',
            \ 'afd7af': '151', 'afd7d7': '152', 'afd7ff': '153', 'afff00': '154', 'afff5f': '155',
            \ 'afff87': '156', 'afffaf': '157', 'afffd7': '158', 'afffff': '159', 'd70000': '160',
            \ 'd7005f': '161', 'd70087': '162', 'd700af': '163', 'd700d7': '164', 'd700ff': '165',
            \ 'd75f00': '166', 'd75f5f': '167', 'd75f87': '168', 'd75faf': '169', 'd75fd7': '170',
            \ 'd75fff': '171', 'd78700': '172', 'd7875f': '173', 'd78787': '174', 'd787af': '175',
            \ 'd787d7': '176', 'd787ff': '177', 'd7af00': '178', 'd7af5f': '179', 'd7af87': '180',
            \ 'd7afaf': '181', 'd7afd7': '182', 'd7afff': '183', 'd7d700': '184', 'd7d75f': '185',
            \ 'd7d787': '186', 'd7d7af': '187', 'd7d7d7': '188', 'd7d7ff': '189', 'd7ff00': '190',
            \ 'd7ff5f': '191', 'd7ff87': '192', 'd7ffaf': '193', 'd7ffd7': '194', 'd7ffff': '195',
            \ 'ff0000': '196', 'ff005f': '197', 'ff0087': '198', 'ff00af': '199', 'ff00d7': '200',
            \ 'ff00ff': '201', 'ff5f00': '202', 'ff5f5f': '203', 'ff5f87': '204', 'ff5faf': '205',
            \ 'ff5fd7': '206', 'ff5fff': '207', 'ff8700': '208', 'ff875f': '209', 'ff8787': '210',
            \ 'ff87af': '211', 'ff87d7': '212', 'ff87ff': '213', 'ffaf00': '214', 'ffaf5f': '215',
            \ 'ffaf87': '216', 'ffafaf': '217', 'ffafd7': '218', 'ffafff': '219', 'ffd700': '220',
            \ 'ffd75f': '221', 'ffd787': '222', 'ffd7af': '223', 'ffd7d7': '224', 'ffd7ff': '225',
            \ 'ffff00': '226', 'ffff5f': '227', 'ffff87': '228', 'ffffaf': '229', 'ffffd7': '230',
            \ 'ffffff': '231', '080808': '232', '121212': '233', '1c1c1c': '234', '262626': '235',
            \ '303030': '236', '3a3a3a': '237', '444444': '238', '4e4e4e': '239', '585858': '240',
            \ '626262': '241', '6c6c6c': '242', '767676': '243', '808080': '244', '8a8a8a': '245',
            \ '949494': '246', '9e9e9e': '247', 'a8a8a8': '248', 'b2b2b2': '249', 'bcbcbc': '250',
            \ 'c6c6c6': '251', 'd0d0d0': '252', 'dadada': '253', 'e4e4e4': '254', 'eeeeee': '255',
            \ 'bg': 'bg', 'fg': 'fg', 'NONE': 'NONE',
            \ }




if g:lucius_style == "dark"

" LuciusDark:
    hi Normal       guifg=#d7d7d7   guibg=#303030   ctermfg=188    ctermbg=236
    hi Comment      guifg=#808080   guibg=NONE      ctermfg=244    ctermbg=NONE
    hi Constant     guifg=#d7d7af   guibg=NONE      ctermfg=187    ctermbg=NONE
    hi Identifier   guifg=#afd787   guibg=NONE      ctermfg=150    ctermbg=NONE
    hi Statement    guifg=#87d7ff   guibg=NONE      ctermfg=117    ctermbg=NONE
    hi PreProc      guifg=#87d7af   guibg=NONE      ctermfg=115    ctermbg=NONE
    hi Type         guifg=#87d7d7   guibg=NONE      ctermfg=116    ctermbg=NONE
    hi Special      guifg=#d7afd7   guibg=NONE      ctermfg=182    ctermbg=NONE

    " Text Markup:
    hi Underlined   guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Error        guifg=#ff8787   guibg=#870000   ctermfg=210    ctermbg=88
    hi Todo         guifg=#d7d75f   guibg=#5f5f00   ctermfg=185    ctermbg=58
    hi MatchParen   guifg=bg        guibg=#afd75f   ctermfg=bg     ctermbg=149
    hi NonText      guifg=#5f5f87   guibg=NONE      ctermfg=60     ctermbg=NONE
    hi SpecialKey   guifg=#5f875f   guibg=NONE      ctermfg=65     ctermbg=NONE
    hi Title        guifg=#5fafd7   guibg=NONE      ctermfg=74     ctermbg=NONE

    " Text Selection:
    hi Cursor       guifg=bg        guibg=#87afd7   ctermfg=bg     ctermbg=110
    hi CursorIM     guifg=bg        guibg=#87afd7   ctermfg=bg     ctermbg=110
    hi CursorColumn guifg=NONE      guibg=#444444   ctermfg=NONE   ctermbg=238
    hi CursorLine   guifg=NONE      guibg=#444444   ctermfg=NONE   ctermbg=238
    hi Visual       guifg=NONE      guibg=#005f87   ctermfg=NONE   ctermbg=24
    hi VisualNOS    guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi IncSearch    guifg=bg        guibg=#57d7d7   ctermfg=bg     ctermbg=80
    hi Search       guifg=bg        guibg=#d78700   ctermfg=bg     ctermbg=172

    " UI:
    hi Pmenu        guifg=bg        guibg=#b2b2b2   ctermfg=bg     ctermbg=249
    hi PmenuSel     guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi PmenuSbar    guifg=#b2b2b2   guibg=#d0d0d0   ctermfg=249    ctermbg=252
    hi PmenuThumb   guifg=fg        guibg=#808080   ctermfg=fg     ctermbg=244
    hi StatusLine   guifg=bg        guibg=#b2b2b2   ctermfg=bg     ctermbg=249
    hi StatusLineNC guifg=#444444   guibg=#b2b2b2   ctermfg=238    ctermbg=249
    hi TabLine      guifg=bg        guibg=#b2b2b2   ctermfg=bg     ctermbg=249
    hi TabLineFill  guifg=#444444   guibg=#b2b2b2   ctermfg=238    ctermbg=249
    hi TabLineSel   guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi VertSplit    guifg=#626262   guibg=#b2b2b2   ctermfg=241    ctermbg=249
    hi Folded       guifg=#bcbcbc   guibg=#4e4e4e   ctermfg=250    ctermbg=239
    hi FoldColumn   guifg=#bcbcbc   guibg=#4e4e4e   ctermfg=250    ctermbg=239

    " Spelling:
    hi SpellBad     guisp=#d70000                   ctermfg=160    ctermbg=NONE
    hi SpellCap     guisp=#00afd7                   ctermfg=38     ctermbg=NONE
    hi SpellRare    guisp=#5faf00                   ctermfg=70     ctermbg=NONE
    hi SpellLocal   guisp=#d7af00                   ctermfg=178    ctermbg=NONE

    " Diff:
    hi DiffAdd      guifg=fg        guibg=#5f875f   ctermfg=fg     ctermbg=65
    hi DiffChange   guifg=fg        guibg=#87875f   ctermfg=fg     ctermbg=101
    hi DiffDelete   guifg=fg        guibg=#875f5f   ctermfg=fg     ctermbg=95
    hi DiffText     guifg=#ffff87   guibg=#87875f   ctermfg=228    ctermbg=101

    " Misc:
    hi Directory    guifg=#afd7af   guibg=NONE      ctermfg=151    ctermbg=NONE
    hi ErrorMsg     guifg=#ff5f5f   guibg=NONE      ctermfg=203    ctermbg=NONE
    hi SignColumn   guifg=#b2b2b2   guibg=#4e4e4e   ctermfg=249    ctermbg=239
    hi LineNr       guifg=#626262   guibg=#444444   ctermfg=241    ctermbg=238
    hi CursorLineNr guifg=#626262   guibg=#444444   ctermfg=241    ctermbg=238
    hi MoreMsg      guifg=#5fd7d7   guibg=NONE      ctermfg=80     ctermbg=NONE
    hi ModeMsg      guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Question     guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi WarningMsg   guifg=#d7875f   guibg=NONE      ctermfg=173    ctermbg=NONE
    hi WildMenu     guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi ColorColumn  guifg=NONE      guibg=#87875f   ctermfg=NONE   ctermbg=101
    hi Ignore       guifg=bg                        ctermfg=bg

elseif g:lucius_style == "dark_dim"

" LuciusDarkDim:
    hi Normal       guifg=#bcbcbc   guibg=#303030   ctermfg=250    ctermbg=236
    hi Comment      guifg=#6c6c6c   guibg=NONE      ctermfg=242    ctermbg=NONE
    hi Constant     guifg=#afaf87   guibg=NONE      ctermfg=144    ctermbg=NONE
    hi Identifier   guifg=#87af5f   guibg=NONE      ctermfg=107    ctermbg=NONE
    hi Statement    guifg=#5fafd7   guibg=NONE      ctermfg=74     ctermbg=NONE
    hi PreProc      guifg=#5faf87   guibg=NONE      ctermfg=72     ctermbg=NONE
    hi Type         guifg=#5fafaf   guibg=NONE      ctermfg=73     ctermbg=NONE
    hi Special      guifg=#af87af   guibg=NONE      ctermfg=139    ctermbg=NONE

    " Text Markup:
    hi Underlined   guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Error        guifg=#d75f5f   guibg=#870000   ctermfg=167    ctermbg=88
    hi Todo         guifg=#afaf00   guibg=#5f5f00   ctermfg=142    ctermbg=58
    hi MatchParen   guifg=bg        guibg=#87af5f   ctermfg=bg     ctermbg=107
    hi NonText      guifg=#5f5f87   guibg=NONE      ctermfg=60     ctermbg=NONE
    hi SpecialKey   guifg=#5f875f   guibg=NONE      ctermfg=65     ctermbg=NONE
    hi Title        guifg=#00afd7   guibg=NONE      ctermfg=38     ctermbg=NONE

    " Text Selection:
    hi Cursor       guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67
    hi CursorIM     guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67
    hi CursorColumn guifg=NONE      guibg=#444444   ctermfg=NONE   ctermbg=238
    hi CursorLine   guifg=NONE      guibg=#444444   ctermfg=NONE   ctermbg=238
    hi Visual       guifg=NONE      guibg=#005f87   ctermfg=NONE   ctermbg=24
    hi VisualNOS    guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi IncSearch    guifg=bg        guibg=#00afaf   ctermfg=bg     ctermbg=37
    hi Search       guifg=bg        guibg=#d78700   ctermfg=bg     ctermbg=172

    " UI:
    hi Pmenu        guifg=bg        guibg=#8a8a8a   ctermfg=bg     ctermbg=245
    hi PmenuSel     guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi PmenuSbar    guifg=#8a8a8a   guibg=#bcbcbc   ctermfg=245    ctermbg=250
    hi PmenuThumb   guifg=fg        guibg=#585858   ctermfg=fg     ctermbg=240
    hi StatusLine   guifg=bg        guibg=#8a8a8a   ctermfg=bg     ctermbg=245
    hi StatusLineNC guifg=#444444   guibg=#8a8a8a   ctermfg=238    ctermbg=245
    hi TabLine      guifg=bg        guibg=#8a8a8a   ctermfg=bg     ctermbg=245
    hi TabLineFill  guifg=#444444   guibg=#8a8a8a   ctermfg=238    ctermbg=245
    hi TabLineSel   guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi VertSplit    guifg=#626262   guibg=#8a8a8a   ctermfg=241    ctermbg=245
    hi Folded       guifg=#a8a8a8   guibg=#4e4e4e   ctermfg=248    ctermbg=239
    hi FoldColumn   guifg=#a8a8a8   guibg=#4e4e4e   ctermfg=248    ctermbg=239

    " Spelling:
    hi SpellBad     guisp=#d70000                   ctermfg=160    ctermbg=NONE
    hi SpellCap     guisp=#00afd7                   ctermfg=38     ctermbg=NONE
    hi SpellRare    guisp=#5faf00                   ctermfg=70     ctermbg=NONE
    hi SpellLocal   guisp=#d7af00                   ctermfg=178    ctermbg=NONE

    " Diff:
    hi DiffAdd      guifg=fg        guibg=#5f875f   ctermfg=fg     ctermbg=65
    hi DiffChange   guifg=fg        guibg=#87875f   ctermfg=fg     ctermbg=101
    hi DiffDelete   guifg=fg        guibg=#875f5f   ctermfg=fg     ctermbg=95
    hi DiffText     guifg=#d7d75f   guibg=#87875f   ctermfg=185    ctermbg=101

    " Misc:
    hi Directory    guifg=#87af87   guibg=NONE      ctermfg=108    ctermbg=NONE
    hi ErrorMsg     guifg=#d75f5f   guibg=NONE      ctermfg=167    ctermbg=NONE
    hi SignColumn   guifg=#8a8a8a   guibg=#4e4e4e   ctermfg=245    ctermbg=239
    hi LineNr       guifg=#626262   guibg=#444444   ctermfg=241    ctermbg=238
    hi CursorLineNr guifg=#626262   guibg=#444444   ctermfg=241    ctermbg=238
    hi MoreMsg      guifg=#00afaf   guibg=NONE      ctermfg=37     ctermbg=NONE
    hi ModeMsg      guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Question     guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi WarningMsg   guifg=#af875f   guibg=NONE      ctermfg=173    ctermbg=NONE
    hi WildMenu     guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi ColorColumn  guifg=NONE      guibg=#87875f   ctermfg=NONE   ctermbg=101
    hi Ignore       guifg=bg                        ctermfg=bg

elseif g:lucius_style == "black"

" LuciusBlack:
    hi Normal       guifg=#b2b2b2   guibg=#121212   ctermfg=249    ctermbg=233
    hi Comment      guifg=#585858   guibg=NONE      ctermfg=240    ctermbg=NONE
    hi Constant     guifg=#afaf87   guibg=NONE      ctermfg=144    ctermbg=NONE
    hi Identifier   guifg=#87af5f   guibg=NONE      ctermfg=107    ctermbg=NONE
    hi Statement    guifg=#5fafd7   guibg=NONE      ctermfg=74     ctermbg=NONE
    hi PreProc      guifg=#5faf87   guibg=NONE      ctermfg=72     ctermbg=NONE
    hi Type         guifg=#5fafaf   guibg=NONE      ctermfg=73     ctermbg=NONE
    hi Special      guifg=#af87af   guibg=NONE      ctermfg=139    ctermbg=NONE

    " Text Markup:
    hi Underlined   guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Error        guifg=#d75f5f   guibg=#870000   ctermfg=167    ctermbg=88
    hi Todo         guifg=#afaf00   guibg=#5f5f00   ctermfg=142    ctermbg=58
    hi MatchParen   guifg=bg        guibg=#87af5f   ctermfg=bg     ctermbg=107
    hi NonText      guifg=#5f5f87   guibg=NONE      ctermfg=60     ctermbg=NONE
    hi SpecialKey   guifg=#5f875f   guibg=NONE      ctermfg=65     ctermbg=NONE
    hi Title        guifg=#00afd7   guibg=NONE      ctermfg=38     ctermbg=NONE

    " Text Selection:
    hi Cursor       guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67
    hi CursorIM     guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67
    hi CursorColumn guifg=NONE      guibg=#444444   ctermfg=NONE   ctermbg=238
    hi CursorLine   guifg=NONE      guibg=#444444   ctermfg=NONE   ctermbg=238
    hi Visual       guifg=NONE      guibg=#005f87   ctermfg=NONE   ctermbg=24
    hi VisualNOS    guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi IncSearch    guifg=bg        guibg=#00afaf   ctermfg=bg     ctermbg=37
    hi Search       guifg=bg        guibg=#d78700   ctermfg=bg     ctermbg=172

    " UI:
    hi Pmenu        guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=245
    hi PmenuSel     guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi PmenuSbar    guifg=#808080   guibg=#bcbcbc   ctermfg=245    ctermbg=250
    hi PmenuThumb   guifg=fg        guibg=#585858   ctermfg=fg     ctermbg=240
    hi StatusLine   guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=245
    hi StatusLineNC guifg=#444444   guibg=#808080   ctermfg=238    ctermbg=245
    hi TabLine      guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=245
    hi TabLineFill  guifg=#444444   guibg=#808080   ctermfg=238    ctermbg=245
    hi TabLineSel   guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi VertSplit    guifg=#626262   guibg=#808080   ctermfg=241    ctermbg=245
    hi Folded       guifg=#a8a8a8   guibg=#4e4e4e   ctermfg=248    ctermbg=239
    hi FoldColumn   guifg=#a8a8a8   guibg=#4e4e4e   ctermfg=248    ctermbg=239

    " Spelling:
    hi SpellBad     guisp=#d70000                   ctermfg=160    ctermbg=NONE
    hi SpellCap     guisp=#00afd7                   ctermfg=38     ctermbg=NONE
    hi SpellRare    guisp=#5faf00                   ctermfg=70     ctermbg=NONE
    hi SpellLocal   guisp=#d7af00                   ctermfg=178    ctermbg=NONE

    " Diff:
    hi DiffAdd      guifg=fg        guibg=#5f875f   ctermfg=fg     ctermbg=65
    hi DiffChange   guifg=fg        guibg=#87875f   ctermfg=fg     ctermbg=101
    hi DiffDelete   guifg=fg        guibg=#875f5f   ctermfg=fg     ctermbg=95
    hi DiffText     guifg=#d7d75f   guibg=#87875f   ctermfg=185    ctermbg=101

    " Misc:
    hi Directory    guifg=#87af87   guibg=NONE      ctermfg=108    ctermbg=NONE
    hi ErrorMsg     guifg=#d75f5f   guibg=NONE      ctermfg=167    ctermbg=NONE
    hi SignColumn   guifg=#808080   guibg=#4e4e4e   ctermfg=245    ctermbg=239
    hi LineNr       guifg=#626262   guibg=#444444   ctermfg=241    ctermbg=238
    hi CursorLineNr guifg=#626262   guibg=#444444   ctermfg=241    ctermbg=238
    hi MoreMsg      guifg=#00afaf   guibg=NONE      ctermfg=37     ctermbg=NONE
    hi ModeMsg      guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Question     guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi WarningMsg   guifg=#af875f   guibg=NONE      ctermfg=173    ctermbg=NONE
    hi WildMenu     guifg=fg        guibg=#005f87   ctermfg=fg     ctermbg=24
    hi ColorColumn  guifg=NONE      guibg=#87875f   ctermfg=NONE   ctermbg=101
    hi Ignore       guifg=bg                        ctermfg=bg


elseif g:lucius_style == "light"

" LuciusLight:
    hi Normal       guifg=#444444   guibg=#eeeeee   ctermfg=238    ctermbg=255
    hi Comment      guifg=#808080   guibg=NONE      ctermfg=244    ctermbg=NONE
    hi Constant     guifg=#af5f00   guibg=NONE      ctermfg=130    ctermbg=NONE
    hi Identifier   guifg=#008700   guibg=NONE      ctermfg=28     ctermbg=NONE
    hi Statement    guifg=#005faf   guibg=NONE      ctermfg=25     ctermbg=NONE
    hi PreProc      guifg=#008787   guibg=NONE      ctermfg=30     ctermbg=NONE
    hi Type         guifg=#005f87   guibg=NONE      ctermfg=24     ctermbg=NONE
    hi Special      guifg=#870087   guibg=NONE      ctermfg=90     ctermbg=NONE

    " Text Markup:
    hi Underlined   guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Error        guifg=#af0000   guibg=#d7afaf   ctermfg=124    ctermbg=181
    hi Todo         guifg=#875f00   guibg=#ffffaf   ctermfg=94     ctermbg=229
    hi MatchParen   guifg=NONE      guibg=#5fd7d7   ctermfg=NONE   ctermbg=80
    hi NonText      guifg=#afafd7   guibg=NONE      ctermfg=146    ctermbg=NONE
    hi SpecialKey   guifg=#afd7af   guibg=NONE      ctermfg=151    ctermbg=NONE
    hi Title        guifg=#005faf   guibg=NONE      ctermfg=25     ctermbg=NONE

    " Text Selection:
    hi Cursor       guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67
    hi CursorIM     guifg=bg        guibg=#5f87af   ctermfg=bg     ctermbg=67
    hi CursorColumn guifg=NONE      guibg=#dadada   ctermfg=NONE   ctermbg=253
    hi CursorLine   guifg=NONE      guibg=#dadada   ctermfg=NONE   ctermbg=253
    hi Visual       guifg=NONE      guibg=#afd7ff   ctermfg=NONE   ctermbg=153
    hi VisualNOS    guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi IncSearch    guifg=fg        guibg=#57d7d7   ctermfg=fg     ctermbg=80
    hi Search       guifg=fg        guibg=#ffaf00   ctermfg=fg     ctermbg=214

    " UI:
    hi Pmenu        guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=244
    hi PmenuSel     guifg=fg        guibg=#afd7ff   ctermfg=fg     ctermbg=153
    hi PmenuSbar    guifg=#808080   guibg=#444444   ctermfg=244    ctermbg=238
    hi PmenuThumb   guifg=fg        guibg=#9e9e9e   ctermfg=fg     ctermbg=247
    hi StatusLine   guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=244
    hi StatusLineNC guifg=#e4e4e4   guibg=#808080   ctermfg=254    ctermbg=244
    hi TabLine      guifg=bg        guibg=#808080   ctermfg=bg     ctermbg=244
    hi TabLineFill  guifg=#b2b2b2   guibg=#808080   ctermfg=249    ctermbg=244
    hi TabLineSel   guifg=fg        guibg=#afd7ff   ctermfg=fg     ctermbg=153
    hi VertSplit    guifg=#e4e4e4   guibg=#808080   ctermfg=254    ctermbg=244
    hi Folded       guifg=#626262   guibg=#bcbcbc   ctermfg=241    ctermbg=250
    hi FoldColumn   guifg=#626262   guibg=#bcbcbc   ctermfg=241    ctermbg=250

    " Spelling:
    hi SpellBad     guisp=#d70000                   ctermfg=160    ctermbg=NONE
    hi SpellCap     guisp=#00afd7                   ctermfg=38     ctermbg=NONE
    hi SpellRare    guisp=#5faf00                   ctermfg=70     ctermbg=NONE
    hi SpellLocal   guisp=#d7af00                   ctermfg=178    ctermbg=NONE

    " Diff:
    hi DiffAdd      guifg=fg        guibg=#afd7af   ctermfg=fg     ctermbg=151
    hi DiffChange   guifg=fg        guibg=#d7d7af   ctermfg=fg     ctermbg=187
    hi DiffDelete   guifg=fg        guibg=#d7afaf   ctermfg=fg     ctermbg=181
    hi DiffText     guifg=#d75f00   guibg=#d7d7af   ctermfg=166    ctermbg=187

    " Misc:
    hi Directory    guifg=#00875f   guibg=NONE      ctermfg=29     ctermbg=NONE
    hi ErrorMsg     guifg=#af0000   guibg=NONE      ctermfg=124    ctermbg=NONE
    hi SignColumn   guifg=#626262   guibg=#d0d0d0   ctermfg=241    ctermbg=252
    hi LineNr       guifg=#9e9e9e   guibg=#dadada   ctermfg=247    ctermbg=253
    hi CursorLineNr guifg=#9e9e9e   guibg=#dadada   ctermfg=247    ctermbg=253
    hi MoreMsg      guifg=#005fd7   guibg=NONE      ctermfg=26     ctermbg=NONE
    hi ModeMsg      guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi Question     guifg=fg        guibg=NONE      ctermfg=fg     ctermbg=NONE
    hi WarningMsg   guifg=#af5700   guibg=NONE      ctermfg=130    ctermbg=NONE
    hi WildMenu     guifg=fg        guibg=#afd7ff   ctermfg=fg     ctermbg=153
    hi ColorColumn  guifg=NONE      guibg=#d7d7af   ctermfg=NONE   ctermbg=187
    hi Ignore       guifg=bg                        ctermfg=bg

endif


" ============================================================================
" Text Emphasis:
" ============================================================================

let s:normal_items = [
            \ "ColorColumn", "Comment", "Constant", "Cursor", "CursorColumn",
            \ "CursorIM", "CursorLine", "CursorLineNr", "DiffAdd", "DiffChange",
            \ "DiffDelete", "Directory", "Error", "ErrorMsg", "Identifier",
            \ "IncSearch", "LineNr", "MatchParen", "ModeMsg", "MoreMsg",
            \ "NonText", "Normal", "Pmenu" , "PmenuSbar", "PmenuSel",
            \ "PmenuThumb", "PreProc", "Question", "Search", "SignColumn",
            \ "Special", "SpecialKey", "Statement", "StatusLineNC", "TabLine",
            \ "TabLineFill", "Todo", "Type", "VertSplit", "Visual",
            \ "WarningMsg", "WildMenu", 
            \ ]

let s:bold_items = [
            \ "DiffText", "FoldColumn", "Folded", "StatusLine", "TabLineSel",
            \ "Title",
            \ ]

let s:underline_items = [
            \ "Underlined", "VisualNOS"
            \ ]

let s:undercurl_items = [
            \ "SpellBad", "SpellCap", "SpellLocal", "SpellRare"
            \ ]

for item in s:normal_items
    exec "hi " . item . " gui=none cterm=none term=none"
endfor

if g:lucius_use_bold == 1
    for item in s:bold_items
        exec "hi " . item . " gui=bold cterm=bold term=none"
    endfor
endif

if g:lucius_use_underline == 1
    for item in s:underline_items
        exec "hi " . item . " gui=underline cterm=underline term=none"
    endfor
endif

if g:lucius_use_undercurl == 1
    for item in s:undercurl_items
        exec "hi " . item . " gui=undercurl cterm=underline term=none"
    endfor
elseif g:lucius_use_underline == 1
    for item in s:undercurl_items
        exec "hi " . item . " gui=underline cterm=underline term=none"
    endfor
endif


" ============================================================================
" Plugin Specific Colors:
" ============================================================================

" Tagbar:
hi link TagbarAccessPublic Constant
hi link TagbarAccessProtected Type
hi link TagbarAccessPrivate PreProc


" ============================================================================
" Alternative Bold Definitions:
" ============================================================================

let s:alternative_bold_items = ["Identifier", "PreProc", "Statement", 
            \ "Special", "Constant", "Type"]

for item in s:alternative_bold_items
    exec "let s:temp_gui_fg = synIDattr(synIDtrans(hlID('" . item . 
                \ "')), 'fg', 'gui')"
    exec "let s:temp_cterm_fg = synIDattr(synIDtrans(hlID('" . item . 
                \ "')), 'fg', 'cterm')"
    exec "hi B" . item . " guifg=" . s:temp_gui_fg . " ctermfg=" . 
                \ s:temp_cterm_fg . " gui=bold cterm=bold term=none"
endfor


" ============================================================================
" Commands:
" ============================================================================

command! LuciusLight let g:lucius_style = 'light' | colorscheme lucius
command! LuciusDark let g:lucius_style = 'dark' | colorscheme lucius
command! LuciusDarkDim let g:lucius_style = 'dark_dim' | colorscheme lucius
command! LuciusBlack let g:lucius_style = 'black' | colorscheme lucius


