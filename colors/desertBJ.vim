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

set background=dark

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
  let l:cmd = ""
  if has("gui_running")
    if !empty(a:fg)
      let l:cmd .= "ctermfg=".a:fg." guifg=".s:rgb_dict[a:fg]." "
    endif
    if !empty(a:bg)
      let l:cmd .= "ctermbg=".a:bg." guibg=".s:rgb_dict[a:bg]." "
    endif
    if !empty(a:at)
      let l:cmd .= "cterm=".a:at." gui=".a:at." "
    endif
  else 
    if !empty(a:fg)
      let l:cmd .= "ctermfg=".a:fg." "
    endif
    if !empty(a:bg)
      let l:cmd .= "ctermbg=".a:bg." "
    endif
    if !empty(a:at)
      let l:cmd .= "cterm=".a:at." "
    endif
  endif
  if !empty(l:cmd)
    execute "highlight" a:group l:cmd
  endif
endfunction

if !exists("s:rgb_dict") && has("gui_running")
  let s:rgb_dict = s:construct_rgb_dict()
endif

if get(g:, 'desertBJ_terminal', 1)
  let g:terminal_ansi_colors = [
        \ '#000000', '#ff8787', '#87d787', '#dfdf87', '#87d7ff', '#ffafd7', '#87ffd7', '#e4e4e4',
        \ '#000000', '#ff8787', '#87d787', '#dfdf87', '#87d7ff', '#ffafd7', '#87ffd7', '#ffffff',
        \ ] " 16, 210, 114, 186, 117, 218, 122, 231
endif

" Default highlighting groups
call s:highlight("ColorColumn",      "",  234, "NONE")
call s:highlight("Conceal",          "",  "",   "")
call s:highlight("Cursor",           16,  186, "NONE")
call s:highlight("CursorColumn",     "",  236, "NONE")
call s:highlight("CursorLine",       "",  236, "NONE")
call s:highlight("Directory",        114, "",  "BOLD")
call s:highlight("DiffAdd",          "",  234, "")
call s:highlight("DiffChange",       "",  236, "")
call s:highlight("DiffDelete",       "",  23,  "")
call s:highlight("DiffText",         "",  52,  "")
call s:highlight("EndOfBuffer",      51,  "",  "NONE")
call s:highlight("ErrorMsg",         231, 196, "NONE")
call s:highlight("VertSplit",        236, 236, "NONE")
call s:highlight("Folded",           122, 234, "NONE")
call s:highlight("FoldColumn",       242, 234, "NONE")
call s:highlight("SignColumn",       242, 234, "NONE")
call s:highlight("IncSearch",        94,  230, "NONE")
call s:highlight("LineNr",           137, 234, "NONE")
call s:highlight("LineNrAbove",      137, 234, "NONE")
call s:highlight("LineNrBelow",      137, 234, "NONE")
call s:highlight("CursorLineNr",     137, 234, "BOLD")
call s:highlight("MatchParen",       226, 242, "BOLD")
call s:highlight("ModeMsg",          117, "",  "BOLD")
call s:highlight("MoreMsg",          71,  "",  "NONE")
call s:highlight("NonText",          51,  "",  "NONE")
call s:highlight("Pmenu",            234, 144, "NONE")
call s:highlight("PmenuSel",         230, 94,  "NONE")
call s:highlight("PmenuSbar",        "",  144, "NONE")
call s:highlight("PmenuThumb",       "",  253, "NONE")
call s:highlight("Question",         71,  "",  "BOLD")
call s:highlight("QuickFixLine",     "",  234, "UNDERLINE")
call s:highlight("Search",           230, 94,  "NONE")
call s:highlight("SpecialKey",       240, "",  "NONE")
call s:highlight("SpellBad",         210, 236, "NONE")
call s:highlight("SpellCap",         235, 117, "NONE")
call s:highlight("SpellLocal",       235, 122, "NONE")
call s:highlight("SpellRare",        218, 236, "NONE")
call s:highlight("StatusLine",       16,  144, "BOLD")
call s:highlight("StatusLineNC",     253, 236, "NONE")
call s:highlight("StatusLineTerm",   16,  108, "BOLD")
call s:highlight("StatusLineTermNC", 108, 236, "NONE")
call s:highlight("TabLine",          245, 234, "NONE")
call s:highlight("TabLineFill",      180, 234, "NONE")
call s:highlight("TabLineSel",       230, 236, "BOLD")
call s:highlight("Terminal",         "",  "",  "")
call s:highlight("Title",            167, "",  "BOLD")
call s:highlight("Visual",           235, 215, "NONE")
call s:highlight("WarningMsg",       210, "",  "BOLD")
call s:highlight("WildMenu",         253, 235, "NONE")

" Syntax highlighting groups
call s:highlight("Comment",          114, "",  "NONE")

call s:highlight("Constant",         210, "",  "NONE")
call s:highlight("String",           210, "",  "NONE")
call s:highlight("Character",        210, "",  "NONE")
call s:highlight("Number",           180, "",  "NONE")
call s:highlight("Boolean",          180, "",  "NONE")
call s:highlight("Float",            180, "",  "NONE")

call s:highlight("Identifier",       117, "",  "NONE")
call s:highlight("Function",         117, "",  "NONE")

call s:highlight("Statement",        186, "",  "BOLD")
call s:highlight("Conditional",      186, "",  "BOLD")
call s:highlight("Repeat",           186, "",  "BOLD")
call s:highlight("Label",            186, "",  "BOLD")
call s:highlight("Operator",         180, "",  "BOLD")
call s:highlight("Keyword",          186, "",  "BOLD")
call s:highlight("Exception",        186, "",  "BOLD")

call s:highlight("PreProc",          218, "",  "NONE")
call s:highlight("Include",          218, "",  "NONE")
call s:highlight("Define",           218, "",  "NONE")
call s:highlight("Macro",            218, "",  "NONE")
call s:highlight("PreCondit",        218, "",  "NONE")

call s:highlight("Type",             215, "",  "BOLD")
call s:highlight("StorageClass",     215, "",  "BOLD")
call s:highlight("Structure",        215, "",  "BOLD")
call s:highlight("Typedef",          215, "",  "BOLD")

call s:highlight("Special",          122, "",  "NONE")
call s:highlight("SpecialChar",      122, "",  "NONE")
call s:highlight("Tag",              122, "",  "NONE")
call s:highlight("Delimiter",        245, "",  "BOLD")
call s:highlight("SpecialComment",   122, "",  "NONE")
call s:highlight("Debug",            122, "",  "NONE")

call s:highlight("Underlined",       117,  "",  "UNDERLINE")
call s:highlight("Ignore",           245, "",  "NONE")
call s:highlight("Error",            16,  210, "BOLD")
call s:highlight("Todo",             16,  144, "BOLD")

" Custom highlighting groups
call s:highlight("CustomClass",      146, "",  "BOLD")
call s:highlight("TabNumSel",        230, 236, "BOLD")
call s:highlight("TabNum",           253, 234, "BOLD")
