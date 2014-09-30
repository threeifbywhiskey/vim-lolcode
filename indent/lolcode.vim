" Vim indent file
" Language:    LOLCODE
" Author:      Three If By Whiskey
" Last Change: 20140930

if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

if exists('*GetLolIndent')
  finish
endif

setlocal indentexpr=GetLolIndent()

" Automatically reindent on:
"   OI[C], MEBB[E], NO WA[I], GTF[O]/IF U SAY S[O], IM OUTTA Y[R], and YA RL[Y].
setlocal indentkeys+=CEI<O>RY

" Seek backward from `start` and return the indent of the first line which
" matches `open` when there is no nesting, as defined by `open` and `close`.
function GetLolMatch(start, open, close)
  let line = a:start
  let nested = 0

  while nested || getline(line) !~ a:open
    if getline(line) =~ a:close
      let nested += 1
    elseif getline(line) =~ a:open
      let nested -= 1
    endif
    let line -= 1
  endwhile

  return indent(line)
endfunction

function GetLolIndent()
  let lnum = prevnonblank(v:lnum - 1)

  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)

  " Align branch conditions with their siblings.
  if getline(v:lnum) =~ '\s*\(MEBBE\|NO WAI\|YA RLY\)'
    let ind = GetLolMatch(v:lnum - 1, 'O RLY?$', '^\s*OIC') + &sw
  endif

  " Indent multiple-expression branch bodies.
  if getline(v:lnum - 1) =~ '\s*MEBBE\|\(NO WAI\|YA RLY\)$'
    let ind += &sw
  endif

  " Indent case, function, and loop bodies.
  if getline(v:lnum - 1) =~ '^\s*\(HOW IZ I\|IM IN YR\|OMG\)'
    let ind += &sw
  endif

  " Dedent upon closing function, loop, and switch bodies.
  if getline(v:lnum) =~ '^\s*\(GTFO\|IF U SAY SO\|IM OUTTA YR\)'
    let ind -= &sw
  endif

  " Find the matching O RLY? or WTF? for this OIC and dedent accordingly.
  if getline(v:lnum) =~ '^\s*OIC'
    let ind = GetLolMatch(v:lnum - 1, '\(O RLY\|WTF\)?$', '^\s*OIC')
  endif

  return ind
endfunction
