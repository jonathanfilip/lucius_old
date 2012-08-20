" ============================================================================
" Name:     Lucius vim color scheme
" Author:   Jonathan Filip <jfilip1024@gmail.com>
" Version:  8.0.0
" ----------------------------------------------------------------------------
"
" Color scheme for GUI and 256 color terminal with light and dark variants
" and different contrast options.
"
" This color scheme was started in 2008 as a combination of my favorite
" parts from moria, oceandeep, peaksea, wombat, and zenburn. It has since
" been refined as its own color scheme that is identical in gVim and 256
" color terminal sessions. There are also different options available to
" customize the appearance. 
"
" Originally, there were 3 different variations: dark, light, and dark_dim.
" As I kept wanting to tweak things for different environments (home,
" office, day, night, etc), I changed things to give users more control. For
" both the light and dark schemes, you can choose a more bold or soft
" background as well as the contrast of the text itself. There are several
" presets available (links are screenshots):
"
" * Black:
" * BlackDim:
" * Dark:
" * DarkDim:
" * Light: 
" * LightBright:
" * White:
" * WhiteBright:
"
" The default schemes are Dark and Light.
"
"
" Also, rather than trying to keep the GUI and cterm settings synchronized,
" I just use a map of hex colors to their corresponding 256 color value.
"
" Options:
"
" g:lucius_style  (default: 'dark')
"
" Set this option to either 'light' or 'dark' for your desired color scheme.
" It has the same effect as setting the background.
"
" g:lucius_high_contrast  (default: 1)
"
" This option determines the contrast used for text elements. Setting it to
" 0 will use lower contrast items and setting it to 1 will use higher
" contrast. You also have the option of setting it to 2, which will use the
" same contrast as the 1 setting, except it will make the normal text
" setting maximum contrast (white for dark scheme, black for light scheme).
"
" g:lucius_high_contrast_bg  (default: 0)
"
" Setting this option makes the background a higher contrast. For the light
" scheme, it becomes a white background. For the dark scheme, it becomes a
" much darker color (almost black).
"
" g:lucius_use_bold (default: 1)
"
" Setting this will cause the color scheme to use bold fonts for some items.
"
" g:lucius_use_underline (default: 1)
"
" Setting this will cause the color scheme to use underlined fonts for some
" items.
"
" ============================================================================



" ============================================================================
" Options:
" ============================================================================

hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="lucius"

if exists("g:lucius_style")
    let s:style = g:lucius_style
else
    let s:style == &background
endif

" Backward compatibility with v7
if s:style == "dark_dim"
    let s:style = "dark"
endif

exec "set background=" . s:style

if exists("g:lucius_high_contrast")
    let s:high_contrast = g:lucius_high_contrast
else
    let s:high_contrast = 1
endif

if exists("g:lucius_high_contrast_bg")
    let s:high_contrast_bg = g:lucius_high_contrast_bg
else
    let s:high_contrast_bg = 0
endif

" Backward compatibility with v7
if g:lucius_style == "dark_dim"
    let s:high_contrast = 0
    let s:high_contrast_bg = 0
endif

if exists("g:lucius_use_bold")
    let s:use_bold = g:lucius_use_bold
else
    let s:use_bold = 1
endif

if exists("g:lucius_use_underline")
    let s:use_underline = g:lucius_use_underline
else
    let s:use_underline = 1
endif


" ============================================================================
" Color Map:
" ============================================================================

