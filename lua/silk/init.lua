local c = require("silk.palette")

local M = {}

local function set(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

function M.load()

  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  vim.o.background = "dark"
  vim.g.colors_name = "silk"



  -- ui
  set("Normal",        { bg = c.bg, fg = c.fg })
  set("NormalNC",      { link = "Normal" })
  set("NormalFloat",   { link = "Normal" })
  set("FloatBorder",   { link = "Normal" })
  set("FloatTitle",    { fg = c.g5 })
  set("FloatFooter",   { fg = c.g4 })
  set("MsgArea",       { link = "Normal" })
  set("MsgSeparator",  { fg = c.g3 })
  set("EndOfBuffer",   { fg = c.bg })
  set("NonText",       { fg = c.g2 })
  set("Whitespace",    { fg = c.g2 })
  set("SpecialKey",    { fg = c.g2 })
  set("Conceal",       { fg = c.g3 })

  set("Cursor",        { fg = c.bg, bg = c.fg })
  set("lCursor",       { link = "Cursor" })
  set("CursorIM",      { link = "Cursor" })
  set("TermCursor",    { link = "Cursor" })
  set("TermCursorNC",  { fg = c.bg, bg = c.g3 })
  set("CursorLine",    { bg = c.g0 })
  set("CursorColumn",  { bg = c.g0 })
  set("ColorColumn",   { bg = c.g0 })

  set("Visual",        { bg = c.g1 })
  set("VisualNOS",     { link = "Visual" })
  set("MatchParen",    { bg = c.g2, fg = c.g5 })
  set("Search",        { bg = c.yellow0, fg = c.bg })
  set("IncSearch",     { bg = c.yellow0, fg = c.bg })
  set("CurSearch",     { bg = c.yellow1, fg = c.bg })
  set("Substitute",    { bg = c.red0, fg = c.bg })
  set("QuickFixLine",  { bg = c.g1 })

  set("Directory",     { fg = c.teal0 })
  set("Title",         { fg = c.g5, bold = true })


  -- gutter
  set("LineNr",          { fg = c.g3 })
  set("LineNrAbove",     { link = "LineNr" })
  set("LineNrBelow",     { link = "LineNr" })
  set("CursorLineNr",    { bg = c.g0, fg = c.g5 })
  set("CursorLineSign",  { bg = c.g0 })
  set("CursorLineFold",  { bg = c.g0, fg = c.g3 })
  set("SignColumn",      { bg = c.bg })
  set("FoldColumn",      { fg = c.g3 })
  set("Folded",          { fg = c.g4 })


  -- bars
  set("StatusLine",        { bg = c.bg, fg = c.fg })
  set("StatusLineNC",      { bg = c.bg, fg = c.g4 })
  set("StatusLineTerm",    { link = "StatusLine" })
  set("StatusLineTermNC",  { link = "StatusLineNC" })
  set("WinBar",            { bg = c.bg, fg = c.fg })
  set("WinBarNC",          { bg = c.bg, fg = c.g4 })
  set("VertSplit",         { fg = c.g3 })
  set("WinSeparator",      { link = "VertSplit" })
  set("TabLine",           { bg = c.g0, fg = c.g4 })
  set("TabLineSel",        { bg = c.bg, fg = c.g5 })
  set("TabLineFill",       { bg = c.g0 })


  -- messages
  set("ModeMsg",     { fg = c.fg })
  set("MoreMsg",     { fg = c.green0 })
  set("Question",    { fg = c.green0 })
  set("OkMsg",       { fg = c.green0 })
  set("WarningMsg",  { fg = c.yellow0 })
  set("ErrorMsg",    { fg = c.red0 })
  set("WildMenu",    { link = "PmenuSel" })


  -- popup
  set("Pmenu",          { bg = c.g0, fg = c.fg })
  set("PmenuSel",       { bg = c.g1, fg = c.g5 })
  set("PmenuKind",      { link = "Pmenu" })
  set("PmenuKindSel",   { link = "PmenuSel" })
  set("PmenuExtra",     { bg = c.g0, fg = c.g4 })
  set("PmenuExtraSel",  { bg = c.g1, fg = c.g4 })
  set("PmenuMatch",     { bg = c.g0, fg = c.g5, bold = true })
  set("PmenuMatchSel",  { bg = c.g1, fg = c.g5, bold = true })
  set("PmenuSbar",      { bg = c.g0 })
  set("PmenuThumb",     { bg = c.g3 })


  -- diff
  set("DiffAdd",     { fg = c.green0, bg = c.g0 })
  set("DiffChange",  { bg = c.g0 })
  set("DiffDelete",  { fg = c.red0, bg = c.g0 })
  set("DiffText",    { fg = c.g5, bg = c.g2 })
  set("Added",       { fg = c.green0 })
  set("Changed",     { fg = c.yellow0 })
  set("Removed",     { fg = c.red0 })


  -- spell
  set("SpellBad",    { undercurl = true, sp = c.red0 })
  set("SpellCap",    { undercurl = true, sp = c.yellow0 })
  set("SpellRare",   { undercurl = true, sp = c.peri0 })
  set("SpellLocal",  { undercurl = true, sp = c.teal0 })


  -- diagnostics
  local diagnostics = {
    Error = c.red0,
    Warn  = c.yellow0,
    Info  = c.blue0,
    Hint  = c.teal0,
    Ok    = c.green0,
  }

  for name, color in pairs(diagnostics) do
    set("Diagnostic" .. name,            { fg = color })
    set("DiagnosticVirtualText" .. name, { fg = color })
    set("DiagnosticFloating" .. name,    { fg = color })
    set("DiagnosticSign" .. name,        { fg = color })
    set("DiagnosticUnderline" .. name,   { undercurl = true, sp = color })
  end

  set("DiagnosticDeprecated",   { strikethrough = true, sp = c.red0 })
  set("DiagnosticUnnecessary",  { fg = c.g3 })


  -- syntax
  local plain = {
    "Identifier",
    "Statement",
    "Conditional",
    "Repeat",
    "Label",
    "Operator",
    "Keyword",
    "Exception",
    "PreProc",
    "Include",
    "Define",
    "Macro",
    "PreCondit",
    "Type",
    "StorageClass",
    "Structure",
    "Typedef",
    "Special",
    "SpecialChar",
    "Tag",
    "Delimiter",
    "SpecialComment",
    "Debug",
    "@variable",
    "@function.call",
    "@function.method.call",
  }

  for _, group in ipairs(plain) do
    set(group, { fg = c.fg })
  end


  -- colored
  set("Comment",   { fg = c.yellow1 })
  set("Todo",      { fg = c.bg, bg = c.yellow1 })

  set("String",    { fg = c.green0 })
  set("Character", { link = "String" })

  set("Constant",  { fg = c.peri0 })
  set("Number",    { link = "Constant" })
  set("Boolean",   { link = "Constant" })
  set("Float",     { link = "Constant" })

  set("Function",  { fg = c.blue0 })

  -- misc
  set("Error",       { fg = c.red0, underline = true })
  set("Underlined",  { fg = c.blue1, underline = true })


  -- treesitter
  set("@constant.builtin",  { link = "Constant" })
  set("@string.escape",     { fg = c.green1 })
  set("@string.regexp",     { link = "String" })

  set("@markup.heading",       { link = "Title" })
  set("@markup.strong",        { bold = true })
  set("@markup.italic",        { fg = c.g5 })
  set("@markup.strikethrough", { strikethrough = true })
  set("@markup.underline",     { underline = true })
  set("@markup.link",          { fg = c.g4 })
  set("@markup.link.label",    { fg = c.fg })
  set("@markup.link.url",      { link = "Underlined" })
  set("@markup.raw",           { link = "String" })
  set("@markup.raw.block",     { link = "String" })
  set("@markup.list",          { fg = c.g4 })
  set("@markup.quote",         { fg = c.g4 })


  -- lsp
  set("LspReferenceText",   { bg = c.g1 })
  set("LspReferenceRead",   { bg = c.g1 })
  set("LspReferenceWrite",  { bg = c.g1 })
  set("LspReferenceTarget", { bg = c.g1 })
  set("LspInlayHint",       { fg = c.g3 })
  set("LspCodeLens",        { fg = c.g3 })
  set("LspCodeLensSeparator", { fg = c.g2 })
  set("LspSignatureActiveParameter", { fg = c.g5, underline = true })

  -- semantic tokens
  set("@lsp.type.function",                { })
  set("@lsp.type.method",                  { })
  set("@lsp.typemod.function.declaration", { fg = c.blue0 })
  set("@lsp.typemod.method.declaration",   { fg = c.blue0 })
  set("@lsp.type.enumMember",              { link = "Constant" })
  set("@lsp.typemod.variable.readonly",    { link = "Constant" })


  -- terminal
  local terminal = {
    c.g0, c.red0, c.green0, c.yellow0, c.blue0, c.peri0, c.teal0, c.fg,
    c.g1, c.red1, c.green1, c.yellow1, c.blue1, c.peri1, c.teal1, c.g5,
  }

  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
