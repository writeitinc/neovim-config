vim.cmd([[
colorscheme default

" === Editor Colors ===

hi ColorColumn ctermbg=234

hi LineNr ctermfg=245
hi LineNrAbove ctermfg=240          " <-- when using :set relativenumber
hi def link LineNrBelow LineNrAbove " <--'

hi MatchParen cterm=reverse ctermfg=180 ctermbg=NONE

hi Pmenu ctermfg=15 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=68
hi PmenuSbar ctermbg=240

hi Search ctermfg=NONE ctermbg=NONE cterm=reverse

hi SpecialKey ctermfg=240 " unprintable characters

hi SpellBad ctermbg=52 " used by some plugins to indicate an error
hi SpellCap ctermbg=58 " used by some plugins to indicate a warning

hi StatusLine cterm=bold ctermfg=15 ctermbg=234
hi VertSplit ctermbg=234
hi TabLine cterm=NONE ctermfg=15 ctermbg=0
hi TabLineFill cterm=NONE ctermbg=234

hi Folded ctermfg=0 ctermbg=233

hi Visual ctermbg=238

hi DiffAdd ctermbg=22
hi DiffDelete ctermbg=88
hi DiffChange ctermbg=240
hi DiffText ctermbg=240

" === Language Syntax Colors ===

hi Comment ctermfg=103
hi Constant ctermfg=9
hi Delimiter ctermfg=180
hi Error ctermbg=52
hi Function ctermfg=68
hi Identifier cterm=NONE ctermfg=195 ctermbg=NONE
hi Ignore ctermfg=NONE ctermbg=233
hi Label cterm=bold ctermfg=130
hi Operator ctermfg=130
hi PreProc ctermfg=5
hi Special ctermfg=13
hi Statement ctermfg=130
hi Type ctermfg=10
hi Macro ctermfg=162

hi @attribute ctermfg=6
hi @field ctermfg=159
hi @property ctermfg=159
hi @punctuation.special ctermfg=130
hi @storageclass ctermfg=11
hi @tag ctermfg=120
hi @type.qualifier ctermfg=14

hi def link @lsp.type.property @property
hi def link @lsp.typemod.variable.readonly Constant
hi def link @lsp.type.comment.c Ignore

hi makeIdent ctermfg=14 " built-in (non-treesitter) highlight group
]])
