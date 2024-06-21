" Vim color file
" Language:    vim
" Maintainer:  Beomjoon Goh
" Last Change: 13 Aug 2021 10:10:50 +0900

if !has("gui_running")
  set t_Co=256
endif

highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="desertBJ"
let s:lightmode= &background == 'light'

function! s:construct_rgb_dict() abort
  let l:rgb_dict = { }
  let l:colors = [ 0x00 ] + range(0x5F, 0xFF, 0x28)
  let l:i = 16
  for l:r in l:colors
    for l:g in l:colors
      for l:b in l:colors
        let l:rgb_dict[l:i] = printf("#%02x%02x%02x", l:r, l:g, l:b)
        let l:i += 1
      endfor
    endfor
  endfor
  for l:c in range(0x08, 0xEE, 0x0A)
    let l:rgb_dict[l:i] = printf("#%02x%02x%02x", l:c, l:c, l:c)
    let l:i += 1
  endfor
  return l:rgb_dict
endfunction

function! s:highlight(group, fg, bg, at) abort
  let fg = a:fg[s:lightmode]
  let bg = a:bg[s:lightmode]

  let l:cmd = ""
  if !empty(fg)
    let l:cmd .= "ctermfg=".fg." guifg=".s:rgb_dict[fg]." "
  endif
  if !empty(bg)
    let l:cmd .= "ctermbg=".bg." guibg=".s:rgb_dict[bg]." "
  endif
  if !empty(a:at)
    let l:cmd .= "cterm=".a:at." gui=".a:at." "
  endif
  if !empty(l:cmd)
    execute "highlight" a:group l:cmd
  endif
endfunction

if !exists("s:rgb_dict")
  let s:rgb_dict = s:construct_rgb_dict()
endif

if get(g:, 'desertBJ_terminal', 1)
  if s:lightmode
    let g:terminal_ansi_colors = [
          \ '#e4e4e4', '#d75f5ff', '#008700', '#878700', '#0087af', '#af5f87', '#00af87', '#000000',
          \ '#ffffff', '#d75f5ff', '#008700', '#878700', '#0087af', '#af5f87', '#00af87', '#000000',
          \ ] "231, 167,  28, 100,  31, 132,  36,  16
  else
    let g:terminal_ansi_colors = [
          \ '#000000', '#ff8787', '#87d787', '#dfdf87', '#87d7ff', '#ffafd7', '#87ffd7', '#e4e4e4',
          \ '#000000', '#ff8787', '#87d787', '#dfdf87', '#87d7ff', '#ffafd7', '#87ffd7', '#ffffff',
          \ ] " 16, 210, 114, 186, 117, 218, 122, 231
  endif
endif

" Default highlighting groups
if has("gui_running")
  call s:highlight("Normal", ["", "" ], [16,  231], "")
endif
call s:highlight("ColorColumn",      ["",  "" ], [234, 253], "NONE")
call s:highlight("Conceal",          ["",  "" ], ["",  "" ],  "")
call s:highlight("Cursor",           [16,  231], [186, 186], "NONE")
call s:highlight("CursorColumn",     ["",  "" ], [236, 251], "NONE")
call s:highlight("CursorLine",       ["",  "" ], [236, 251], "NONE")
call s:highlight("Directory",        [114, 28 ], ["",  "" ], "BOLD")
call s:highlight("DiffAdd",          ["",  "" ], [234, 253], "")
call s:highlight("DiffChange",       ["",  "" ], [236, 251], "")
call s:highlight("DiffDelete",       ["",  "" ], [23,  109], "")
call s:highlight("DiffText",         ["",  "" ], [52,  138], "")
call s:highlight("EndOfBuffer",      [51,  37 ], ["",  "" ], "NONE")
call s:highlight("ErrorMsg",         [231, 16 ], [196, 210], "NONE")
call s:highlight("VertSplit",        [236, 251], [236, 251], "NONE")
call s:highlight("Folded",           [122, 36 ], [234, 253], "NONE")
call s:highlight("FoldColumn",       [242, 245], [234, 253], "NONE")
call s:highlight("SignColumn",       [242, 245], [234, 253], "NONE")
call s:highlight("IncSearch",        [94,  16 ], [230, 58 ], "NONE")
call s:highlight("LineNr",           [137, 58 ], [234, 253], "NONE")
call s:highlight("LineNrAbove",      [137, 58 ], [234, 253], "NONE")
call s:highlight("LineNrBelow",      [137, 58 ], [234, 253], "NONE")
call s:highlight("CursorLineNr",     [137, 58 ], [234, 253], "BOLD")
call s:highlight("MatchParen",       [226, 186], [242, 245], "BOLD")
call s:highlight("ModeMsg",          [117, 31 ], ["",  "" ], "BOLD")
call s:highlight("MoreMsg",          [71,  22 ], ["",  "" ], "NONE")
call s:highlight("NonText",          [51,  37 ], ["",  "" ], "NONE")
call s:highlight("Pmenu",            [234, 253], [144, 58 ], "NONE")
call s:highlight("PmenuSel",         [230, 58 ], [94,  180], "NONE")
call s:highlight("PmenuSbar",        ["",  "" ], [144, 58 ], "NONE")
call s:highlight("PmenuThumb",       ["",  "" ], [253, 234], "NONE")
call s:highlight("Question",         [71,  22 ], ["",  "" ], "BOLD")
call s:highlight("QuickFixLine",     ["",  "" ], [234, 253], "UNDERLINE")
call s:highlight("Search",           [230, 58 ], [94,  180], "NONE")
call s:highlight("SpecialKey",       [240, 247], ["",  "" ], "NONE")
call s:highlight("SpellBad",         [210, 167], [236, 251], "NONE")
call s:highlight("SpellCap",         [235, 252], [117, 31 ], "NONE")
call s:highlight("SpellLocal",       [235, 252], [122, 36 ], "NONE")
call s:highlight("SpellRare",        [218, 132], [236, 251], "NONE")
call s:highlight("StatusLine",       [16,  231], [144, 58 ], "BOLD")
call s:highlight("StatusLineNC",     [253, 234], [236, 251], "NONE")
call s:highlight("StatusLineTerm",   [16,  231], [108, 22 ], "BOLD")
call s:highlight("StatusLineTermNC", [108, 22 ], [236, 251], "NONE")
call s:highlight("TabLine",          [245, 242], [234, 253], "NONE")
call s:highlight("TabLineFill",      [180, 94 ], [234, 253], "NONE")
call s:highlight("TabLineSel",       [230, 58 ], [236, 251], "BOLD")
call s:highlight("Terminal",         ["",  "" ], ["",  "" ], "")
call s:highlight("Title",            [167, 88 ], ["",  "" ], "BOLD")
call s:highlight("Visual",           [235, 252], [215, 172], "NONE")
call s:highlight("WarningMsg",       [210, 167], ["",  "" ], "BOLD")
call s:highlight("WildMenu",         [253, 234], [235, 252], "NONE")

