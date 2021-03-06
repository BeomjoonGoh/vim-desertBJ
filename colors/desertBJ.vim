" Vim color file
" Language:    vim
" Maintainer:  Beomjoon Goh
" Last Change: 16 Jan 2020 04:23:59 +0900

" disable under win32 colsole
if has("win32") && !has("gui_running")
  finish
endif

set background=dark
if version > 580
  " no guarantees for version 5.8 and below, but this makes it stop
  " complaining
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name="desertBJ"

" highlight groups
highlight ColorColumn       ctermfg=NONE ctermbg=234  cterm=NONE
highlight Cursor            ctermfg=016  ctermbg=226  cterm=NONE
highlight CursorLineNr      ctermfg=180  ctermbg=234  cterm=BOLD
highlight DiffAdd           ctermfg=NONE ctermbg=234
highlight DiffChange        ctermfg=NONE ctermbg=236
highlight DiffDelete        ctermfg=114  ctermbg=234  cterm=UNDERLINE
highlight DiffText          ctermfg=NONE ctermbg=052  cterm=NONE
highlight Error             ctermfg=016  ctermbg=210  cterm=BOLD
highlight ErrorMsg          ctermfg=231  ctermbg=196  cterm=NONE
highlight FoldColumn        ctermfg=242  ctermbg=234  cterm=NONE
highlight Folded            ctermfg=122  ctermbg=234  cterm=NONE
highlight IncSearch         ctermfg=094  ctermbg=230  cterm=NONE
highlight LineNr            ctermfg=180  ctermbg=234  cterm=NONE
highlight MatchParen        ctermfg=226  ctermbg=241  cterm=BOLD
highlight ModeMsg           ctermfg=117               cterm=NONE
highlight MoreMsg           ctermfg=029               cterm=NONE
highlight NonText           ctermfg=051  ctermbg=NONE cterm=NONE
highlight Pmenu             ctermfg=234  ctermbg=144  cterm=NONE
highlight PmenuSel          ctermfg=230  ctermbg=094  cterm=NONE
highlight Question          ctermfg=048               cterm=NONE
highlight QuickFixLine      ctermbg=234               cterm=UNDERLINE
highlight Search            ctermfg=230  ctermbg=094  cterm=NONE
highlight SpecialKey        ctermfg=240               cterm=NONE
highlight SpellBad          ctermfg=210  ctermbg=236  cterm=NONE
highlight SpellCap          ctermfg=235  ctermbg=117  cterm=NONE
highlight SpellRare         ctermfg=013  ctermbg=236  cterm=NONE
highlight StatusLine        ctermfg=016  ctermbg=144  cterm=BOLD
highlight StatusLineNC      ctermfg=253  ctermbg=236  cterm=NONE
highlight StatusLineTerm    ctermfg=016  ctermbg=108  cterm=BOLD
highlight StatusLineTermNC  ctermfg=108  ctermbg=236  cterm=NONE
highlight TabLine           ctermfg=245  ctermbg=234  cterm=NONE
highlight TabLineFill       ctermfg=180  ctermbg=234  cterm=NONE
highlight TabLineSel        ctermfg=230  ctermbg=236  cterm=BOLD
highlight Title             ctermfg=167               cterm=NONE
highlight VertSplit         ctermfg=236  ctermbg=236  cterm=NONE
highlight Visual            ctermfg=235  ctermbg=215  cterm=NONE
highlight WarningMsg        ctermfg=210               cterm=BOLD
highlight WildMenu          ctermfg=253  ctermbg=235  cterm=NONE

" syntax highlighting groups
highlight Boolean           ctermfg=180  cterm=NONE
highlight Comment           ctermfg=114  cterm=NONE
highlight Constant          ctermfg=210  cterm=NONE
highlight Delimiter         ctermfg=245  cterm=BOLD
highlight Function          ctermfg=117  cterm=NONE
highlight Identifier        ctermfg=117  cterm=NONE
highlight Ignore            ctermfg=245  cterm=NONE
highlight Number            ctermfg=180  cterm=NONE
highlight Operator          ctermfg=180  cterm=BOLD
highlight PreProc           ctermfg=218  cterm=NONE
highlight Special           ctermfg=122  cterm=NONE
highlight Statement         ctermfg=186  cterm=BOLD
highlight String            ctermfg=210  cterm=NONE
highlight Todo              ctermfg=016  ctermbg=144  cterm=BOLD
highlight Type              ctermfg=215  cterm=BOLD

" custom highlighting groups
highlight CustomClass       ctermfg=103  cterm=BOLD
highlight TabNumSel         ctermfg=230  ctermbg=236  cterm=BOLD
highlight TabNum            ctermfg=253  ctermbg=234  cterm=BOLD