let s:color_map = {
    \ 'bg': 'bg', 'fg': 'fg', 'NONE': 'NONE',
    \ '#000000':  '16', '#00005f':  '17', '#000087':  '18', '#0000af':  '19',
    \ '#0000d7':  '20', '#0000ff':  '21', '#005f00':  '22', '#005f5f':  '23',
    \ '#005f87':  '24', '#005faf':  '25', '#005fd7':  '26', '#005fff':  '27',
    \ '#008700':  '28', '#00875f':  '29', '#008787':  '30', '#0087af':  '31',
    \ '#0087d7':  '32', '#0087ff':  '33', '#00af00':  '34', '#00af5f':  '35',
    \ '#00af87':  '36', '#00afaf':  '37', '#00afd7':  '38', '#00afff':  '39',
    \ '#00d700':  '40', '#00d75f':  '41', '#00d787':  '42', '#00d7af':  '43',
    \ '#00d7d7':  '44', '#00d7ff':  '45', '#00ff00':  '46', '#00ff5f':  '47',
    \ '#00ff87':  '48', '#00ffaf':  '49', '#00ffd7':  '50', '#00ffff':  '51',
    \ '#5f0000':  '52', '#5f005f':  '53', '#5f0087':  '54', '#5f00af':  '55',
    \ '#5f00d7':  '56', '#5f00ff':  '57', '#5f5f00':  '58', '#5f5f5f':  '59',
    \ '#5f5f87':  '60', '#5f5faf':  '61', '#5f5fd7':  '62', '#5f5fff':  '63',
    \ '#5f8700':  '64', '#5f875f':  '65', '#5f8787':  '66', '#5f87af':  '67',
    \ '#5f87d7':  '68', '#5f87ff':  '69', '#5faf00':  '70', '#5faf5f':  '71',
    \ '#5faf87':  '72', '#5fafaf':  '73', '#5fafd7':  '74', '#5fafff':  '75',
    \ '#5fd700':  '76', '#5fd75f':  '77', '#5fd787':  '78', '#5fd7af':  '79',
    \ '#5fd7d7':  '80', '#5fd7ff':  '81', '#5fff00':  '82', '#5fff5f':  '83',
    \ '#5fff87':  '84', '#5fffaf':  '85', '#5fffd7':  '86', '#5fffff':  '87',
    \ '#870000':  '88', '#87005f':  '89', '#870087':  '90', '#8700af':  '91',
    \ '#8700d7':  '92', '#8700ff':  '93', '#875f00':  '94', '#875f5f':  '95',
    \ '#875f87':  '96', '#875faf':  '97', '#875fd7':  '98', '#875fff':  '99',
    \ '#878700': '100', '#87875f': '101', '#878787': '102', '#8787af': '103',
    \ '#8787d7': '104', '#8787ff': '105', '#87af00': '106', '#87af5f': '107',
    \ '#87af87': '108', '#87afaf': '109', '#87afd7': '110', '#87afff': '111',
    \ '#87d700': '112', '#87d75f': '113', '#87d787': '114', '#87d7af': '115',
    \ '#87d7d7': '116', '#87d7ff': '117', '#87ff00': '118', '#87ff5f': '119',
    \ '#87ff87': '120', '#87ffaf': '121', '#87ffd7': '122', '#87ffff': '123',
    \ '#af0000': '124', '#af005f': '125', '#af0087': '126', '#af00af': '127',
    \ '#af00d7': '128', '#af00ff': '129', '#af5f00': '130', '#af5f5f': '131',
    \ '#af5f87': '132', '#af5faf': '133', '#af5fd7': '134', '#af5fff': '135',
    \ '#af8700': '136', '#af875f': '137', '#af8787': '138', '#af87af': '139',
    \ '#af87d7': '140', '#af87ff': '141', '#afaf00': '142', '#afaf5f': '143',
    \ '#afaf87': '144', '#afafaf': '145', '#afafd7': '146', '#afafff': '147',
    \ '#afd700': '148', '#afd75f': '149', '#afd787': '150', '#afd7af': '151',
    \ '#afd7d7': '152', '#afd7ff': '153', '#afff00': '154', '#afff5f': '155',
    \ '#afff87': '156', '#afffaf': '157', '#afffd7': '158', '#afffff': '159',
    \ '#d70000': '160', '#d7005f': '161', '#d70087': '162', '#d700af': '163',
    \ '#d700d7': '164', '#d700ff': '165', '#d75f00': '166', '#d75f5f': '167',
    \ '#d75f87': '168', '#d75faf': '169', '#d75fd7': '170', '#d75fff': '171',
    \ '#d78700': '172', '#d7875f': '173', '#d78787': '174', '#d787af': '175',
    \ '#d787d7': '176', '#d787ff': '177', '#d7af00': '178', '#d7af5f': '179',
    \ '#d7af87': '180', '#d7afaf': '181', '#d7afd7': '182', '#d7afff': '183',
    \ '#d7d700': '184', '#d7d75f': '185', '#d7d787': '186', '#d7d7af': '187',
    \ '#d7d7d7': '188', '#d7d7ff': '189', '#d7ff00': '190', '#d7ff5f': '191',
    \ '#d7ff87': '192', '#d7ffaf': '193', '#d7ffd7': '194', '#d7ffff': '195',
    \ '#ff0000': '196', '#ff005f': '197', '#ff0087': '198', '#ff00af': '199',
    \ '#ff00d7': '200', '#ff00ff': '201', '#ff5f00': '202', '#ff5f5f': '203',
    \ '#ff5f87': '204', '#ff5faf': '205', '#ff5fd7': '206', '#ff5fff': '207',
    \ '#ff8700': '208', '#ff875f': '209', '#ff8787': '210', '#ff87af': '211',
    \ '#ff87d7': '212', '#ff87ff': '213', '#ffaf00': '214', '#ffaf5f': '215',
    \ '#ffaf87': '216', '#ffafaf': '217', '#ffafd7': '218', '#ffafff': '219',
    \ '#ffd700': '220', '#ffd75f': '221', '#ffd787': '222', '#ffd7af': '223',
    \ '#ffd7d7': '224', '#ffd7ff': '225', '#ffff00': '226', '#ffff5f': '227',
    \ '#ffff87': '228', '#ffffaf': '229', '#ffffd7': '230', '#ffffff': '231',
    \ '#080808': '232', '#121212': '233', '#1c1c1c': '234', '#262626': '235',
    \ '#303030': '236', '#3a3a3a': '237', '#444444': '238', '#4e4e4e': '239',
    \ '#585858': '240', '#626262': '241', '#6c6c6c': '242', '#767676': '243',
    \ '#808080': '244', '#8a8a8a': '245', '#949494': '246', '#9e9e9e': '247',
    \ '#a8a8a8': '248', '#b2b2b2': '249', '#bcbcbc': '250', '#c6c6c6': '251',
    \ '#d0d0d0': '252', '#dadada': '253', '#e4e4e4': '254', '#eeeeee': '255',
    \ }


