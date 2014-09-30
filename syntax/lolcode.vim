" Vim syntax file
" Language:    LOLCODE
" Author:      Three If By Whiskey
" Last Change: 20140930

if exists('b:current_syntax')
	finish
endif

syn match   lolShebang '\%^#!.*$'

syn keyword lolCeremony HAI KTHXBYE

syn keyword lolLibrary SOCKS STDIO STRING contained
syn match   lolInclude 'CAN HAS \w\+?' contains=lolLibrary

syn match   lolNumber '\<\d\+\%(\.\d\+\)\=\>'

syn match   lolEscapedChar ':[)>o":]' contained
syn match   lolString '!'
syn region  lolString start='"' skip=':"' end='"' contains=lolEscapedChar

syn match   lolLineComment 'BTW.*'
syn region  lolBlockComment start='OBTW' end='TLDR'

syn keyword lolType MAEK
syn match   lolType 'A \%(TROOF\|YARN\|NUMBA\=R\|NOOB\|BUKKIT\)'
syn match   lolType 'IS NOW'

syn match   lolMath '\%(DIFF\|SUM\|MOD\|QUOSHUNT\|PRODUKT\) OF'

syn keyword lolBoolean FAIL WIN DIFFRINT NOT
syn match   lolBoolean 'BOTH SAEM'
syn match   lolBoolean '\%(BOTH\|EITHER\|WON\|ALL\|ANY\|BIGGR\|SMALLR\) OF'

syn keyword lolCase OMG OMGWTF

syn keyword lolRepeat TIL WILE UPPIN NERFIN
syn match   lolRepeat 'IM \%(IN\|OUTTA\) YR'

syn keyword lolConditional OIC MEBBE
syn match   lolConditional '\%(O RLY\|WTF\)?'
syn match   lolConditional '\%(YA RLY\|NO WAI\)'

syn keyword lolDeclare ITZ R
syn match   lolDeclare '\%(I \)\=HAS A'

syn keyword lolBuiltin VISIBLE INVISIBLE GIMMEH SMOOSH
syn match   lolBuiltin "STDIO'Z \%(OPEN\|DIAF\|LUK\|SCRIBBEL\|AGEIN\|CLOSE\)"
syn match   lolBuiltin "STRING'Z \%(AT\|LEN\)"
syn match   lolBuiltin "SOCK'Z \%(RESOLV\|BIND\|LISTN\|KONN\|CLOSE\|PUT\|GET\)"

syn match   lolFunction '\i\+' contained

syn match   lolDefine 'HOW IZ I' nextgroup=lolFunction skipwhite
syn match   lolDefine 'IF U SAY SO'
syn match   lolDefine 'I IZ'

syn match   lolAccess "'Z"

syn keyword lolDelimiter AN YR MKAY

syn keyword lolStatement SRS GTFO
syn match   lolStatement 'FOUND YR'

hi link lolAccess StorageClass
hi link lolBlockComment Comment
hi link lolBoolean Boolean
hi link lolBuiltin Function
hi link lolCase Label
hi link lolCeremony PreCondit
hi link lolConditional Conditional
hi link lolDeclare Identifier
hi link lolDefine Define
hi link lolDelimiter Delimiter
hi link lolEscapedChar SpecialChar
hi link lolFunction Function
hi link lolIdentifier Identifier
hi link lolInclude Include
hi link lolLibrary String
hi link lolLineComment Comment
hi link lolMath Number
hi link lolNumber Number
hi link lolRepeat Repeat
hi link lolShebang PreProc
hi link lolStatement Statement
hi link lolString String
hi link lolType Type

let b:current_syntax = 'lolcode'