" Syntax highlighting groups
call s:highlight("Comment",          [114, 28 ], ["",  "" ], "NONE")

call s:highlight("Constant",         [210, 167], ["",  "" ], "NONE")
call s:highlight("String",           [210, 167], ["",  "" ], "NONE")
call s:highlight("Character",        [210, 167], ["",  "" ], "NONE")
call s:highlight("Number",           [180, 94 ], ["",  "" ], "NONE")
call s:highlight("Boolean",          [180, 94 ], ["",  "" ], "NONE")
call s:highlight("Float",            [180, 94 ], ["",  "" ], "NONE")

call s:highlight("Identifier",       [117, 31 ], ["",  "" ], "NONE")
call s:highlight("Function",         [117, 31 ], ["",  "" ], "NONE")

call s:highlight("Statement",        [186, 100], ["",  "" ], "BOLD")
call s:highlight("Conditional",      [186, 100], ["",  "" ], "BOLD")
call s:highlight("Repeat",           [186, 100], ["",  "" ], "BOLD")
call s:highlight("Label",            [186, 100], ["",  "" ], "BOLD")
call s:highlight("Operator",         [180, 94 ], ["",  "" ], "BOLD")
call s:highlight("Keyword",          [186, 100], ["",  "" ], "BOLD")
call s:highlight("Exception",        [186, 100], ["",  "" ], "BOLD")

call s:highlight("PreProc",          [218, 132], ["",  "" ], "NONE")
call s:highlight("Include",          [218, 132], ["",  "" ], "NONE")
call s:highlight("Define",           [218, 132], ["",  "" ], "NONE")
call s:highlight("Macro",            [218, 132], ["",  "" ], "NONE")
call s:highlight("PreCondit",        [218, 132], ["",  "" ], "NONE")

call s:highlight("Type",             [215, 172], ["",  "" ], "BOLD")
call s:highlight("StorageClass",     [215, 172], ["",  "" ], "BOLD")
call s:highlight("Structure",        [215, 172], ["",  "" ], "BOLD")
call s:highlight("Typedef",          [215, 172], ["",  "" ], "BOLD")

call s:highlight("Special",          [122, 36 ], ["",  "" ], "NONE")
call s:highlight("SpecialChar",      [122, 36 ], ["",  "" ], "NONE")
call s:highlight("Tag",              [122, 36 ], ["",  "" ], "NONE")
call s:highlight("Delimiter",        [245, 242], ["",  "" ], "BOLD")
call s:highlight("SpecialComment",   [122, 36 ], ["",  "" ], "NONE")
call s:highlight("Debug",            [122, 36 ], ["",  "" ], "NONE")

call s:highlight("Underlined",       [117, 31 ], ["",  "" ], "UNDERLINE")
call s:highlight("Ignore",           [245, 242], ["",  "" ], "NONE")
call s:highlight("Error",            [16,  231], [210, 167], "BOLD")
call s:highlight("Todo",             [16,  231], [144, 58 ], "BOLD")

" Custom highlighting groups
call s:highlight("CustomClass",      [146, 103], ["",  "" ], "BOLD")
call s:highlight("TabNumSel",        [230, 58 ], [236, 251], "BOLD")
call s:highlight("TabNum",           [253, 234], [234, 253], "BOLD")