" ============================================================================
" Functions:
" ============================================================================

function! s:AddCterm(name)
    exec "let l:gfg = synIDattr(synIDtrans(hlID('" . a:name .
                \ "')), 'fg', 'gui')"
    exec "let l:gbg = synIDattr(synIDtrans(hlID('" . a:name .
                \ "')), 'bg', 'gui')"
    let l:gfg = l:gfg == "" ? "NONE" : l:gfg
    let l:gbg = l:gbg == "" ? "NONE" : l:gbg
    exec "hi " . a:name . " ctermfg=" . s:color_map[l:gfg] .
                \ " ctermbg=" . s:color_map[l:gbg]
endfunction

function! s:AddSpCterm(name)
    exec "let l:gsp = synIDattr(synIDtrans(hlID('" . a:name .
                \ "')), 'sp', 'gui')"
    let l:gsp = l:gsp == "" ? "NONE" : l:gsp
    exec "hi " . a:name . " ctermfg=" . s:color_map[l:gsp]
endfunction


" ============================================================================
" Text Groups:
" ============================================================================

let s:normal_items = [
            \ "Normal",
            \ "ColorColumn", "Comment", "Constant", "Cursor", "CursorColumn",
            \ "CursorIM", "CursorLine", "CursorLineNr", "DiffAdd", "DiffChange",
            \ "DiffDelete", "Directory", "Error", "ErrorMsg", "Identifier",
            \ "IncSearch", "LineNr", "MatchParen", "ModeMsg", "MoreMsg",
            \ "NonText", "Pmenu", "PmenuSbar", "PmenuSel",
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

" Clear default settings
for item in s:normal_items + s:bold_items + s:underline_items + s:undercurl_items
    exec "hi " . item . " guifg=NONE guibg=NONE gui=none"
                \ . " ctermfg=NONE ctermbg=NONE cterm=none term=none"
endfor


" ============================================================================
" Color Definitions:
" ============================================================================

" ----------------------------------------------------------------------------
" Default Foreground:
" ----------------------------------------------------------------------------

if s:style == "light"
    if s:high_contrast > 0
        if s:high_contrast > 1
            hi Normal       guifg=#000000
        else
            hi Normal       guifg=#444444
        endif
    else
        hi Normal       guifg=#626262
    endif
else
    if s:high_contrast > 0
        if s:high_contrast > 1
            hi Normal       guifg=#eeeeee
        else
            hi Normal       guifg=#d7d7d7
        endif
    else
        hi Normal       guifg=#bcbcbc
    endif
endif


" ----------------------------------------------------------------------------
" Default Background:
" ----------------------------------------------------------------------------

if s:style == "light"
    if s:high_contrast_bg == 1
        hi Normal                       guibg=#ffffff
    else
        hi Normal                       guibg=#eeeeee
    endif
else
    if s:high_contrast_bg == 1
        hi Normal                       guibg=#121212
    else
        hi Normal                       guibg=#303030
    endif
endif


" ----------------------------------------------------------------------------
" Text Markup:
" ----------------------------------------------------------------------------

hi ModeMsg      guifg=fg
hi Question     guifg=fg
if s:style == "light"
    hi NonText      guifg=#afafd7
    hi SpecialKey   guifg=#afd7af
    if s:high_contrast > 0
        hi Comment      guifg=#808080
        hi Constant     guifg=#af5f00
        hi Directory    guifg=#00875f
        hi Identifier   guifg=#008700
        hi PreProc      guifg=#008787
        hi Special      guifg=#870087
        hi Statement    guifg=#005faf
        hi Title        guifg=#005faf
        hi Type         guifg=#005f87
    else
        hi Comment      guifg=#9e9e9e
        hi Constant     guifg=#d78700
        hi Directory    guifg=#00af87
        hi Identifier   guifg=#00af00
        hi PreProc      guifg=#00afaf
        hi Special      guifg=#af00af
        hi Statement    guifg=#0087d7
        hi Title        guifg=#0087d7
        hi Type         guifg=#0087af
    endif
else
    hi NonText      guifg=#5f5f87
    hi SpecialKey   guifg=#5f875f
    if s:high_contrast > 0
        hi Comment      guifg=#808080
        hi Constant     guifg=#d7d7af
        hi Directory    guifg=#afd7af
        hi Identifier   guifg=#afd787
        hi PreProc      guifg=#87d7af
        hi Special      guifg=#d7afd7
        hi Statement    guifg=#87d7ff
        hi Title        guifg=#5fafd7
        hi Type         guifg=#87d7d7
    else
        hi Comment      guifg=#6c6c6c
        hi Constant     guifg=#afaf87
        hi Directory    guifg=#87af87
        hi Identifier   guifg=#87af5f
        hi PreProc      guifg=#5faf87
        hi Special      guifg=#af87af
        hi Statement    guifg=#5fafd7
        hi Title        guifg=#00afd7
        hi Type         guifg=#5fafaf
    endif
endif


" ----------------------------------------------------------------------------
" Highlighting:
" ----------------------------------------------------------------------------

hi Cursor       guifg=bg
hi CursorColumn guifg=NONE
hi CursorIM     guifg=bg
hi CursorLine   guifg=NONE
hi Visual       guifg=NONE
hi VisualNOS    guifg=fg        guibg=NONE
if s:style == "light"
    hi CursorColumn                 guibg=#dadada
    hi CursorLine                   guibg=#dadada
    hi IncSearch    guifg=fg        guibg=#5fd7d7
    hi MatchParen   guifg=NONE      guibg=#5fd7d7
    hi Search       guifg=fg        guibg=#ffaf00
    hi Visual                       guibg=#afd7ff
    if s:high_contrast > 0
        hi Cursor                       guibg=#5f87af
        hi CursorIM                     guibg=#5f87af
        hi Error        guifg=#af0000   guibg=#d7afaf
        hi Todo         guifg=#875f00   guibg=#ffffaf
    else
        hi Cursor                       guibg=#87afd7
        hi CursorIM                     guibg=#87afd7
        hi Error        guifg=#d70000   guibg=#ffd7d7
        hi Todo         guifg=#af8700   guibg=#ffffaf
    end
else
    hi CursorColumn                 guibg=#444444
    hi CursorLine                   guibg=#444444
    hi IncSearch    guifg=bg
    hi MatchParen   guifg=bg
    hi Search       guifg=bg
    hi Visual                       guibg=#005f87
    if s:high_contrast > 0
        hi Cursor                       guibg=#87afd7
        hi CursorIM                     guibg=#87afd7
        hi Error        guifg=#ff8787   guibg=#870000
        hi IncSearch                    guibg=#5fd7d7
        hi MatchParen                   guibg=#afd75f
        hi Search                       guibg=#d78700
        hi Todo         guifg=#d7d75f   guibg=#5f5f00
    else
        hi Cursor                       guibg=#5f87af
        hi CursorIM                     guibg=#5f87af
        hi Error        guifg=#d75f5f   guibg=#870000
        hi IncSearch                    guibg=#00afaf
        hi MatchParen                   guibg=#87af5f
        hi Search                       guibg=#d78700
        hi Todo         guifg=#afaf00   guibg=#5f5f00
    endif
endif


" ----------------------------------------------------------------------------
" Messages:
" ----------------------------------------------------------------------------

hi ModeMsg      guifg=fg
hi Question     guifg=fg
if s:style == "light"
    if s:high_contrast > 0
        hi ErrorMsg     guifg=#af0000
        hi MoreMsg      guifg=#005fd7
        hi WarningMsg   guifg=#af5f00
    else
        hi ErrorMsg     guifg=#d70000
        hi MoreMsg      guifg=#0087ff
        hi WarningMsg   guifg=#d78700
    endif
else
    if s:high_contrast > 0
        hi ErrorMsg     guifg=#ff5f5f
        hi MoreMsg      guifg=#5fd7d7
        hi WarningMsg   guifg=#d7875f
    else
        hi ErrorMsg     guifg=#d75f5f
        hi MoreMsg      guifg=#00afaf
        hi WarningMsg   guifg=#af875f
    endif
endif


" ----------------------------------------------------------------------------
" UI:
" ----------------------------------------------------------------------------

hi ColorColumn  guifg=NONE
hi Pmenu        guifg=bg
hi PmenuSel     guifg=fg
hi PmenuThumb   guifg=fg
hi StatusLine   guifg=bg
hi TabLine      guifg=bg
hi TabLineSel   guifg=fg
hi WildMenu     guifg=fg
if s:style == "light"
    hi ColorColumn                  guibg=#d7d7af
    hi CursorLineNr guifg=#9e9e9e   guibg=#dadada
    hi FoldColumn                   guibg=#bcbcbc
    hi Folded                       guibg=#bcbcbc
    hi LineNr       guifg=#9e9e9e   guibg=#dadada
    hi PmenuSel                     guibg=#afd7ff
    hi SignColumn                   guibg=#d0d0d0
    hi StatusLineNC guifg=#e4e4e4
    hi TabLineFill  guifg=#b2b2b2
    hi VertSplit    guifg=#e4e4e4
    hi WildMenu                     guibg=#afd7ff
    if s:high_contrast > 0
        hi FoldColumn   guifg=#626262
        hi Folded       guifg=#626262
        hi Pmenu                        guibg=#808080
        hi PmenuSbar    guifg=#808080   guibg=#444444
        hi PmenuThumb                   guibg=#9e9e9e
        hi SignColumn   guifg=#626262
        hi StatusLine                   guibg=#808080
        hi StatusLineNC                 guibg=#808080
        hi TabLine                      guibg=#808080
        hi TabLineFill                  guibg=#808080
        hi TabLineSel                   guibg=#afd7ff
        hi VertSplit                    guibg=#808080
    else
        hi FoldColumn   guifg=#808080
        hi Folded       guifg=#808080
        hi Pmenu                        guibg=#9e9e9e
        hi PmenuSbar    guifg=#9e9e9e   guibg=#626262
        hi PmenuThumb                   guibg=#9e9e9e
        hi SignColumn   guifg=#808080
        hi StatusLine                   guibg=#9e9e9e
        hi StatusLineNC                 guibg=#9e9e9e
        hi TabLine                      guibg=#9e9e9e
        hi TabLineFill                  guibg=#9e9e9e
        hi TabLineSel                   guibg=#afd7ff
        hi VertSplit                    guibg=#9e9e9e
    endif
else
    hi ColorColumn                  guibg=#87875f
    hi CursorLineNr guifg=#626262   guibg=#444444
    hi FoldColumn                   guibg=#4e4e4e
    hi Folded                       guibg=#4e4e4e
    hi LineNr       guifg=#626262   guibg=#444444
    hi PmenuSel                     guibg=#005f87
    hi SignColumn                   guibg=#4e4e4e
    hi StatusLineNC guifg=#444444
    hi TabLineFill  guifg=#444444
    hi VertSplit    guifg=#626262
    hi WildMenu                     guibg=#005f87
    if s:high_contrast > 0
        hi FoldColumn   guifg=#bcbcbc
        hi Folded       guifg=#bcbcbc
        hi Pmenu                        guibg=#b2b2b2
        hi PmenuSbar    guifg=#b2b2b2   guibg=#d0d0d0
        hi PmenuThumb                   guibg=#808080
        hi SignColumn   guifg=#b2b2b2
        hi StatusLine                   guibg=#b2b2b2
        hi StatusLineNC                 guibg=#b2b2b2
        hi TabLine                      guibg=#b2b2b2
        hi TabLineFill                  guibg=#b2b2b2
        hi TabLineSel                   guibg=#005f87
        hi VertSplit                    guibg=#b2b2b2
    else
        hi FoldColumn   guifg=#a8a8a8
        hi Folded       guifg=#a8a8a8
        hi Pmenu                        guibg=#8a8a8a
        hi PmenuSbar    guifg=#8a8a8a   guibg=#bcbcbc
        hi PmenuThumb                   guibg=#585858
        hi SignColumn   guifg=#8a8a8a
        hi StatusLine                   guibg=#8a8a8a
        hi StatusLineNC                 guibg=#8a8a8a
        hi TabLine                      guibg=#8a8a8a
        hi TabLineFill                  guibg=#8a8a8a
        hi TabLineSel                   guibg=#005f87
        hi VertSplit                    guibg=#8a8a8a
    endif
endif


" ----------------------------------------------------------------------------
" Diff:
" ----------------------------------------------------------------------------

hi DiffAdd      guifg=fg
hi DiffChange   guifg=fg
hi DiffDelete   guifg=fg

if s:style == "light"
    hi DiffAdd                      guibg=#afd7af
    hi DiffChange                   guibg=#d7d7af
    hi DiffDelete                   guibg=#d7afaf
    hi DiffText                     guibg=#d7d7af
    if s:high_contrast > 0
        hi DiffText     guifg=#d75f00
    else
        hi DiffText     guifg=#ff8700
    endif
else
    hi DiffAdd                      guibg=#5f875f
    hi DiffChange                   guibg=#87875f
    hi DiffDelete                   guibg=#875f5f
    hi DiffText                     guibg=#87875f
    if s:high_contrast > 0
        hi DiffText     guifg=#ffff87
    else
        hi DiffText     guifg=#d7d75f
    endif
endif


" ----------------------------------------------------------------------------
" Spelling:
" ----------------------------------------------------------------------------

if s:style == "light"
    hi SpellBad     guisp=#d70000
    hi SpellCap     guisp=#00afd7
    hi SpellLocal   guisp=#d7af00
    hi SpellRare    guisp=#5faf00
else
    hi SpellBad     guisp=#d70000
    hi SpellCap     guisp=#00afd7
    hi SpellLocal   guisp=#d7af00
    hi SpellRare    guisp=#5faf00
endif


" ----------------------------------------------------------------------------
" Miscellaneous:
" ----------------------------------------------------------------------------

hi Ignore       guifg=bg
hi Underlined   guifg=fg


" ============================================================================
" Text Emphasis:
" ============================================================================

for item in s:normal_items
    exec "hi " . item . " gui=none cterm=none term=none"
endfor

if s:use_bold == 1
    for item in s:bold_items
        exec "hi " . item . " gui=bold cterm=bold term=none"
    endfor
endif

if s:use_underline == 1
    for item in s:underline_items
        exec "hi " . item . " gui=underline cterm=underline term=none"
    endfor
    for item in s:undercurl_items
        exec "hi " . item . " cterm=underline"
    endfor
endif

for item in s:undercurl_items
    exec "hi " . item . " gui=undercurl term=none"
endfor


" ============================================================================
" Cterm Colors:
" ============================================================================

call s:AddCterm("Normal")

for item in s:normal_items + s:bold_items + s:underline_items
    call s:AddCterm(item)
endfor

for item in s:undercurl_items
    call s:AddSpCterm(item)
endfor


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
" Plugin Specific Colors:
" ============================================================================

" Tagbar:
hi link TagbarAccessPublic Constant
hi link TagbarAccessProtected Type
hi link TagbarAccessPrivate PreProc

" Vimwiki:
hi link VimwikiHeader1 BIdentifier
hi link VimwikiHeader2 BPreProc
hi link VimwikiHeader3 BStatement
hi link VimwikiHeader4 BSpecial
hi link VimwikiHeader5 BConstant
hi link VimwikiHeader6 BType


" ============================================================================
" Preset Commands:
" ============================================================================

command! LuciusLight
            \ let g:lucius_high_contrast = 1 |
            \ let g:lucius_high_contrast_bg = 0 |
            \ let g:lucius_style = "light" |
            \ colorscheme lucius

command! LuciusLightBright
            \ let g:lucius_high_contrast = 0 |
            \ let g:lucius_high_contrast_bg = 0 |
            \ let g:lucius_style = "light" |
            \ colorscheme lucius

command! LuciusWhite
            \ let g:lucius_high_contrast = 1 |
            \ let g:lucius_high_contrast_bg = 1 |
            \ let g:lucius_style = "light" |
            \ colorscheme lucius

command! LuciusWhiteBright
            \ let g:lucius_high_contrast = 0 |
            \ let g:lucius_high_contrast_bg = 1 |
            \ let g:lucius_style = "light" |
            \ colorscheme lucius

command! LuciusDark
            \ let g:lucius_high_contrast = 1 |
            \ let g:lucius_high_contrast_bg = 0 |
            \ let g:lucius_style = "dark" |
            \ colorscheme lucius

command! LuciusDarkDim
            \ let g:lucius_high_contrast = 0 |
            \ let g:lucius_high_contrast_bg = 0 |
            \ let g:lucius_style = "dark" |
            \ colorscheme lucius

command! LuciusBlack
            \ let g:lucius_high_contrast = 1 |
            \ let g:lucius_high_contrast_bg = 1 |
            \ let g:lucius_style = "dark" |
            \ colorscheme lucius

command! LuciusBlackDim
            \ let g:lucius_high_contrast = 0 |
            \ let g:lucius_high_contrast_bg = 1 |
            \ let g:lucius_style = "dark" |
            \ colorscheme lucius

" vim: tw=78

